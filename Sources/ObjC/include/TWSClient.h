//
//  TWSClient.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/3/21.
//

#import <Foundation/Foundation.h>
#import "TWSDefines.h"

@protocol TWSServiceProtocol, TWSContractProtocol, TWSSnapshotDataProtocol, TWSOrdersProtocol, TWSAccountProtocol;
@class TWSWrapper;
@class TWSContract;
@class TWSTagValue;
@class TWSOrder;

@interface TWSClient : NSObject

+ (NSInteger)mainClientId;

@property (assign)		NSInteger	clientId;


- (nonnull instancetype)initWithWrapper:(nonnull id<TWSServiceProtocol, TWSContractProtocol, TWSSnapshotDataProtocol, TWSOrdersProtocol, TWSAccountProtocol>)wrapper;

- (BOOL)connect:(nonnull NSString*)host port:(NSInteger)port clientId:(NSInteger)clientId;

- (void)disconnect;

- (BOOL)isConnected;

- (void)reqContractDetails:(NSInteger)reqId
				  contract:(nonnull TWSContract*)contract;

- (void)reqMktData:(NSInteger)tickerId
		  contract:(nonnull TWSContract*)contract
	  genericTicks:(NSInteger)genericTicks
		  snapshot:(BOOL)snapshot
regulatorySnaphsot:(BOOL)regulatorySnaphsot;

- (void)cancelMktData:(NSInteger)tickerId;

- (void)reqSecDefOptParams:(NSInteger)reqId
		  underlyingSymbol:(nonnull NSString*)underlyingSymbol
			futFopExchange:(nonnull NSString*)futFopExchange
		 underlyingSecType:(nonnull NSString*)underlyingSecType
		   underlyingConId:(NSInteger)underlyingConId;

- (void)reqHistoricalData:(NSInteger)tickerId
				 contract:(nonnull TWSContract*)contract
			  endDateTime:(nonnull NSDate*)endDateTime
			  durationStr:(nonnull NSString*)durationStr
				  barSize:(TWSBarSize)barSize
				 dataType:(TWSHistoricalDataType)dataType
				   useRTH:(BOOL)useRTH
			 keepUpToDate:(BOOL)keepUpToDate;

- (void)cancelHistoricalData:(NSInteger)tickerId;

- (void)fetchOpenOrders;

- (void)placeOrder:(NSInteger)orderId
			 order:(nonnull TWSOrder*)order
		  contract:(nonnull TWSContract*)contract;

- (void)cancelOrder:(NSInteger)orderId;

- (void)reqAccountUpdates:(BOOL)subscribe
				 acctCode:(nonnull NSString*)acctCode;


- (void)reqPositions;

- (void)cancelPositions;

@end
