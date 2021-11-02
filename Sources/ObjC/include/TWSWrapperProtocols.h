//
//  TWSWrapperProtocols.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/5/21.
//

#import <Foundation/Foundation.h>
#import "TWSDefines.h"

@class TWSBar;
@class TWSContractDetails;
@class TWSContract;
@class TWSOrderState;
@class TWSOrder;


@protocol TWSServiceProtocol

- (void)connectionClosed;

- (void)error:(NSInteger)id errorCode:(NSInteger)errorCode errorString:(nonnull NSString*)errorString;

@end


@protocol TWSContractProtocol

- (void)contractDetails:(NSInteger)reqId
		contractDetails:(nonnull TWSContractDetails*)contractDetails;

- (void)contractDetailsEnd:(NSInteger)reqId;
	
- (void)securityDefinitionOptionParameter:(NSInteger)reqId
								 exchange:(nonnull NSString*)exchange
						  underlyingConId:(NSInteger)underlyingConId
							 tradingClass:(nonnull NSString*)tradingClass
							   multiplier:(nonnull NSString*)multiplier
							  expirations:(nonnull NSArray<NSString*>*)expirations
								  strikes:(nonnull NSArray<NSNumber*>*)strikes;

- (void)securityDefinitionOptionParameterEnd:(NSInteger)reqId;

@end


@protocol TWSSnapshotDataProtocol

- (void)historicalData:(NSInteger)reqId
				   bar:(nonnull TWSBar*)bar;

- (void)historicalDataEnd:(NSInteger)reqId
			 startDateStr:(nonnull NSString*)startDateStr
			   endDateStr:(nonnull NSString*)endDateStr;

- (void)tickPrice:(NSInteger)tickerId
			field:(TWSTickType)field
			price:(double)price;
//		  attribs:(TWSTickAttrib)attribs;

- (void)tickSize:(NSInteger)tickerId
			field:(TWSTickType)field
			size:(NSInteger)size;

- (void)tickString:(NSInteger)tickerId
		  tickType:(TWSTickType)tickType
			 value:(nonnull NSString*)value;

- (void)tickEFP:(NSInteger)tickerId
	   tickType:(TWSTickType)tickType
	basisPoints:(double)basisPoints
	formattedBasisPoints:(nonnull NSString*)formattedBasisPoints
 totalDividends:(double)totalDividends
	   holdDays:(NSInteger)holdDays
	futureLastTradeDate:(nonnull NSString*)futureLastTradeDate
 dividendImpact:(double)dividendImpact
	dividendsToLastTradeDate:(double)dividendsToLastTradeDate;

- (void)tickGeneric:(NSInteger)tickerId
		   tickType:(TWSTickType)tickType
			  value:(double)value;

- (void)tickOptionComputation:(NSInteger)tickerId
					 tickType:(TWSTickType)tickType
				   tickAttrib:(NSInteger)tickAttrib
				   impliedVol:(double)impliedVol
						delta:(double)delta
					 optPrice:(double)optPrice
				   pvDividend:(double)pvDividend
						gamma:(double)gamma
						 vega:(double)vega
						theta:(double)theta
					 undPrice:(double)undPrice;

- (void)tickSnapshotEnd:(NSInteger)tickerId;

@end


@protocol TWSOrdersProtocol

- (void)nextValidId:(NSInteger)orderId;

- (void)openOrder:(NSInteger)orderId
		 contract:(nonnull TWSContract*)contract
			order:(nonnull TWSOrder*)order
	   orderState:(nonnull TWSOrderState*)orderState;

- (void)openOrderEnd;

- (void)orderStatus:(NSInteger)orderId
			 status:(TWSOrderStatus)status
			 filled:(double)filled
		  remaining:(double)remaining
	   avgFillPrice:(double)avgFillPrice
			 permId:(NSInteger)permId
		   parentId:(NSInteger)parentId
	  lastFillPrice:(double)lastFillPrice
		   clientId:(NSInteger)clientId
			whyHeld:(nonnull NSString*)whyHeld
		mktCapPrice:(double)mktCapPrice;

@end


@protocol TWSAccountProtocol

- (void)managedAccounts:(nonnull NSArray<NSString*>*)accounts;

- (void)updateAccountValue:(TWSAccountValueType)type
					 value:(nonnull NSString*)value
				  currency:(nonnull NSString*)currency
			   accountName:(nonnull NSString*)accountName;

- (void)updatePortfolio:(nonnull TWSContract*)contract
			   position:(double)position
			marketPrice:(double)marketPrice
			marketValue:(double)marketValue
			averageCost:(double)averageCost
		  unrealizedPNL:(double)unrealizedPNL
			realizedPNL:(double)realizedPNL
			accountName:(nonnull NSString*)accountName;

- (void)updateAccountTime:(nonnull NSDate*)time;

- (void)accountDownloadEnd:(nonnull NSString*)accountName;

- (void)position:(nonnull NSString*)account
		contract:(nonnull TWSContract*)contract
		position:(double)position
		 avgCost:(double)avgCost;

- (void)positionEnd;


@end
