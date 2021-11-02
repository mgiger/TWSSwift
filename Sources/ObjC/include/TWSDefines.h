//
//  TWSDefines.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/9/21.
//

#import <Foundation/Foundation.h>


@interface TWSAPIGlobals: NSObject

+ (nonnull NSDictionary<NSNumber*, NSString*>*)barSizeTypes;
+ (nonnull NSDictionary<NSString*, NSNumber*>*)orderStatusTypes;
+ (nonnull NSDictionary<NSString*, NSNumber*>*)accountValueTypes;

@end


typedef NS_ENUM(NSInteger, TWSHistoricalDataType) {
	TWSHistoricalDataTypeTrades,
	TWSHistoricalDataTypeMidpoint,
	TWSHistoricalDataTypeBid,
	TWSHistoricalDataTypeAsk,
	TWSHistoricalDataTypeBidAsk,
	TWSHistoricalDataTypeHistoricalVolatility,
	TWSHistoricalDataTypeOptionImpliedVolatility,
	TWSHistoricalDataTypeFeeRate,
	TWSHistoricalDataTypeRebateRate,
};

typedef NS_ENUM(NSInteger, TWSBarSize) {
	TWSBarSize1Sec,
	TWSBarSize5Secs,
	TWSBarSize10Secs,
	TWSBarSize15Secs,
	TWSBarSize30Secs,
	TWSBarSize1Min,
	TWSBarSize2Mins,
	TWSBarSize3Mins,
	TWSBarSize5Mins,
	TWSBarSize10Mins,
	TWSBarSize15Mins,
	TWSBarSize20Mins,
	TWSBarSize30Mins,
	TWSBarSize1Hour,
	TWSBarSize2Hour,
	TWSBarSize3Hour,
	TWSBarSize4Hour,
	TWSBarSize8Hour,
	TWSBarSize1Day,
	TWSBarSize1Week,
	TWSBarSize1Month,
};

typedef NS_OPTIONS(NSInteger, TWSGenericTick) {
	TWSTickOptionVolume					= (1 << 1),		// 100 Option Volume (currently for stocks)
	TWSTickOpenInterest					= (1 << 2),		// 101 Option Open Interest (currently for stocks)
	TWSTickHistoricalVolatility			= (1 << 3),		// 104 Historical Volatility (currently for stocks)
	TWSTickAverageOptionVolume			= (1 << 4),		// 105 Average Option Volume (currently for stocks)
	TWSTickOptionImpliedVolatility		= (1 << 5),		// 106 Option Implied Volatility (currently for stocks)
	TWSTickIndexFuturePremium			= (1 << 6),		// 162 Index Future Premium
	TWSTickMiscellaneousStats			= (1 << 7),		// 165 Miscellaneous Stats
	TWSTickMarkPrice					= (1 << 8),		// 221 Mark Price (used in TWS P&L computations)
	TWSTickAuctionValues				= (1 << 9),		// 225 Auction values (volume, price and imbalance)
	TWSTickRTVolume						= (1 << 10),	// 233 RTVolume - contains the last trade price, size, time, total volume, VWAP, and single trade flag.
	TWSTickShortable					= (1 << 11),	// 236 Shortable
	TWSTickInventory					= (1 << 12),	// 256 Inventory
	TWSTickFundamentalRatios			= (1 << 13),	// 258 Fundamental Ratios
	TWSTickRealtimeHistoricalVolatility	= (1 << 14),	// 411 Realtime Historical Volatility
	TWSTickIBDividends					= (1 << 15),	// 456 IBDividends
};


typedef NS_ENUM(NSInteger, TWSTickType) {
	TWSTickTypeBidSize,
	TWSTickTypeBid,
	TWSTickTypeAsk,
	TWSTickTypeAskSize,
	TWSTickTypeLast,
	TWSTickTypeLastSize,
	TWSTickTypeHigh,
	TWSTickTypeLow,
	TWSTickTypeVolume,
	TWSTickTypeClose,
	TWSTickTypeBidOptionComputation,
	TWSTickTypeAskOptionComputation,
	TWSTickTypeLastOptionComputation,
	TWSTickTypeModelOption,
	TWSTickTypeOpen,
	TWSTickTypeLow13Week,
	TWSTickTypeHigh13Week,
	TWSTickTypeLow26Week,
	TWSTickTypeHigh26Week,
	TWSTickTypeLow52Week,
	TWSTickTypeHigh52Week,
	TWSTickTypeAvgVolume,
	TWSTickTypeOpenInterest,
	TWSTickTypeOptionHistoricalVol,
	TWSTickTypeOptionImpliedVol,
	TWSTickTypeOptionBidExch,
	TWSTickTypeOptionAskExch,
	TWSTickTypeOptionCallOpenInterest,
	TWSTickTypeOptionPutOpenInterest,
	TWSTickTypeOptionCallVolume,
	TWSTickTypeOptionPutVolume,
	TWSTickTypeIndexFuturePremium,
	TWSTickTypeBidExch,
	TWSTickTypeAskExch,
	TWSTickTypeAuctionVolume,
	TWSTickTypeAuctionPrice,
	TWSTickTypeAuctionImbalance,
	TWSTickTypeMarkPrice,
	TWSTickTypeBidEFPComputation,
	TWSTickTypeAskEFPComputation,
	TWSTickTypeLastEFPComputation,
	TWSTickTypeOpenEFPComputation,
	TWSTickTypeHighEFPComputation,
	TWSTickTypeLowEFPComputation,
	TWSTickTypeCloseEFPComputation,
	TWSTickTypeLastTimestamp,
	TWSTickTypeShortable,
	TWSTickTypeFundamentalRatios,
	TWSTickTypeRTVolume,
	TWSTickTypeHalted,
	TWSTickTypeBidYield,
	TWSTickTypeAskYield,
	TWSTickTypeLastYield,
	TWSTickTypeCustOptionComputation,
	TWSTickTypeTradeCount,
	TWSTickTypeTradeRate,
	TWSTickTypeVolumeRate,
	TWSTickTypeLastRTHTrade,
	TWSTickTypeRTHistoricalVol,
	TWSTickTypeIBDividends,
	TWSTickTypeBondFactorMultiplier,
	TWSTickTypeRegulatoryImbalance,
	TWSTickTypeNewsTick,
	TWSTickTypeShortTermVolume3Min,
	TWSTickTypeShortTermVolume5Min,
	TWSTickTypeShortTermVolume10Min,
	TWSTickTypeDelayedBid,
	TWSTickTypeDelayedAsk,
	TWSTickTypeDelayedLast,
	TWSTickTypeDelayedBidSize,
	TWSTickTypeDelayedAskSize,
	TWSTickTypeDelayedLastSize,
	TWSTickTypeDelayedHigh,
	TWSTickTypeDelayedLow,
	TWSTickTypeDelayedVolume,
	TWSTickTypeDelayedClose,
	TWSTickTypeDelayedOpen,
	TWSTickTypeRTTRDVolume,
	TWSTickTypeCreditmanMarkPrice,
	TWSTickTypeCreditmanSlowMarkPrice,
	TWSTickTypeDelayedBidOptionComputation,
	TWSTickTypeDelayedAskOptionComputation,
	TWSTickTypeDelayedLastOptionComputation,
	TWSTickTypeDelayedModelOptionComputation,
	TWSTickTypeLastExch,
	TWSTickTypeLastRegTime,
	TWSTickTypeFuturesOpenInterest,
	TWSTickTypeAvgOptVolume,
	TWSTickTypeDelayedLastTimestamp,
	TWSTickTypeShortableShares,
	TWSTickTypeDelayedHalted,
	TWSTickTypeReuters2MutualFunds,
	TWSTickTypeETFNAVClose,
	TWSTickTypeETFNAVPriorClose,
	TWSTickTypeETFNAVBid,
	TWSTickTypeETFNAVAsk,
	TWSTickTypeETFNAVLast,
	TWSTickTypeETFFrozenNAVLast,
	TWSTickTypeETFNAVHigh,
	TWSTickTypeETFNAVLow,
	TWSTickTypeNotSet
};

typedef NS_ENUM(NSInteger, TWSOrderAction) {
	TWSOrderActionBuy,
	TWSOrderActionSell,
};

typedef NS_ENUM(NSInteger, TWSOrderType) {
	TWSOrderTypeMarket,
	TWSOrderTypeLimit,
	TWSOrderTypeStop,
	TWSOrderTypeStopLimit,
	TWSOrderTypeTrailingStop,
	TWSOrderTypeTrailingStopLimit,
};

typedef NS_ENUM(NSInteger, TWSTimeInForce) {
	TWSTimeInForceDay,					// Valid for the day only
	TWSTimeInForceGTC,					// Good until canceled
	TWSTimeInForceIOC,					// Immediate or Cancel
//	TWSTimeInForceGTD,					// Good until Date
	TWSTimeInForceOPG,					// Use OPG to send a market-on-open (MOO) or limit-on-open (LOO) order.
	TWSTimeInForceFOK,					// Fill-or-Kill
	TWSTimeInForceDTC,					// Day until Canceled
};

typedef NS_ENUM(NSInteger, TWSOrderStatus) {
	TWSOrderStatusApiPending,		// indicates order has not yet been sent to IB server
									// for instance if there is a delay in receiving the security definition. Uncommonly received.
	TWSOrderStatusPendingSubmit,	// indicates the order was sent from TWS, but confirmation has not been received that it has
									//been received by the destination. Most commonly because exchange is closed.
	TWSOrderStatusPendingCancel,	// indicates that a request has been sent to cancel an order but confirmation has not
									// been received of its cancellation.
	TWSOrderStatusPreSubmitted,		// indicates that a simulated order type has been accepted by the IB system and that this order
									// has yet to be elected. The order is held in the IB system until the election criteria are met.
									// At that time the order is transmitted to the order destination as specified.
	TWSOrderStatusSubmitted,		// indicates that your order has been accepted at the order destination and is working.
	TWSOrderStatusApiCancelled,		// after an order has been submitted and before it has been acknowledged,
									// an API client can request its cancellation, producing this state.
	TWSOrderStatusCancelled,		// indicates that the balance of your order has been confirmed cancelled by the IB system.
									// This could occur unexpectedly when IB or the destination has rejected your order.
									// For example, if your order is subject to price checks, it could be cancelled,
									// as explained in Order Placement Considerations
	TWSOrderStatusFilled,			// indicates that the order has been completely filled.
	TWSOrderStatusInactive,			// indicates an order is not working, possible reasons include:
};


typedef NS_ENUM(NSInteger, TWSAccountValueType) {
	TWSAccountValueTypeAccountCode,	// The account ID number
	TWSAccountValueTypeAccountOrGroup,	//  "All" to return account summary data for all accounts, or set to a specific Advisor Account Group name that has already been created in TWS Global Configuration
	TWSAccountValueTypeAccountReady,	//  For internal use only
	TWSAccountValueTypeAccountType,	//  Identifies the IB account structure
	TWSAccountValueTypeAccruedCash,	//  Total accrued cash value of stock, commodities and securities
	TWSAccountValueTypeAccruedCash_C,	//  Reflects the current's month accrued debit and credit interest to date, updated daily in commodity segment
	TWSAccountValueTypeAccruedCash_S,	//  Reflects the current's month accrued debit and credit interest to date, updated daily in security segment
	TWSAccountValueTypeAccruedDividend,	//  Total portfolio value of dividends accrued
	TWSAccountValueTypeAccruedDividend_C,	//  Dividends accrued but not paid in commodity segment
	TWSAccountValueTypeAccruedDividend_S,	//  Dividends accrued but not paid in security segment
	TWSAccountValueTypeAvailableFunds,	//  This value tells what you have available for trading
	TWSAccountValueTypeAvailableFunds_C,	//  Net Liquidation Value - Initial Margin
	TWSAccountValueTypeAvailableFunds_S,	//  Equity with Loan Value - Initial Margin
	TWSAccountValueTypeBillable,	//  Total portfolio value of treasury bills
	TWSAccountValueTypeBillable_C,	//  Value of treasury bills in commodity segment
	TWSAccountValueTypeBillable_S,	//  Value of treasury bills in security segment
	TWSAccountValueTypeBuyingPower,	//  Cash Account: Minimum (Equity with Loan Value, Previous Day Equity with Loan Value)-Initial Margin, Standard Margin Account: Minimum (Equity with Loan Value, Previous Day Equity with Loan Value) - Initial Margin *4
	TWSAccountValueTypeCashBalance,	//  Cash recognized at the time of trade + futures PNL
	TWSAccountValueTypeCorporateBondValue,	//  Value of non-Government bonds such as corporate bonds and municipal bonds
	TWSAccountValueTypeCurrency,	//  Open positions are grouped by currency
	TWSAccountValueTypeCushion,	//  Excess liquidity as a percentage of net liquidation value
	TWSAccountValueTypeDayTradesRemaining,	//  Number of Open/Close trades one could do before Pattern Day Trading is detected
	TWSAccountValueTypeDayTradesRemainingT_1,	//  Number of Open/Close trades one could do tomorrow before Pattern Day Trading is detected
	TWSAccountValueTypeDayTradesRemainingT_2,	//  Number of Open/Close trades one could do two days from today before Pattern Day Trading is detected
	TWSAccountValueTypeDayTradesRemainingT_3,	//  Number of Open/Close trades one could do three days from today before Pattern Day Trading is detected
	TWSAccountValueTypeDayTradesRemainingT_4,	//  Number of Open/Close trades one could do four days from today before Pattern Day Trading is detected
	TWSAccountValueTypeEquityWithLoanValue,	//  Forms the basis for determining whether a client has the necessary assets to either initiate or maintain security positions
	TWSAccountValueTypeEquityWithLoanValue_C,	//  Cash account: Total cash value + commodities option value - futures maintenance margin requirement + minimum (0, futures PNL) Margin account: Total cash value + commodities option value - futures maintenance margin requirement
	TWSAccountValueTypeEquityWithLoanValue_S,	//  Cash account: Settled Cash Margin Account: Total cash value + stock value + bond value + (non-U.S. & Canada securities options value)
	TWSAccountValueTypeExcessLiquidity,	//  This value shows your margin cushion, before liquidation
	TWSAccountValueTypeExcessLiquidity_C,	//  Equity with Loan Value - Maintenance Margin
	TWSAccountValueTypeExcessLiquidity_S,	//  Net Liquidation Value - Maintenance Margin
	TWSAccountValueTypeExchangeRate,	//  The exchange rate of the currency to your base currency
	TWSAccountValueTypeFullAvailableFunds,	//  Available funds of whole portfolio with no discounts or intraday credits
	TWSAccountValueTypeFullAvailableFunds_C,	//  Net Liquidation Value - Full Initial Margin
	TWSAccountValueTypeFullAvailableFunds_S,	//  Equity with Loan Value - Full Initial Margin
	TWSAccountValueTypeFullExcessLiquidity,	//  Excess liquidity of whole portfolio with no discounts or intraday credits
	TWSAccountValueTypeFullExcessLiquidity_C,	//  Net Liquidation Value - Full Maintenance Margin
	TWSAccountValueTypeFullExcessLiquidity_S,	//  Equity with Loan Value - Full Maintenance Margin
	TWSAccountValueTypeFullInitMarginReq,	//  Initial Margin of whole portfolio with no discounts or intraday credits
	TWSAccountValueTypeFullInitMarginReq_C,	//  Initial Margin of commodity segment's portfolio with no discounts or intraday credits
	TWSAccountValueTypeFullInitMarginReq_S,	//  Initial Margin of security segment's portfolio with no discounts or intraday credits
	TWSAccountValueTypeFullMaintMarginReq,	//  Maintenance Margin of whole portfolio with no discounts or intraday credits
	TWSAccountValueTypeFullMaintMarginReq_C,	//  Maintenance Margin of commodity segment's portfolio with no discounts or intraday credits
	TWSAccountValueTypeFullMaintMarginReq_S,	//  Maintenance Margin of security segment's portfolio with no discounts or intraday credits
	TWSAccountValueTypeFundValue,	//  Value of funds value (money market funds + mutual funds)
	TWSAccountValueTypeFutureOptionValue,	//  Real-time market-to-market value of futures options
	TWSAccountValueTypeFuturesPNL,	//  Real-time changes in futures value since last settlement
	TWSAccountValueTypeFxCashBalance,	//  Cash balance in related IB-UKL account
	TWSAccountValueTypeGrossPositionValue,	//  Gross Position Value in securities segment
	TWSAccountValueTypeGrossPositionValue_S,	//  Long Stock Value + Short Stock Value + Long Option Value + Short Option Value
	TWSAccountValueTypeIndianStockHaircut,	//  Margin rule for IB-IN accounts
	TWSAccountValueTypeInitMarginReq,	//  Initial Margin requirement of whole portfolio
	TWSAccountValueTypeInitMarginReq_C,	//  Initial Margin of the commodity segment in base currency
	TWSAccountValueTypeInitMarginReq_S,	//  Initial Margin of the security segment in base currency
	TWSAccountValueTypeIssuerOptionValue,	//  Real-time mark-to-market value of Issued Option
	TWSAccountValueTypeLeverage_S,	//  GrossPositionValue / NetLiquidation in security segment
	TWSAccountValueTypeLookAheadNextChange,	//  Time when look-ahead values take effect
	TWSAccountValueTypeLookAheadAvailableFunds,	//  This value reflects your available funds at the next margin change
	TWSAccountValueTypeLookAheadAvailableFunds_C,	//  Net Liquidation Value - look ahead Initial Margin
	TWSAccountValueTypeLookAheadAvailableFunds_S,	//  Equity with Loan Value - look ahead Initial Margin
	TWSAccountValueTypeLookAheadExcessLiquidity,	//  This value reflects your excess liquidity at the next margin change
	TWSAccountValueTypeLookAheadExcessLiquidity_C,	//  Net Liquidation Value - look ahead Maintenance Margin
	TWSAccountValueTypeLookAheadExcessLiquidity_S,	//  Equity with Loan Value - look ahead Maintenance Margin
	TWSAccountValueTypeLookAheadInitMarginReq,	//  Initial margin requirement of whole portfolio as of next period's margin change
	TWSAccountValueTypeLookAheadInitMarginReq_C,	//  Initial margin requirement as of next period's margin change in the base currency of the account
	TWSAccountValueTypeLookAheadInitMarginReq_S,	//  Initial margin requirement as of next period's margin change in the base currency of the account
	TWSAccountValueTypeLookAheadMaintMarginReq,	//  Maintenance margin requirement of whole portfolio as of next period's margin change
	TWSAccountValueTypeLookAheadMaintMarginReq_C,	//  Maintenance margin requirement as of next period's margin change in the base currency of the account
	TWSAccountValueTypeLookAheadMaintMarginReq_S,	//  Maintenance margin requirement as of next period's margin change in the base currency of the account
	TWSAccountValueTypeMaintMarginReq,	//  Maintenance Margin requirement of whole portfolio
	TWSAccountValueTypeMaintMarginReq_C,	//  Maintenance Margin for the commodity segment
	TWSAccountValueTypeMaintMarginReq_S,	//  Maintenance Margin for the security segment
	TWSAccountValueTypeMoneyMarketFundValue,	//  Market value of money market funds excluding mutual funds
	TWSAccountValueTypeMutualFundValue,	//  Market value of mutual funds excluding money market funds
	TWSAccountValueTypeNetDividend,	//  The sum of the Dividend Payable/Receivable Values for the securities and commodities segments of the account
	TWSAccountValueTypeNetLiquidation,	//  The basis for determining the price of the assets in your account
	TWSAccountValueTypeNetLiquidation_C,	//  Total cash value + futures PNL + commodities options value
	TWSAccountValueTypeNetLiquidation_S,	//  Total cash value + stock value + securities options value + bond value
	TWSAccountValueTypeNetLiquidationByCurrency,	//  Net liquidation for individual currencies
	TWSAccountValueTypeOptionMarketValue,	//  Real-time mark-to-market value of options
	TWSAccountValueTypePASharesValue,	//  Personal Account shares value of whole portfolio
	TWSAccountValueTypePASharesValue_C,	//  Personal Account shares value in commodity segment
	TWSAccountValueTypePASharesValue_S,	//  Personal Account shares value in security segment
	TWSAccountValueTypePostExpirationExcess,	//  Total projected "at expiration" excess liquidity
	TWSAccountValueTypePostExpirationExcess_C,	//  Provides a projected "at expiration" excess liquidity based on the soon-to expire contracts in your portfolio in commodity segment
	TWSAccountValueTypePostExpirationExcess_S,	//  Provides a projected "at expiration" excess liquidity based on the soon-to expire contracts in your portfolio in security segment
	TWSAccountValueTypePostExpirationMargin,	//  Total projected "at expiration" margin
	TWSAccountValueTypePostExpirationMargin_C,	//  Provides a projected "at expiration" margin value based on the soon-to expire contracts in your portfolio in commodity segment
	TWSAccountValueTypePostExpirationMargin_S,	//  Provides a projected "at expiration" margin value based on the soon-to expire contracts in your portfolio in security segment
	TWSAccountValueTypePreviousDayEquityWithLoanValue,	//  Marginable Equity with Loan value as of 16:00 ET the previous day in securities segment
	TWSAccountValueTypePreviousDayEquityWithLoanValue_S,	//  IMarginable Equity with Loan value as of 16:00 ET the previous day
	TWSAccountValueTypeRealCurrency,	//  Open positions are grouped by currency
	TWSAccountValueTypeRealizedPnL,	//  Shows your profit on closed positions, which is the difference between your entry execution cost and exit execution costs, or (execution price + commissions to open the positions) - (execution price + commissions to close the position)
	TWSAccountValueTypeRegTEquity,	//  Regulation T equity for universal account
	TWSAccountValueTypeRegTEquity_S,	//  Regulation T equity for security segment
	TWSAccountValueTypeRegTMargin,	//  Regulation T margin for universal account
	TWSAccountValueTypeRegTMargin_S,	//  Regulation T margin for security segment
	TWSAccountValueTypeSMA,	//  Line of credit created when the market value of securities in a Regulation T account increase in value
	TWSAccountValueTypeSMA_S,	//  Regulation T Special Memorandum Account balance for security segment
	TWSAccountValueTypeSegmentTitle,	//  Account segment name
	TWSAccountValueTypeStockMarketValue,	//  Real-time mark-to-market value of stock
	TWSAccountValueTypeTBondValue,	//  Value of treasury bonds
	TWSAccountValueTypeTBillValue,	//  Value of treasury bills
	TWSAccountValueTypeTotalCashBalance,	//  Total Cash Balance including Future PNL
	TWSAccountValueTypeTotalCashValue,	//  Total cash value of stock, commodities and securities
	TWSAccountValueTypeTotalCashValue_C,	//  CashBalance in commodity segment
	TWSAccountValueTypeTotalCashValue_S,	//  CashBalance in security segment
	TWSAccountValueTypeTradingType_S,	//  Account Type
	TWSAccountValueTypeUnrealizedPnL,	//  The difference between the current market value of your open positions and the average cost, or Value - Average Cost
	TWSAccountValueTypeWarrantValue,	//  Value of warrants
	TWSAccountValueTypeWhatIfPMEnabled,	//  To check projected margin requirements under Portfolio Margin model
};
