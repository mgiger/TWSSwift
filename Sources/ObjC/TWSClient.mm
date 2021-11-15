//
//  TWSClient.m
//  TWSAPI
//
//  Created by Matthew Giger on 10/3/21.
//

#import "TWSClient.h"
#import "TWSContract.h"
#import "TWSContract_private.h"
#import "TWSWrapper_private.h"
#import "TWSTagValue_private.h"
#import "TWSOrder_private.h"

#include "EClientSocket.h"
#include "EPosixClientSocketPlatform.h"
#include "EReaderOSSignal.h"
#include "EReader.h"
#include "Contract.h"
#include "Order.h"
#include "OrderState.h"
#include "Execution.h"
#include "CommissionReport.h"

#include "DefaultEWrapper.h"

class EClientSocket;

static NSInteger sMainClientId;			// Just use the last one created

@interface TWSClient()
{
	EReaderOSSignal osSignal;
	EWrapper* eWrapper;
	std::unique_ptr<EClientSocket> client;
	std::unique_ptr<EReader> reader;
}

@property (nonnull, strong)	NSDateFormatter*	formatter;

@end

@implementation TWSClient

+ (NSInteger)mainClientId
{
	return sMainClientId;
}

- (nonnull instancetype)initWithWrapper:(nonnull id<TWSServiceProtocol, TWSContractProtocol, TWSSnapshotDataProtocol, TWSOrdersProtocol, TWSAccountProtocol, TWSSearchProtocol>)wrapper
{
	if(self = [super init]) {
		
		osSignal = 2000; //2-seconds timeout
		eWrapper = new TWSWrapperWrapper(wrapper);
		client.reset(new EClientSocket(eWrapper, &osSignal));
		
		_clientId = -1;
		_formatter = [[NSDateFormatter alloc] init];
		_formatter.dateFormat = @"yyyyMMdd HH:mm:ss";
	}
	return self;
}

- (void)dealloc
{
	if( reader )
		reader.reset();
}

- (BOOL)connect:(nonnull NSString*)host port:(NSInteger)port clientId:(NSInteger)clientId
{
	bool bRes = client->eConnect( host.UTF8String, (int)port, (int)clientId, NO);
	
	if (bRes) {
		_clientId = clientId;
		reader = std::unique_ptr<EReader>( new EReader(client.get(), &osSignal) );
		reader->start();
	}
	else
		NSLog(@"Cannot connect");
	
	// Process messages on a thread
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		
		while(self.isConnected) {
			self->osSignal.waitForSignal();
			errno = 0;
			self->reader->processMsgs();
		}
		
	});
	
	return bRes;
}

- (void)disconnect
{
	client->eDisconnect();
}

- (BOOL)isConnected
{
	return client->isConnected();
}

- (void)reqContractDetails:(NSInteger)reqId
				  contract:(nonnull TWSContract*)contract
{
	client->reqContractDetails((int)reqId, contract.contract);
}

- (void)reqMktData:(NSInteger)tickerId
		  contract:(nonnull TWSContract*)contract
	  genericTicks:(NSInteger)genericTicks
		  snapshot:(BOOL)snapshot
regulatorySnaphsot:(BOOL)regulatorySnaphsot
{
	NSMutableArray* ticks = [NSMutableArray array];
	if(genericTicks & TWSTickOptionVolume)					[ticks addObject:@"100"];
	if(genericTicks & TWSTickOpenInterest)					[ticks addObject:@"101"];
	if(genericTicks & TWSTickHistoricalVolatility)			[ticks addObject:@"104"];
	if(genericTicks & TWSTickAverageOptionVolume)			[ticks addObject:@"105"];
	if(genericTicks & TWSTickOptionImpliedVolatility)		[ticks addObject:@"106"];
	if(genericTicks & TWSTickIndexFuturePremium)			[ticks addObject:@"162"];
	if(genericTicks & TWSTickMiscellaneousStats)			[ticks addObject:@"165"];
	if(genericTicks & TWSTickMarkPrice)						[ticks addObject:@"221"];
	if(genericTicks & TWSTickAuctionValues)					[ticks addObject:@"225"];
	if(genericTicks & TWSTickRTVolume)						[ticks addObject:@"233"];
	if(genericTicks & TWSTickShortable)						[ticks addObject:@"236"];
	if(genericTicks & TWSTickInventory)						[ticks addObject:@"256"];
	if(genericTicks & TWSTickFundamentalRatios)				[ticks addObject:@"258"];
	if(genericTicks & TWSTickRealtimeHistoricalVolatility)	[ticks addObject:@"411"];
	if(genericTicks & TWSTickIBDividends)					[ticks addObject:@"456"];

	NSString* tickList = [ticks componentsJoinedByString:@","];
	
	client->reqMktData(tickerId,
					   contract.contract,
					   tickList.UTF8String,
					   snapshot,
					   regulatorySnaphsot,
					   nil);
}

- (void)cancelMktData:(NSInteger)tickerId
{
	client->cancelMktData(tickerId);
}

- (void)reqSecDefOptParams:(NSInteger)reqId
		  underlyingSymbol:(nonnull NSString*)underlyingSymbol
			futFopExchange:(nonnull NSString*)futFopExchange
		 underlyingSecType:(nonnull NSString*)underlyingSecType
		   underlyingConId:(NSInteger)underlyingConId
{
	client->reqSecDefOptParams((int)reqId, underlyingSymbol.UTF8String, futFopExchange.UTF8String, underlyingSecType.UTF8String, (int)underlyingConId);
}

- (void)reqHistoricalData:(NSInteger)tickerId
				 contract:(nonnull TWSContract*)contract
			  endDateTime:(nonnull NSDate*)endDateTime
			  durationStr:(nonnull NSString*)durationStr
				  barSize:(TWSBarSize)barSize
				 dataType:(TWSHistoricalDataType)dataType
				   useRTH:(BOOL)useRTH
			 keepUpToDate:(BOOL)keepUpToDate;
{
	std::string whatToShow;
	switch (dataType) {
		case TWSHistoricalDataTypeTrades:					whatToShow = "TRADES";					break;
		case TWSHistoricalDataTypeMidpoint:					whatToShow = "MIDPOINT";				break;
		case TWSHistoricalDataTypeBid:						whatToShow = "BID";						break;
		case TWSHistoricalDataTypeAsk:						whatToShow = "ASK";						break;
		case TWSHistoricalDataTypeBidAsk:					whatToShow = "BID_ASK";					break;
		case TWSHistoricalDataTypeHistoricalVolatility:		whatToShow = "HISTORICAL_VOLATILITY";	break;
		case TWSHistoricalDataTypeOptionImpliedVolatility:	whatToShow = "OPTION_IMPLIED_VOLATILITY";	break;
		case TWSHistoricalDataTypeFeeRate:					whatToShow = "FEE_RATE";				break;
		case TWSHistoricalDataTypeRebateRate:				whatToShow = "REBATE_RATE";				break;
	}
	
	std::string barSizeStr = "5 mins";
	NSString* barSizeNSString = [[TWSAPIGlobals barSizeTypes] objectForKey:@((NSInteger)barSize)];
	if(barSizeNSString != nil)
	{
		barSizeStr = barSizeNSString.UTF8String;
	}
	
	NSString* endDateStr = [_formatter stringFromDate:endDateTime];
	
	client->reqHistoricalData(tickerId,
								 contract.contract,
								 endDateStr.UTF8String,
								 durationStr.UTF8String,
								 barSizeStr,
								 whatToShow,
								 useRTH ? 1 : 0,
								 2,
								 keepUpToDate,
								 nil);
}

- (void)cancelHistoricalData:(NSInteger)tickerId
{
	client->cancelHistoricalData(tickerId);
}

- (void)fetchOpenOrders
{
	client->reqOpenOrders();
}

- (void)placeOrder:(NSInteger)orderId
			 order:(nonnull TWSOrder*)order
		  contract:(nonnull TWSContract*)contract
{
	client->placeOrder(orderId, contract.contract, order.order);
}

- (void)cancelOrder:(NSInteger)orderId
{
	client->cancelOrder(orderId);
}

- (void)reqAccountUpdates:(BOOL)subscribe
				 acctCode:(nonnull NSString*)acctCode
{
	client->reqAccountUpdates(subscribe, acctCode.UTF8String);
}

- (void)reqPositions
{
	client->reqPositions();
}

- (void)cancelPositions
{
	client->cancelPositions();
}

- (void)reqMatchingSymbols:(NSInteger)reqId
				   pattern:(nonnull NSString*)pattern
{
	client->reqMatchingSymbols(reqId, pattern.UTF8String);
}

@end

