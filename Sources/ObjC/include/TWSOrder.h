//
//  TWSOrder.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/21/21.
//

#import <Foundation/Foundation.h>
#import "TWSDefines.h"

@interface TWSOrder : NSObject

@property (assign)	NSInteger			orderId;
@property (assign)	NSInteger			clientId;
@property (assign)	TWSOrderAction		action;
@property (assign)	TWSTimeInForce		timeInForce;
@property (assign)	TWSOrderType		orderType;
@property (assign)	double				totalQuantity;
@property (assign)	double				limitPrice;
@property (assign)	double				trailStopPrice;
@property (assign)	double				trailingPercent;
@property (assign)	double				lmtPriceOffset;
@property (assign)	double				auxPrice;
@property (assign)	BOOL				allOrNone;
@property (assign)	BOOL				whatIf;
@property (nonnull, strong) NSString*	account;

@end
