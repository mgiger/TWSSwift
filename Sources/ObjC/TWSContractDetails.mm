//
//  TWSContractDetails.m
//  TWSAPI
//
//  Created by Matthew Giger on 10/3/21.
//

#import "TWSContractDetails.h"
#import "TWSContractDetails_private.h"
#import "TWSContract_private.h"

@implementation TWSContractDetails

- (nonnull instancetype)init
{
	if(self = [super init])
	{
		_contract = [[TWSContract alloc] init];
		
		_marketName = @"";
		_orderTypes = @"";
		_validExchanges = @"";
		_longName = @"";
		_contractMonth = @"";
		_industry = @"";
		_category = @"";
		_subcategory = @"";
		_timeZoneId = @"";
		_tradingHours = @"";
		_liquidHours = @"";
		_evRule = @"";
		_underSymbol = @"";
		_underSecType = @"";
		_marketRuleIds = @"";
		_realExpirationDate = @"";
		_lastTradeTime = @"";
		_stockType = @"";
		_cusip = @"";
		_ratings = @"";
		_descAppend = @"";
		_bondType = @"";
		_couponType = @"";
		_maturity = @"";
		_issueDate = @"";
		_nextOptionDate = @"";
		_nextOptionType = @"";
		_notes = @"";
	}
	return self;
}

- (nonnull instancetype)initWithContractDetails:(const ContractDetails&)details
{
	if(self = [super init])
	{
		_contract = [[TWSContract alloc] initWithContract:details.contract];
		
		_marketName = [NSString stringWithUTF8String:details.marketName.c_str()];
		_minTick = details.minTick;
		_orderTypes = [NSString stringWithUTF8String:details.orderTypes.c_str()];
		_validExchanges = [NSString stringWithUTF8String:details.validExchanges.c_str()];
		_priceMagnifier = details.priceMagnifier;
		_underConId = details.underConId;
		_longName = [NSString stringWithUTF8String:details.longName.c_str()];
		
		_contractMonth = [NSString stringWithUTF8String:details.contractMonth.c_str()];
		_industry = [NSString stringWithUTF8String:details.industry.c_str()];
		_category = [NSString stringWithUTF8String:details.category.c_str()];
		_subcategory = [NSString stringWithUTF8String:details.subcategory.c_str()];
		_timeZoneId = [NSString stringWithUTF8String:details.timeZoneId.c_str()];
		_tradingHours = [NSString stringWithUTF8String:details.tradingHours.c_str()];
		_liquidHours = [NSString stringWithUTF8String:details.liquidHours.c_str()];
		_evRule = [NSString stringWithUTF8String:details.evRule.c_str()];
		_evMultiplier = details.evMultiplier;
		_mdSizeMultiplier = details.mdSizeMultiplier;
		_aggGroup = details.aggGroup;
		_underSymbol = [NSString stringWithUTF8String:details.underSymbol.c_str()];
		_underSecType = [NSString stringWithUTF8String:details.underSecType.c_str()];
		_marketRuleIds = [NSString stringWithUTF8String:details.marketRuleIds.c_str()];
		_realExpirationDate = [NSString stringWithUTF8String:details.realExpirationDate.c_str()];
		_lastTradeTime = [NSString stringWithUTF8String:details.lastTradeTime.c_str()];
		_stockType = [NSString stringWithUTF8String:details.stockType.c_str()];
		
		//
		//TagValueListSPtr secIdList;
		//
		//// BOND values
		_cusip = [NSString stringWithUTF8String:details.cusip.c_str()];
		_ratings = [NSString stringWithUTF8String:details.ratings.c_str()];
		_descAppend = [NSString stringWithUTF8String:details.descAppend.c_str()];
		_bondType = [NSString stringWithUTF8String:details.bondType.c_str()];
		_couponType = [NSString stringWithUTF8String:details.couponType.c_str()];
		_callable = details.callable;
		_putable = details.putable;
		_coupon = details.coupon;
		_convertible = details.convertible;
		_maturity = [NSString stringWithUTF8String:details.maturity.c_str()];
		_issueDate = [NSString stringWithUTF8String:details.issueDate.c_str()];
		_nextOptionDate = [NSString stringWithUTF8String:details.nextOptionDate.c_str()];
		_nextOptionType = [NSString stringWithUTF8String:details.nextOptionType.c_str()];
		_nextOptionPartial = details.nextOptionPartial;
		_notes = [NSString stringWithUTF8String:details.notes.c_str()];
	}
	return self;
}

@end
