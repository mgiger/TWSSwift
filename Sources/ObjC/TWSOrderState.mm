//
//  TWSOrderState.m
//  TWSAPI
//
//  Created by Matthew Giger on 10/21/21.
//

#import "TWSOrderState.h"
#import "TWSOrderState_private.h"
#import "TWSDefines.h"

@implementation TWSOrderState

- (nonnull instancetype)init
{
	if(self = [super init])
	{
		_status = TWSOrderStatusApiPending;
		_commission = UNSET_DOUBLE;
		_minCommission = UNSET_DOUBLE;
		_maxCommission = UNSET_DOUBLE;
	}
	return self;
}

- (nonnull instancetype)initWithOrderState:(const OrderState &)orderState
{
	if(self = [super init])
	{
		NSString* statusString = [NSString stringWithUTF8String:orderState.status.c_str()];
		NSNumber* value = [[TWSAPIGlobals orderStatusTypes] valueForKey:statusString];
		_status = (value != nil) ? (TWSOrderStatus)value.integerValue : TWSOrderStatusApiPending;
		
		_initialMarginBefore = [NSString stringWithUTF8String:orderState.initMarginBefore.c_str()];
		_maintMarginBefore = [NSString stringWithUTF8String:orderState.maintMarginBefore.c_str()];
		_equityWithLoanBefore = [NSString stringWithUTF8String:orderState.equityWithLoanBefore.c_str()];
		_initialMarginChange = [NSString stringWithUTF8String:orderState.initMarginChange.c_str()];
		_maintMarginChange = [NSString stringWithUTF8String:orderState.maintMarginChange.c_str()];
		_equityWithLoanChange = [NSString stringWithUTF8String:orderState.equityWithLoanChange.c_str()];
		_initialMarginAfter = [NSString stringWithUTF8String:orderState.initMarginAfter.c_str()];
		_maintMarginAfter = [NSString stringWithUTF8String:orderState.maintMarginAfter.c_str()];
		_equityWithLoanAfter = [NSString stringWithUTF8String:orderState.equityWithLoanAfter.c_str()];

		_commission = orderState.commission;
		_minCommission = orderState.minCommission;
		_maxCommission = orderState.maxCommission;
		_commissionCurrency = [NSString stringWithUTF8String:orderState.commissionCurrency.c_str()];

		_warningText = [NSString stringWithUTF8String:orderState.warningText.c_str()];

		_completedTime = [NSString stringWithUTF8String:orderState.completedTime.c_str()];
		_completedStatus = [NSString stringWithUTF8String:orderState.completedStatus.c_str()];
	}
	return self;
}

@end
