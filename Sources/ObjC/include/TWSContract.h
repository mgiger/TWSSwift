//
//  TWSContract.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/3/21.
//

#import <Foundation/Foundation.h>

@interface TWSContract : NSObject

@property (assign)			long		conId;
@property (nonnull, strong)	NSString*	symbol;
@property (nonnull, strong)	NSString*	secType;
@property (nonnull, strong)	NSString*	lastTradeDateOrContractMonth;
@property (assign)			double		strike;
@property (nonnull, strong)	NSString*	right;
@property (nonnull, strong)	NSString*	multiplier;
@property (nonnull, strong)	NSString*	exchange;
@property (nonnull, strong)	NSString*	primaryExchange; // pick an actual (ie non-aggregate) exchange that the contract trades on.  DO NOT SET TO SMART.
@property (nonnull, strong)	NSString*	currency;
@property (nonnull, strong)	NSString*	localSymbol;
@property (nonnull, strong)	NSString*	tradingClass;
@property (assign)			BOOL		includeExpired;
@property (nonnull, strong)	NSString*	secIdType;		// CUSIP;SEDOL;ISIN;RIC
@property (nonnull, strong)	NSString*	secId;

// COMBOS
@property (nonnull, strong)	NSString*	comboLegsDescrip; // received in open order 14 and up for all combos

// combo legs
//typedef std::vector<ComboLegSPtr> ComboLegList;
//typedef std::shared_ptr<ComboLegList> ComboLegListSPtr;

//ComboLegListSPtr comboLegs;

// delta neutral contract
//DeltaNeutralContract* deltaNeutralContract;

- (nonnull instancetype)init;

@end
