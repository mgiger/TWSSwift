//
//  TWSOrder.m
//  TWSAPI
//
//  Created by Matthew Giger on 10/21/21.
//

#import "TWSOrder.h"
#import "TWSOrder_private.h"

@implementation TWSOrder

- (nonnull instancetype)init
{
	if(self = [super init])
	{
		_orderId = 0;
		_clientId = 0;
		_action = TWSOrderActionBuy;
		_timeInForce = TWSTimeInForceDay;
		_orderType = TWSOrderTypeLimit;
		_totalQuantity = 0;
		_limitPrice = UNSET_DOUBLE;
		_trailStopPrice = UNSET_DOUBLE;
		_trailingPercent = UNSET_DOUBLE;
		_lmtPriceOffset = UNSET_DOUBLE;
		_auxPrice = UNSET_DOUBLE;
		_account = @"";
	}
	return self;
}

- (nonnull instancetype)initWithOrder:(const Order&)order
{
	if(self = [super init])
	{
		_orderId = order.orderId;
		_clientId = order.clientId;

		_action = (order.action == "BUY") ? TWSOrderActionBuy : TWSOrderActionSell;
		
		_totalQuantity = order.totalQuantity;
		
		if(order.orderType == "LMT")				{ _orderType = TWSOrderTypeLimit; }
		else if(order.orderType == "MKT")			{ _orderType = TWSOrderTypeMarket; }
		else if(order.orderType == "STP")			{ _orderType = TWSOrderTypeMarket; }
		else if(order.orderType == "STP LMT")		{ _orderType = TWSOrderTypeMarket; }
		else if(order.orderType == "TRAIL")			{ _orderType = TWSOrderTypeMarket; }
		else if(order.orderType == "TRAIL LIMIT")	{ _orderType = TWSOrderTypeMarket; }
		else {
			// TODO: Need to support more order types
		}
		
		_limitPrice = order.lmtPrice;
		_auxPrice = order.auxPrice;
		
		// extended order fields
		if(order.tif == "DAY")			{ _timeInForce = TWSTimeInForceDay; }
		else if(order.tif == "GTC")		{ _timeInForce = TWSTimeInForceGTC; }
		else if(order.tif == "IOC")		{ _timeInForce = TWSTimeInForceIOC; }
		else if(order.tif == "OPG")		{ _timeInForce = TWSTimeInForceOPG; }
		else if(order.tif == "DTC")		{ _timeInForce = TWSTimeInForceDTC; }
		else {
			// TODO: Need to support more time in force types
		}

		//	 std::string orderRef;      // order reference

		_allOrNone = order.allOrNone;
		_whatIf = order.whatIf;

		_trailStopPrice = order.trailStopPrice;
		_trailingPercent = order.trailingPercent;
		
		_account = [NSString stringWithUTF8String:order.account.c_str()];
	}
	return self;
}

- (Order)order
{
	Order order;
	
//	order.orderId = _orderId;
	
	switch(_action) {
		case TWSOrderActionBuy:				order.action = "BUY";		break;
		case TWSOrderActionSell:			order.action = "SELL";		break;
	}
	
	switch(_timeInForce) {
		case TWSTimeInForceDay:				order.tif = "DAY";		break;
		case TWSTimeInForceGTC:				order.tif = "GTC";		break;
		case TWSTimeInForceIOC:				order.tif = "IOC";		break;
		case TWSTimeInForceOPG:				order.tif = "OPG";		break;
		case TWSTimeInForceFOK:				order.tif = "FOK";		break;
		case TWSTimeInForceDTC:				order.tif = "DTC";		break;
	}
	
	switch(_orderType) {
		case TWSOrderTypeMarket:			order.orderType = "MKT";			break;
		case TWSOrderTypeLimit:				order.orderType = "LMT";			break;
		case TWSOrderTypeStop:				order.orderType = "STP";			break;
		case TWSOrderTypeStopLimit:			order.orderType = "STP LMT";		break;
		case TWSOrderTypeTrailingStop:		order.orderType = "TRAIL";			break;
		case TWSOrderTypeTrailingStopLimit:	order.orderType = "TRAIL LIMIT";	break;
	}

	order.totalQuantity = _totalQuantity;
	order.lmtPrice = _limitPrice;
	order.trailStopPrice = _trailStopPrice;
	order.trailingPercent = _trailingPercent;
	order.lmtPriceOffset = _lmtPriceOffset;
	order.auxPrice = _auxPrice;
	order.allOrNone = _allOrNone;
	order.whatIf = _whatIf;

	return order;
}

@end
