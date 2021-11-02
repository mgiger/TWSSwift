//
//  TWSOrderState.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/21/21.
//

#import <Foundation/Foundation.h>
#import "TWSDefines.h"

@interface TWSOrderState : NSObject

@property (assign)	TWSOrderStatus		status;

@property (nonnull, strong)	NSString*	initialMarginBefore;
@property (nonnull, strong)	NSString*	maintMarginBefore;
@property (nonnull, strong)	NSString*	equityWithLoanBefore;
@property (nonnull, strong)	NSString*	initialMarginChange;
@property (nonnull, strong)	NSString*	maintMarginChange;
@property (nonnull, strong)	NSString*	equityWithLoanChange;
@property (nonnull, strong)	NSString*	initialMarginAfter;
@property (nonnull, strong)	NSString*	maintMarginAfter;
@property (nonnull, strong)	NSString*	equityWithLoanAfter;

@property (assign)			double		commission;
@property (assign)			double		minCommission;
@property (assign)			double		maxCommission;

@property (nonnull, strong)	NSString*	commissionCurrency;

@property (nonnull, strong)	NSString*	warningText;

@property (nonnull, strong)	NSString*	completedTime;
@property (nonnull, strong)	NSString*	completedStatus;

@end

