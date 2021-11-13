//
//  TWSDefines.m
//  TWSAPI
//
//  Created by Matthew Giger on 10/23/21.
//

#import <Foundation/Foundation.h>
#import "TWSDefines.h"


@implementation TWSAPIGlobals


+ (nonnull NSDictionary<NSNumber*, NSString*>*)barSizeTypes
{
	static dispatch_once_t once;
	static NSDictionary<NSNumber*, NSString*>* sharedInstance;
	dispatch_once(&once,  ^{
		sharedInstance = @{
			@(TWSBarSizeSecond): @"1 sec",
			@(TWSBarSizeSeconds5): @"5 secs",
			@(TWSBarSizeSeconds10): @"10 secs",
			@(TWSBarSizeSeconds15): @"15 secs",
			@(TWSBarSizeSeconds30): @"30 secs",
			@(TWSBarSizeMinute): @"1 min",
			@(TWSBarSizeMinutes2): @"2 mins",
			@(TWSBarSizeMinutes3): @"3 mins",
			@(TWSBarSizeMinutes5): @"5 mins",
			@(TWSBarSizeMinutes10): @"10 mins",
			@(TWSBarSizeMinutes15): @"15 mins",
			@(TWSBarSizeMinutes20): @"20 mins",
			@(TWSBarSizeMinutes30): @"30 mins",
			@(TWSBarSizeHour): @"1 hour",
			@(TWSBarSizeHours2): @"2 hours",
			@(TWSBarSizeHours3): @"3 hours",
			@(TWSBarSizeHours4): @"4 hours",
			@(TWSBarSizeHours8): @"8 hours",
			@(TWSBarSizeDay): @"1 day",
			@(TWSBarSizeWeek): @"1 week",
		};
	});
	return sharedInstance;
}

+ (nonnull NSDictionary<NSString*, NSNumber*>*)orderStatusTypes
{
	static dispatch_once_t once;
	static NSDictionary<NSString*, NSNumber*>* sharedInstance;
	dispatch_once(&once,  ^{
		sharedInstance = @{
			@"ApiPending": @(TWSOrderStatusApiPending),
			@"PendingSubmit": @(TWSOrderStatusPendingSubmit),
			@"PendingCancel": @(TWSOrderStatusPendingCancel),
			@"PreSubmitted": @(TWSOrderStatusPreSubmitted),
			@"Submitted": @(TWSOrderStatusSubmitted),
			@"ApiCancelled": @(TWSOrderStatusApiCancelled),
			@"Cancelled": @(TWSOrderStatusCancelled),
			@"Filled": @(TWSOrderStatusFilled),
			@"Inactive": @(TWSOrderStatusInactive),
		};
	});
	return sharedInstance;
}

+ (nonnull NSDictionary<NSString*, NSNumber*>*)accountValueTypes
{
	static dispatch_once_t once;
	static NSDictionary<NSString*, NSNumber*>* sharedInstance;
	dispatch_once(&once,  ^{
		sharedInstance = @{
			@"AccountCode": @(TWSAccountValueTypeAccountCode),
			@"AccountOrGroup": @(TWSAccountValueTypeAccountOrGroup),
			@"AccountReady": @(TWSAccountValueTypeAccountReady),
			@"AccountType": @(TWSAccountValueTypeAccountType),
			@"AccruedCash": @(TWSAccountValueTypeAccruedCash),
			@"AccruedCash-C": @(TWSAccountValueTypeAccruedCash_C),
			@"AccruedCash-S": @(TWSAccountValueTypeAccruedCash_S),
			@"AccruedDividend": @(TWSAccountValueTypeAccruedDividend),
			@"AccruedDividend-C": @(TWSAccountValueTypeAccruedDividend_C),
			@"AccruedDividend-S": @(TWSAccountValueTypeAccruedDividend_S),
			@"AvailableFunds": @(TWSAccountValueTypeAvailableFunds),
			@"AvailableFunds-C": @(TWSAccountValueTypeAvailableFunds_C),
			@"AvailableFunds-S": @(TWSAccountValueTypeAvailableFunds_S),
			@"Billable": @(TWSAccountValueTypeBillable),
			@"Billable-C": @(TWSAccountValueTypeBillable_C),
			@"Billable-S": @(TWSAccountValueTypeBillable_S),
			@"BuyingPower": @(TWSAccountValueTypeBuyingPower),
			@"CashBalance": @(TWSAccountValueTypeCashBalance),
			@"CorporateBondValue": @(TWSAccountValueTypeCorporateBondValue),
			@"Currency": @(TWSAccountValueTypeCurrency),
			@"Cushion": @(TWSAccountValueTypeCushion),
			@"DayTradesRemaining": @(TWSAccountValueTypeDayTradesRemaining),
			@"DayTradesRemainingT+1": @(TWSAccountValueTypeDayTradesRemainingT_1),
			@"DayTradesRemainingT+2": @(TWSAccountValueTypeDayTradesRemainingT_2),
			@"DayTradesRemainingT+3": @(TWSAccountValueTypeDayTradesRemainingT_3),
			@"DayTradesRemainingT+4": @(TWSAccountValueTypeDayTradesRemainingT_4),
			@"EquityWithLoanValue": @(TWSAccountValueTypeEquityWithLoanValue),
			@"EquityWithLoanValue-C": @(TWSAccountValueTypeEquityWithLoanValue_C),
			@"EquityWithLoanValue-S": @(TWSAccountValueTypeEquityWithLoanValue_S),
			@"ExcessLiquidity": @(TWSAccountValueTypeExcessLiquidity),
			@"ExcessLiquidity-C": @(TWSAccountValueTypeExcessLiquidity_C),
			@"ExcessLiquidity-S": @(TWSAccountValueTypeExcessLiquidity_S),
			@"ExchangeRate": @(TWSAccountValueTypeExchangeRate),
			@"FullAvailableFunds": @(TWSAccountValueTypeFullAvailableFunds),
			@"FullAvailableFunds-C": @(TWSAccountValueTypeFullAvailableFunds_C),
			@"FullAvailableFunds-S": @(TWSAccountValueTypeFullAvailableFunds_S),
			@"FullExcessLiquidity": @(TWSAccountValueTypeFullExcessLiquidity),
			@"FullExcessLiquidity-C": @(TWSAccountValueTypeFullExcessLiquidity_C),
			@"FullExcessLiquidity-S": @(TWSAccountValueTypeFullExcessLiquidity_S),
			@"FullInitMarginReq": @(TWSAccountValueTypeFullInitMarginReq),
			@"FullInitMarginReq-C": @(TWSAccountValueTypeFullInitMarginReq_C),
			@"FullInitMarginReq-S": @(TWSAccountValueTypeFullInitMarginReq_S),
			@"FullMaintMarginReq": @(TWSAccountValueTypeFullMaintMarginReq),
			@"FullMaintMarginReq-C": @(TWSAccountValueTypeFullMaintMarginReq_C),
			@"FullMaintMarginReq-S": @(TWSAccountValueTypeFullMaintMarginReq_S),
			@"FundValue": @(TWSAccountValueTypeFundValue),
			@"FutureOptionValue": @(TWSAccountValueTypeFutureOptionValue),
			@"FuturesPNL": @(TWSAccountValueTypeFuturesPNL),
			@"FxCashBalance": @(TWSAccountValueTypeFxCashBalance),
			@"GrossPositionValue": @(TWSAccountValueTypeGrossPositionValue),
			@"GrossPositionValue-S": @(TWSAccountValueTypeGrossPositionValue_S),
			@"IndianStockHaircut": @(TWSAccountValueTypeIndianStockHaircut),
			@"InitMarginReq": @(TWSAccountValueTypeInitMarginReq),
			@"InitMarginReq-C": @(TWSAccountValueTypeInitMarginReq_C),
			@"InitMarginReq-S": @(TWSAccountValueTypeInitMarginReq_S),
			@"IssuerOptionValue": @(TWSAccountValueTypeIssuerOptionValue),
			@"Leverage-S": @(TWSAccountValueTypeLeverage_S),
			@"LookAheadNextChange": @(TWSAccountValueTypeLookAheadNextChange),
			@"LookAheadAvailableFunds": @(TWSAccountValueTypeLookAheadAvailableFunds),
			@"LookAheadAvailableFunds-C": @(TWSAccountValueTypeLookAheadAvailableFunds_C),
			@"LookAheadAvailableFunds-S": @(TWSAccountValueTypeLookAheadAvailableFunds_S),
			@"LookAheadExcessLiquidity": @(TWSAccountValueTypeLookAheadExcessLiquidity),
			@"LookAheadExcessLiquidity-C": @(TWSAccountValueTypeLookAheadExcessLiquidity_C),
			@"LookAheadExcessLiquidity-S": @(TWSAccountValueTypeLookAheadExcessLiquidity_S),
			@"LookAheadInitMarginReq": @(TWSAccountValueTypeLookAheadInitMarginReq),
			@"LookAheadInitMarginReq-C": @(TWSAccountValueTypeLookAheadInitMarginReq_C),
			@"LookAheadInitMarginReq-S": @(TWSAccountValueTypeLookAheadInitMarginReq_S),
			@"LookAheadMaintMarginReq": @(TWSAccountValueTypeLookAheadMaintMarginReq),
			@"LookAheadMaintMarginReq-C": @(TWSAccountValueTypeLookAheadMaintMarginReq_C),
			@"LookAheadMaintMarginReq-S": @(TWSAccountValueTypeLookAheadMaintMarginReq_S),
			@"MaintMarginReq": @(TWSAccountValueTypeMaintMarginReq),
			@"MaintMarginReq-C": @(TWSAccountValueTypeMaintMarginReq_C),
			@"MaintMarginReq-S": @(TWSAccountValueTypeMaintMarginReq_S),
			@"MoneyMarketFundValue": @(TWSAccountValueTypeMoneyMarketFundValue),
			@"MutualFundValue": @(TWSAccountValueTypeMutualFundValue),
			@"NetDividend": @(TWSAccountValueTypeNetDividend),
			@"NetLiquidation": @(TWSAccountValueTypeNetLiquidation),
			@"NetLiquidation-C": @(TWSAccountValueTypeNetLiquidation_C),
			@"NetLiquidation-S": @(TWSAccountValueTypeNetLiquidation_S),
			@"NetLiquidationByCurrency": @(TWSAccountValueTypeNetLiquidationByCurrency),
			@"OptionMarketValue": @(TWSAccountValueTypeOptionMarketValue),
			@"PASharesValue": @(TWSAccountValueTypePASharesValue),
			@"PASharesValue-C": @(TWSAccountValueTypePASharesValue_C),
			@"PASharesValue-S": @(TWSAccountValueTypePASharesValue_S),
			@"PostExpirationExcess": @(TWSAccountValueTypePostExpirationExcess),
			@"PostExpirationExcess-C": @(TWSAccountValueTypePostExpirationExcess_C),
			@"PostExpirationExcess-S": @(TWSAccountValueTypePostExpirationExcess_S),
			@"PostExpirationMargin": @(TWSAccountValueTypePostExpirationMargin),
			@"PostExpirationMargin-C": @(TWSAccountValueTypePostExpirationMargin_C),
			@"PostExpirationMargin-S": @(TWSAccountValueTypePostExpirationMargin_S),
			@"PreviousDayEquityWithLoanValue": @(TWSAccountValueTypePreviousDayEquityWithLoanValue),
			@"PreviousDayEquityWithLoanValue-S": @(TWSAccountValueTypePreviousDayEquityWithLoanValue_S),
			@"RealCurrency": @(TWSAccountValueTypeRealCurrency),
			@"RealizedPnL": @(TWSAccountValueTypeRealizedPnL),
			@"RegTEquity": @(TWSAccountValueTypeRegTEquity),
			@"RegTEquity-S": @(TWSAccountValueTypeRegTEquity_S),
			@"RegTMargin": @(TWSAccountValueTypeRegTMargin),
			@"RegTMargin-S": @(TWSAccountValueTypeRegTMargin_S),
			@"SMA": @(TWSAccountValueTypeSMA),
			@"SMA-S": @(TWSAccountValueTypeSMA_S),
			@"SegmentTitle": @(TWSAccountValueTypeSegmentTitle),
			@"StockMarketValue": @(TWSAccountValueTypeStockMarketValue),
			@"TBondValue": @(TWSAccountValueTypeTBondValue),
			@"TBillValue": @(TWSAccountValueTypeTBillValue),
			@"TotalCashBalance": @(TWSAccountValueTypeTotalCashBalance),
			@"TotalCashValue": @(TWSAccountValueTypeTotalCashValue),
			@"TotalCashValue-C": @(TWSAccountValueTypeTotalCashValue_C),
			@"TotalCashValue-S": @(TWSAccountValueTypeTotalCashValue_S),
			@"TradingType-S": @(TWSAccountValueTypeTradingType_S),
			@"UnrealizedPnL": @(TWSAccountValueTypeUnrealizedPnL),
			@"WarrantValue": @(TWSAccountValueTypeWarrantValue),
			@"WhatIfPMEnabled": @(TWSAccountValueTypeWhatIfPMEnabled),
		};
	});
	return sharedInstance;
}

@end
