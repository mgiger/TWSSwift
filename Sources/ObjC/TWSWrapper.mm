//
//  TWSWrapper.m
//  TWSAPI
//
//  Created by Matthew Giger on 10/3/21.
//

#import "TWSWrapper_private.h"
#import "TWSContract.h"
#import "TWSContract_private.h"
#import "TWSContractDetails.h"
#import "TWSContractDetails_private.h"
#import "TWSBar_private.h"
#import "TWSOrder.h"
#import "TWSOrder_private.h"
#import "TWSOrderState.h"
#import "TWSOrderState_private.h"

#include "Contract.h"
#include "Order.h"

void TWSWrapperWrapper::tickPrice( TickerId tickerId, TickType field, double price, const TickAttrib& attribs)
{
	[wrapper tickPrice:tickerId field:(TWSTickType)field price:price];
}
void TWSWrapperWrapper::tickSize( TickerId tickerId, TickType field, Decimal size)
{
	[wrapper tickSize:tickerId field:(TWSTickType)field size:size];
}
void TWSWrapperWrapper::tickOptionComputation( TickerId tickerId, TickType tickType, int tickAttrib, double impliedVol, double delta,
											double optPrice, double pvDividend, double gamma, double vega, double theta, double undPrice)
{
	[wrapper tickOptionComputation:tickerId tickType:(TWSTickType)tickType tickAttrib:tickAttrib
						impliedVol:impliedVol delta:delta optPrice:optPrice pvDividend:pvDividend
							 gamma:gamma vega:vega theta:theta undPrice:undPrice];
}
void TWSWrapperWrapper::tickGeneric(TickerId tickerId, TickType tickType, double value)
{
	[wrapper tickGeneric:tickerId tickType:(TWSTickType)tickType value:value];
}
void TWSWrapperWrapper::tickString(TickerId tickerId, TickType tickType, const std::string& value)
{
	[wrapper tickString:tickerId tickType:(TWSTickType)tickType value:[NSString stringWithUTF8String:value.c_str()]];
}
void TWSWrapperWrapper::tickEFP(TickerId tickerId, TickType tickType, double basisPoints, const std::string& formattedBasisPoints,
							  double totalDividends, int holdDays, const std::string& futureLastTradeDate, double dividendImpact, double dividendsToLastTradeDate) { }
void TWSWrapperWrapper::orderStatus( OrderId orderId, const std::string& status, Decimal filled,
									Decimal remaining, double avgFillPrice, int permId, int parentId,
								  double lastFillPrice, int clientId, const std::string& whyHeld, double mktCapPrice)
{
	NSNumber* orderStatus = [[TWSAPIGlobals orderStatusTypes] valueForKey:[NSString stringWithUTF8String:status.c_str()]];
	if(orderStatus != nil)
	{
		[wrapper orderStatus:orderId
					  status:(TWSOrderStatus)orderStatus.integerValue
					  filled:filled
				   remaining:remaining
				avgFillPrice:avgFillPrice
					  permId:permId
					parentId:parentId
			   lastFillPrice:lastFillPrice
					clientId:clientId
					 whyHeld:[NSString stringWithUTF8String:whyHeld.c_str()]
				 mktCapPrice:mktCapPrice];
	}
}
void TWSWrapperWrapper::openOrder( OrderId orderId, const Contract& contract, const Order& order, const OrderState& orderState)
{
	TWSContract* cntr = [[TWSContract alloc] initWithContract:contract];
	TWSOrder* ordr = [[TWSOrder alloc] initWithOrder:order];
	TWSOrderState* state = [[TWSOrderState alloc] initWithOrderState:orderState];
	[wrapper openOrder:orderId contract:cntr order:ordr orderState:state];
}
void TWSWrapperWrapper::openOrderEnd()
{
	[wrapper openOrderEnd];
}
void TWSWrapperWrapper::winError( const std::string& str, int lastError) { }
void TWSWrapperWrapper::connectionClosed()
{
	[wrapper connectionClosed];
}
void TWSWrapperWrapper::updateAccountValue(const std::string& key, const std::string& val,
										 const std::string& currency, const std::string& accountName)
{
	NSNumber* keyVal = [[TWSAPIGlobals accountValueTypes] valueForKey:[NSString stringWithUTF8String:key.c_str()]];
	if(keyVal != nil)
	{
		NSString* value = [NSString stringWithUTF8String:val.c_str()];
		NSString* cur = [NSString stringWithUTF8String:currency.c_str()];
		NSString* acct = [NSString stringWithUTF8String:accountName.c_str()];
		[wrapper updateAccountValue:(TWSAccountValueType)keyVal.integerValue value:value currency:cur accountName:acct];
	}
}
void TWSWrapperWrapper::updatePortfolio( const Contract& contract, Decimal position,
									  double marketPrice, double marketValue, double averageCost,
									  double unrealizedPNL, double realizedPNL, const std::string& accountName)
{
	TWSContract* cntr = [[TWSContract alloc] initWithContract:contract];
	NSString* acct = [NSString stringWithUTF8String:accountName.c_str()];
	[wrapper updatePortfolio:cntr position:position marketPrice:marketPrice marketValue:marketValue
				 averageCost:averageCost unrealizedPNL:unrealizedPNL realizedPNL:realizedPNL accountName:acct];
}
void TWSWrapperWrapper::updateAccountTime(const std::string& timeStamp)
{
	NSString* ts = [NSString stringWithUTF8String:timeStamp.c_str()];
	NSDate* lastUpdate = [NSDate dateWithTimeIntervalSince1970:[ts integerValue]];
	[wrapper updateAccountTime:lastUpdate];
}
void TWSWrapperWrapper::accountDownloadEnd(const std::string& accountName)
{
	[wrapper accountDownloadEnd:[NSString stringWithUTF8String:accountName.c_str()]];
}
void TWSWrapperWrapper::nextValidId( OrderId orderId)
{
	[wrapper nextValidId:orderId];
}
void TWSWrapperWrapper::contractDetails( int reqId, const ContractDetails& contractDetails)
{
	TWSContractDetails* details = [[TWSContractDetails alloc] initWithContractDetails:contractDetails];
	[wrapper contractDetails:reqId contractDetails:details];
}
void TWSWrapperWrapper::bondContractDetails( int reqId, const ContractDetails& contractDetails) { }
void TWSWrapperWrapper::contractDetailsEnd( int reqId)
{
	[wrapper contractDetailsEnd:reqId];
}
void TWSWrapperWrapper::execDetails( int reqId, const Contract& contract, const Execution& execution) { }
void TWSWrapperWrapper::execDetailsEnd( int reqId) { }
void TWSWrapperWrapper::error(int id, int errorCode, const std::string& errorString)
{
	[wrapper error:id errorCode:errorCode errorString:[NSString stringWithUTF8String:errorString.c_str()]];
}
void TWSWrapperWrapper::updateMktDepth(TickerId id, int position, int operation, int side,
									 double price, Decimal size) { }
void TWSWrapperWrapper::updateMktDepthL2(TickerId id, int position, const std::string& marketMaker, int operation,
									   int side, double price, Decimal size, bool isSmartDepth) { }
void TWSWrapperWrapper::updateNewsBulletin(int msgId, int msgType, const std::string& newsMessage, const std::string& originExch) { }
void TWSWrapperWrapper::managedAccounts( const std::string& accountsList)
{
	NSString* list = [NSString stringWithUTF8String:accountsList.c_str()];
	NSArray<NSString*>* accounts = [list componentsSeparatedByString:@","];
	if(accounts == nil)
		accounts = [NSArray array];
	[wrapper managedAccounts:accounts];
}
void TWSWrapperWrapper::receiveFA(faDataType pFaDataType, const std::string& cxml) { }
void TWSWrapperWrapper::historicalData(TickerId reqId, const Bar& bar)
{
	TWSBar* tbar = [[TWSBar alloc] initWithBar:bar];
	[wrapper historicalData:reqId bar:tbar];
}
void TWSWrapperWrapper::historicalDataEnd(int reqId, const std::string& startDateStr, const std::string& endDateStr)
{
	[wrapper historicalDataEnd:reqId
				  startDateStr:[NSString stringWithUTF8String:startDateStr.c_str()]
					endDateStr:[NSString stringWithUTF8String:endDateStr.c_str()]];
}
void TWSWrapperWrapper::scannerParameters(const std::string& xml) { }
void TWSWrapperWrapper::scannerData(int reqId, int rank, const ContractDetails& contractDetails,
								  const std::string& distance, const std::string& benchmark, const std::string& projection,
								  const std::string& legsStr) { }
void TWSWrapperWrapper::scannerDataEnd(int reqId) { }
void TWSWrapperWrapper::realtimeBar(TickerId reqId, long time, double open, double high, double low, double close,
									Decimal volume, Decimal wap, int count) { }
void TWSWrapperWrapper::currentTime(long time) { }
void TWSWrapperWrapper::fundamentalData(TickerId reqId, const std::string& data) { }
void TWSWrapperWrapper::deltaNeutralValidation(int reqId, const DeltaNeutralContract& deltaNeutralContract) { }
void TWSWrapperWrapper::tickSnapshotEnd( int reqId)
{
	[wrapper tickSnapshotEnd:reqId];
}
void TWSWrapperWrapper::marketDataType( TickerId reqId, int marketDataType) { }
void TWSWrapperWrapper::commissionReport( const CommissionReport& commissionReport) { }
void TWSWrapperWrapper::position( const std::string& account, const Contract& contract, Decimal position, double avgCost)
{
	NSString* acct = [NSString stringWithUTF8String:account.c_str()];
	TWSContract* cntr = [[TWSContract alloc] initWithContract:contract];
	[wrapper position:acct contract:cntr position:position avgCost:avgCost];
}
void TWSWrapperWrapper::positionEnd()
{
	[wrapper positionEnd];
}
void TWSWrapperWrapper::accountSummary( int reqId, const std::string& account, const std::string& tag, const std::string& value, const std::string& curency) { }
void TWSWrapperWrapper::accountSummaryEnd( int reqId) { }
void TWSWrapperWrapper::verifyMessageAPI( const std::string& apiData) { }
void TWSWrapperWrapper::verifyCompleted( bool isSuccessful, const std::string& errorText) { }
void TWSWrapperWrapper::displayGroupList( int reqId, const std::string& groups) { }
void TWSWrapperWrapper::displayGroupUpdated( int reqId, const std::string& contractInfo) { }
void TWSWrapperWrapper::verifyAndAuthMessageAPI( const std::string& apiData, const std::string& xyzChallange) { }
void TWSWrapperWrapper::verifyAndAuthCompleted( bool isSuccessful, const std::string& errorText) { }
void TWSWrapperWrapper::connectAck() { }
void TWSWrapperWrapper::positionMulti( int reqId, const std::string& account,const std::string& modelCode, const Contract& contract, Decimal pos, double avgCost) {}
void TWSWrapperWrapper::positionMultiEnd( int reqId) { }
void TWSWrapperWrapper::accountUpdateMulti( int reqId, const std::string& account, const std::string& modelCode, const std::string& key, const std::string& value, const std::string& currency) { }
void TWSWrapperWrapper::accountUpdateMultiEnd( int reqId) { }
void TWSWrapperWrapper::securityDefinitionOptionalParameter(int reqId, const std::string& exchange, int underlyingConId, const std::string& tradingClass,
														  const std::string& multiplier, const std::set<std::string>& expirations, const std::set<double>& strikes)
{
	NSMutableArray<NSString*>* exps = [NSMutableArray new];
	for(std::set<std::string>::iterator i = expirations.begin(); i != expirations.end(); ++i)
	{
		[exps addObject:[NSString stringWithUTF8String:i->c_str()]];
	}
	
	NSMutableArray<NSNumber*>* strks = [NSMutableArray new];
	for(std::set<double>::iterator i = strikes.begin(); i != strikes.end(); ++i)
	{
		[strks addObject:[NSNumber numberWithDouble:*i]];
	}
	
	[wrapper securityDefinitionOptionParameter:reqId
									  exchange:[NSString stringWithUTF8String:exchange.c_str()]
							   underlyingConId:underlyingConId
								  tradingClass:[NSString stringWithUTF8String:tradingClass.c_str()]
									multiplier:[NSString stringWithUTF8String:multiplier.c_str()]
								   expirations:exps
									   strikes:strks];
}
void TWSWrapperWrapper::securityDefinitionOptionalParameterEnd(int reqId)
{
	[wrapper securityDefinitionOptionParameterEnd:reqId];
}
void TWSWrapperWrapper::softDollarTiers(int reqId, const std::vector<SoftDollarTier> &tiers) { }
void TWSWrapperWrapper::familyCodes(const std::vector<FamilyCode> &familyCodes) { }
void TWSWrapperWrapper::symbolSamples(int reqId, const std::vector<ContractDescription> &contractDescriptions)
{
	NSMutableArray<TWSContract*>* array = [NSMutableArray array];
	for(std::vector<ContractDescription>::const_iterator i = contractDescriptions.begin(); i != contractDescriptions.end(); ++i)
	{
		TWSContract* contract = [[TWSContract alloc] initWithContract:i->contract];
		[array addObject:contract];
	}
	
	[wrapper symbolSamples:reqId contracts:array];
}
void TWSWrapperWrapper::mktDepthExchanges(const std::vector<DepthMktDataDescription> &depthMktDataDescriptions) { }
void TWSWrapperWrapper::tickNews(int tickerId, time_t timeStamp, const std::string& providerCode, const std::string& articleId, const std::string& headline, const std::string& extraData) { }
void TWSWrapperWrapper::smartComponents(int reqId, const SmartComponentsMap& theMap) { }
void TWSWrapperWrapper::tickReqParams(int tickerId, double minTick, const std::string& bboExchange, int snapshotPermissions) { }
void TWSWrapperWrapper::newsProviders(const std::vector<NewsProvider> &newsProviders) { }
void TWSWrapperWrapper::newsArticle(int requestId, int articleType, const std::string& articleText) { }
void TWSWrapperWrapper::historicalNews(int requestId, const std::string& time, const std::string& providerCode, const std::string& articleId, const std::string& headline) { }
void TWSWrapperWrapper::historicalNewsEnd(int requestId, bool hasMore) { }
void TWSWrapperWrapper::headTimestamp(int reqId, const std::string& headTimestamp) { }
void TWSWrapperWrapper::histogramData(int reqId, const HistogramDataVector& data) { }
void TWSWrapperWrapper::historicalDataUpdate(TickerId reqId, const Bar& bar) { }
void TWSWrapperWrapper::rerouteMktDataReq(int reqId, int conid, const std::string& exchange) { }
void TWSWrapperWrapper::rerouteMktDepthReq(int reqId, int conid, const std::string& exchange) { }
void TWSWrapperWrapper::marketRule(int marketRuleId, const std::vector<PriceIncrement> &priceIncrements) { }
void TWSWrapperWrapper::pnl(int reqId, double dailyPnL, double unrealizedPnL, double realizedPnL) { }
void TWSWrapperWrapper::pnlSingle(int reqId, Decimal pos, double dailyPnL, double unrealizedPnL, double realizedPnL, double value) { }
void TWSWrapperWrapper::historicalTicks(int reqId, const std::vector<HistoricalTick>& ticks, bool done) { }
void TWSWrapperWrapper::historicalTicksBidAsk(int reqId, const std::vector<HistoricalTickBidAsk>& ticks, bool done) { }
void TWSWrapperWrapper::historicalTicksLast(int reqId, const std::vector<HistoricalTickLast>& ticks, bool done) { }
void TWSWrapperWrapper::tickByTickAllLast(int reqId, int tickType, time_t time, double price, Decimal size, const TickAttribLast& tickAttribLast, const std::string& exchange, const std::string& specialConditions) { }
void TWSWrapperWrapper::tickByTickBidAsk(int reqId, time_t time, double bidPrice, double askPrice, Decimal bidSize, Decimal askSize, const TickAttribBidAsk& tickAttribBidAsk) { }
void TWSWrapperWrapper::tickByTickMidPoint(int reqId, time_t time, double midPoint) { }
void TWSWrapperWrapper::orderBound(long long orderId, int apiClientId, int apiOrderId) { }
void TWSWrapperWrapper::completedOrder(const Contract& contract, const Order& order, const OrderState& orderState) { }
void TWSWrapperWrapper::completedOrdersEnd() { }
void TWSWrapperWrapper::replaceFAEnd(int reqId, const std::string& text) { }
void TWSWrapperWrapper::wshMetaData(int reqId, const std::string& dataJson) { }
void TWSWrapperWrapper::wshEventData(int reqId, const std::string& dataJson) { }
