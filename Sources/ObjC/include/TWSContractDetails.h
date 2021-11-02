//
//  TWSContractDetails.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/3/21.
//

#import <Foundation/Foundation.h>
#import "TWSContract.h"

@interface TWSContractDetails: NSObject

@property (nonnull, strong) TWSContract*	contract;

@property (nonnull, strong) NSString*	marketName;
@property (assign)			double		minTick;
@property (nonnull, strong) NSString*	orderTypes;
@property (nonnull, strong) NSString*	validExchanges;
@property (assign)			long		priceMagnifier;
@property (assign)			NSInteger	underConId;
@property (nonnull, strong) NSString*	longName;

@property (nonnull, strong) NSString*	contractMonth;
@property (nonnull, strong) NSString*	industry;
@property (nonnull, strong) NSString*	category;
@property (nonnull, strong) NSString*	subcategory;
@property (nonnull, strong) NSString*	timeZoneId;
@property (nonnull, strong) NSString*	tradingHours;
@property (nonnull, strong) NSString*	liquidHours;
@property (nonnull, strong) NSString*	evRule;
@property (assign)			double		evMultiplier;
@property (assign)			NSInteger	mdSizeMultiplier;
@property (assign)			NSInteger	aggGroup;
@property (nonnull, strong) NSString*	underSymbol;
@property (nonnull, strong) NSString*	underSecType;
@property (nonnull, strong) NSString*	marketRuleIds;
@property (nonnull, strong) NSString*	realExpirationDate;
@property (nonnull, strong) NSString*	lastTradeTime;
@property (nonnull, strong) NSString*	stockType;

//
//TagValueListSPtr secIdList;
//
//// BOND values
@property (nonnull, strong) NSString*	cusip;
@property (nonnull, strong) NSString*	ratings;
@property (nonnull, strong) NSString*	descAppend;
@property (nonnull, strong) NSString*	bondType;
@property (nonnull, strong) NSString*	couponType;
@property (assign)			BOOL		callable;
@property (assign)			BOOL		putable;
@property (assign)			double		coupon;
@property (assign)			BOOL		convertible;
@property (nonnull, strong) NSString*	maturity;
@property (nonnull, strong) NSString*	issueDate;
@property (nonnull, strong) NSString*	nextOptionDate;
@property (nonnull, strong) NSString*	nextOptionType;
@property (assign)			BOOL		nextOptionPartial;
@property (nonnull, strong) NSString*	notes;

- (nonnull instancetype)init;

@end
