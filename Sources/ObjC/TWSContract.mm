//
//  TWSContract.m
//  TWSAPI
//
//  Created by Matthew Giger on 10/3/21.
//

#import "TWSContract.h"
#include "Contract.h"

@implementation TWSContract

- (nonnull instancetype)init
{
	if(self = [super init])
	{
		_symbol = @"";
		_secType = @"";
		_lastTradeDateOrContractMonth = @"";
		_right = @"";
		_multiplier = @"";
		_exchange = @"";
		_primaryExchange = @"";
		_currency = @"";
		_localSymbol = @"";
		_tradingClass = @"";
		_secIdType = @"";
		_secId = @"";
		_comboLegsDescrip = @"";
	}
	return self;
}

- (nonnull instancetype)initWithContract:(const Contract&)contract
{
	if(self = [super init])
	{
		_conId = contract.conId;
		_symbol = [NSString stringWithUTF8String:contract.symbol.c_str()];
		_secType = [NSString stringWithUTF8String:contract.secType.c_str()];
		_lastTradeDateOrContractMonth = [NSString stringWithUTF8String:contract.lastTradeDateOrContractMonth.c_str()];
		_strike = contract.strike;
		_right = [NSString stringWithUTF8String:contract.right.c_str()];
		_multiplier = [NSString stringWithUTF8String:contract.multiplier.c_str()];
		_exchange = [NSString stringWithUTF8String:contract.exchange.c_str()];
		_primaryExchange = [NSString stringWithUTF8String:contract.primaryExchange.c_str()];
		_currency = [NSString stringWithUTF8String:contract.currency.c_str()];
		_localSymbol = [NSString stringWithUTF8String:contract.localSymbol.c_str()];
		_tradingClass = [NSString stringWithUTF8String:contract.tradingClass.c_str()];
		_includeExpired = contract.includeExpired;
		_secIdType = [NSString stringWithUTF8String:contract.secIdType.c_str()];
		_secId = [NSString stringWithUTF8String:contract.secId.c_str()];
		
		// COMBOS
		_comboLegsDescrip = [NSString stringWithUTF8String:contract.comboLegsDescrip.c_str()];
	}
	return self;
}

- (Contract)contract
{
	Contract contract;
	contract.conId = _conId;
	contract.symbol = _symbol.UTF8String;
	contract.secType = _secType.UTF8String;
	contract.lastTradeDateOrContractMonth = _lastTradeDateOrContractMonth.UTF8String;
	contract.strike = _strike;
	contract.right = _right.UTF8String;
	contract.multiplier = _multiplier.UTF8String;
	contract.exchange = _exchange.UTF8String;
	contract.primaryExchange = _primaryExchange.UTF8String;
	contract.currency = _currency.UTF8String;
	contract.localSymbol = _localSymbol.UTF8String;
	contract.tradingClass = _tradingClass.UTF8String;
	contract.includeExpired = _includeExpired;
	contract.secIdType = _secIdType.UTF8String;
	contract.secId = _secId.UTF8String;
	
	// COMBOS
	contract.comboLegsDescrip = _comboLegsDescrip.UTF8String;

	return contract;
}

@end
