# encoding: UTF-8

from pyctp import pyTdApi
from pyctp.pyTdApi import PyTdApi
from pyctp.ctpTdSpiResponse import TdSpiResponse

from pyctp.ctpConst import THOST_TERT_RESUME, THOST_TERT_RESTART

from pyctp.ctpStruct import pyThostFtdcReqUserLoginField, pyThostFtdcQryTradingAccountField

class myTdSpiResponse(TdSpiResponse):

    def __init__(self, pytadapi):
        self.pytadapi = pytadapi
        self.idRequest = 1

        # 当客户端与交易后台建立起通信连接时（还未登录前），该方法被调用。
    def OnFrontConnected(self):
        pyUserLogin = pyThostFtdcReqUserLoginField()
        pyUserLogin.BrokerID = '9999'
        pyUserLogin.UserID = '000000'
        pyUserLogin.Password = 'xxxxxx'

        self.idRequest += 1
        self.pytadapi.ReqUserLogin(pyUserLogin, self.idRequest)

    # 当客户端与交易后台通信连接断开时，该方法被调用。当发生这个情况后，API会自动重新连接，客户端可不做处理。
    # @param nReason 错误原因
    #         0x1001 网络读失败
    #         0x1002 网络写失败
    #         0x2001 接收心跳超时
    #         0x2002 发送心跳失败
    #         0x2003 收到错误报文
    def OnFrontDisconnected(self, nReason):
        print('OnFrontDisconnected')
	
    # 心跳超时警告。当长时间未收到报文时，该方法被调用。
    # @param nTimeLapse 距离上次接收报文的时间
    def OnHeartBeatWarning(self, nTimeLapse):
        print('OnHeartBeatWarning')

    # 客户端认证响应
    def OnRspAuthenticate(self, pyRspAuthenticateField, pyRspInfo, nRequestID, bIsLast):
        print('OnRspAuthenticate')


    # 登录请求响应
    def OnRspUserLogin(self, pyRspUserLogin, pyRspInfo, nRequestID, bIsLast):
        if pyRspInfo.ErrorID == 0:
            print(pyRspUserLogin.TradingDay)

            pyQryTradingAccount = pyThostFtdcQryTradingAccountField()

            pyQryTradingAccount.BrokerID = '9999'
            pyQryTradingAccount.InvestorID = '000000'
            pyQryTradingAccount.CurrencyID = 'RMB'

            self.idRequest += 1
            self.pytadapi.ReqQryTradingAccount (pyQryTradingAccount, self.idRequest)
        else:
            print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)

    # 登出请求响应
    def OnRspUserLogout(self, pyUserLogout, pyRspInfo, nRequestID, bIsLast):
        if pyRspInfo.ErrorID == 0:
            print('OnRspUserLogout /', pyUserLogout.BrokerID, ':', pyUserLogout.UserID)
        else:
            print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)

    # 用户口令更新请求响应
    def OnRspUserPasswordUpdate(self, pyUserPasswordUpdate, pyRspInfo, nRequestID, bIsLast):
        print('OnRspUserPasswordUpdate')

    # 资金账户口令更新请求响应
    def OnRspTradingAccountPasswordUpdate(self, pyTradingAccountPasswordUpdate, pyRspInfo, nRequestID, bIsLast):
        print('OnRspTradingAccountPasswordUpdate')

    # 报单录入请求响应
    def OnRspOrderInsert(self, pyInputOrder, pyRspInfo, nRequestID, bIsLast):
        print('OnRspOrderInsert')

    # 预埋单录入请求响应
    def OnRspParkedOrderInsert(self, pyParkedOrder, pyRspInfo, nRequestID, bIsLast):
        print('OnRspParkedOrderInsert')

    # 预埋撤单录入请求响应
    def OnRspParkedOrderAction(self, pyParkedOrderAction, pyRspInfo, nRequestID, bIsLast):
        print('OnRspParkedOrderAction')

    # 报单操作请求响应
    def OnRspOrderAction(self, pyInputOrderAction, pyRspInfo, nRequestID, bIsLast):
        print('OnRspOrderAction')

    # 查询最大报单数量响应
    def OnRspQueryMaxOrderVolume(self, pyQueryMaxOrderVolume, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQueryMaxOrderVolume')

    # 投资者结算结果确认响应
    def OnRspSettlementInfoConfirm(self, pySettlementInfoConfirm, pyRspInfo, nRequestID, bIsLast):
        print('OnRspSettlementInfoConfirm')

    # 删除预埋单响应
    def OnRspRemoveParkedOrder(self, pyRemoveParkedOrder, pyRspInfo, nRequestID, bIsLast):
        print('OnRspRemoveParkedOrder')

    # 删除预埋撤单响应
    def OnRspRemoveParkedOrderAction(self, pyRemoveParkedOrderAction, pyRspInfo, nRequestID, bIsLast):
        print('OnRspRemoveParkedOrderAction')

    # 执行宣告录入请求响应
    def OnRspExecOrderInsert(self, pyInputExecOrder, pyRspInfo, nRequestID, bIsLast):
        print('OnRspExecOrderInsert')

    # 执行宣告操作请求响应
    def OnRspExecOrderAction(self, pyInputExecOrderAction, pyRspInfo, nRequestID, bIsLast):
        print('OnRspExecOrderAction')

    # 询价录入请求响应
    def OnRspForQuoteInsert(self, pyInputForQuote, pyRspInfo, nRequestID, bIsLast):
        print('OnRspForQuoteInsert')

    # 报价录入请求响应
    def OnRspQuoteInsert(self, pyInputQuote, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQuoteInsert')

    # 报价操作请求响应
    def OnRspQuoteAction(self, pyInputQuoteAction, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQuoteAction')

    # 申请组合录入请求响应
    def OnRspCombActionInsert(self, pyInputCombAction, pyRspInfo, nRequestID, bIsLast):
        print('OnRspCombActionInsert')

    # 请求查询报单响应
    def OnRspQryOrder(self, pyOrder, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryOrder')

    # 请求查询成交响应
    def OnRspQryTrade(self, pyTrade, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryTrade')

    # 请求查询投资者持仓响应
    def OnRspQryInvestorPosition(self, pyInvestorPosition, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryInvestorPosition')

    # 请求查询资金账户响应
    def OnRspQryTradingAccount(self, pyTradingAccount, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryTradingAccount')

    # 请求查询投资者响应
    def OnRspQryInvestor(self, pyInvestor, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryInvestor')

    # 请求查询交易编码响应
    def OnRspQryTradingCode(self, pyTradingCode, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryTradingCode')

    # 请求查询合约保证金率响应
    def OnRspQryInstrumentMarginRate(self, pyInstrumentMarginRate, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryInstrumentMarginRate')

    # 请求查询合约手续费率响应
    def OnRspQryInstrumentCommissionRate(self, pyInstrumentCommissionRate, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryInstrumentCommissionRate')

    # 请求查询交易所响应
    def OnRspQryExchange(self, pyExchange, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryExchange')

    # 请求查询产品响应
    def OnRspQryProduct(self, pyProduct, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryProduct')

    # 请求查询合约响应
    def OnRspQryInstrument(self, pyInstrument, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryInstrument')

    # 请求查询行情响应
    def OnRspQryDepthMarketData(self, pyDepthMarketData, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryDepthMarketData')

    # 请求查询投资者结算结果响应
    def OnRspQrySettlementInfo(self, pySettlementInfo, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQrySettlementInfo')

    # 请求查询转帐银行响应
    def OnRspQryTransferBank(self, pyTransferBank, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryTransferBank')

    # 请求查询投资者持仓明细响应
    def OnRspQryInvestorPositionDetail(self, pyInvestorPositionDetail, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryInvestorPositionDetail')

    # 请求查询客户通知响应
    def OnRspQryNotice(self, pyNotice, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryNotice')

    # 请求查询结算信息确认响应
    def OnRspQrySettlementInfoConfirm(self, pySettlementInfoConfirm, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQrySettlementInfoConfirm')

    # 请求查询投资者持仓明细响应
    def OnRspQryInvestorPositionCombineDetail(self, pyInvestorPositionCombineDetail, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryInvestorPositionCombineDetail')

    # 查询保证金监管系统经纪公司资金账户密钥响应
    def OnRspQryCFMMCTradingAccountKey(self, pyCFMMCTradingAccountKey, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryCFMMCTradingAccountKey')

    # 请求查询仓单折抵信息响应
    def OnRspQryEWarrantOffset(self, pyEWarrantOffset, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryEWarrantOffset')

    # 请求查询投资者品种/跨品种保证金响应
    def OnRspQryInvestorProductGroupMargin(self, pyInvestorProductGroupMargin, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryInvestorProductGroupMargin')

    # 请求查询交易所保证金率响应
    def OnRspQryExchangeMarginRate(self, pyExchangeMarginRate, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryExchangeMarginRate')

    # 请求查询交易所调整保证金率响应
    def OnRspQryExchangeMarginRateAdjust(self, pyExchangeMarginRateAdjust, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryExchangeMarginRateAdjust')

    # 请求查询汇率响应
    def OnRspQryExchangeRate(self, pyExchangeRate, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryExchangeRate')

    # 请求查询二级代理操作员银期权限响应
    def OnRspQrySecAgentACIDMap(self, pySecAgentACIDMap, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQrySecAgentACIDMap')

    # 请求查询产品组
    def OnRspQryProductGroup(self, pyProductGroup, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryProductGroup')

    # 请求查询报单手续费响应
    def OnRspQryInstrumentOrderCommRate(self, pyInstrumentOrderCommRate, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryInstrumentOrderCommRate')

    # 请求查询期权交易成本响应
    def OnRspQryOptionInstrTradeCost(self, pyOptionInstrTradeCost, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryOptionInstrTradeCost')

    # 请求查询期权合约手续费响应
    def OnRspQryOptionInstrCommRate(self, pyOptionInstrCommRate, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryOptionInstrCommRate')

    # 请求查询执行宣告响应
    def OnRspQryExecOrder(self, pyExecOrder, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryExecOrder')

    # 请求查询询价响应
    def OnRspQryForQuote(self, pyForQuote, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryForQuote')

    # 请求查询报价响应
    def OnRspQryQuote(self, pyQuote, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryQuote')

    # 请求查询组合合约安全系数响应
    def OnRspQryCombInstrumentGuard(self, pyCombInstrumentGuard, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryCombInstrumentGuard')

    # 请求查询申请组合响应
    def OnRspQryCombAction(self, pyCombAction, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryCombAction')

    # 请求查询转帐流水响应
    def OnRspQryTransferSerial(self, pyTransferSerial, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryTransferSerial')

    # 请求查询银期签约关系响应
    def OnRspQryAccountregister(self, pyAccountregister, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryAccountregister')

    # 错误应答
    def OnRspError(self, pyRspInfo, nRequestID, bIsLast):
        print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)

    # 报单通知
    def OnRtnOrder(self, pyOrder):
        print('OnRtnOrder')

    # 成交通知
    def OnRtnTrade(self, pyTrade):
        print('OnRtnTrade')

    # 报单录入错误回报
    def OnErrRtnOrderInsert(self, pyInputOrder, pyRspInfo):
        print('OnErrRtnOrderInsert')

    # 报单操作错误回报
    def OnErrRtnOrderAction(self, pyOrderAction, pyRspInfo):
        print('OnErrRtnOrderAction')

    # 合约交易状态通知
    def OnRtnInstrumentStatus(self, pyInstrumentStatus):
	    print('ExchangeID / ', pyInstrumentStatus.ExchangeID, 'ExchangeInstID / ', pyInstrumentStatus.ExchangeInstID, \
            'SettlementGroupID / ', pyInstrumentStatus.SettlementGroupID, 'InstrumentID / ', pyInstrumentStatus.InstrumentID, \
            'InstrumentStatus / ', pyInstrumentStatus.InstrumentStatus, 'TradingSegmentSN / ', pyInstrumentStatus.TradingSegmentSN, \
            'EnterTime / ', pyInstrumentStatus.EnterTime, 'EnterReason / ', pyInstrumentStatus.EnterReason)

    # 交易通知
    def OnRtnTradingNotice(self, pyTradingNoticeInfo):
        print('OnRtnTradingNotice')

    # 提示条件单校验错误
    def OnRtnErrorConditionalOrder(self, pyErrorConditionalOrder):
        print('OnRtnErrorConditionalOrder')

    # 执行宣告通知
    def OnRtnExecOrder(self, pyExecOrder):
        print('OnRtnExecOrder')

    # 执行宣告录入错误回报
    def OnErrRtnExecOrderInsert(self, pyInputExecOrder, pyRspInfo):
        print('OnErrRtnExecOrderInsert')

    # 执行宣告操作错误回报
    def OnErrRtnExecOrderAction(self, pyExecOrderAction, pyRspInfo):
        print('OnErrRtnExecOrderAction')

    # 询价录入错误回报
    def OnErrRtnForQuoteInsert(self, pyInputForQuote, pyRspInfo):
        print('OnErrRtnForQuoteInsert')

    # 报价通知
    def OnRtnQuote(self, pyQuote):
        print('OnRtnQuote')

    # 报价录入错误回报
    def OnErrRtnQuoteInsert(self, pyInputQuote, pyRspInfo):
        print('OnErrRtnQuoteInsert')

    # 报价操作错误回报
    def OnErrRtnQuoteAction(self, pyQuoteAction, pyRspInfo):
        print('OnErrRtnQuoteAction')

    # 询价通知
    def OnRtnForQuoteRsp(self, pyForQuoteRsp):
        print('OnRtnForQuoteRsp')

    # 保证金监控中心用户令牌
    def OnRtnCFMMCTradingAccountToken(self, pyCFMMCTradingAccountToken):
        print('OnRtnCFMMCTradingAccountToken')

    # 申请组合通知
    def OnRtnCombAction(self, pyCombAction):
        print('OnRtnCombAction')

    # 申请组合录入错误回报
    def OnErrRtnCombActionInsert(self, pyInputCombAction, pyRspInfo):
        print('OnErrRtnCombActionInsert')

    # 请求查询签约银行响应
    def OnRspQryContractBank(self, pyContractBank, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryContractBank')

    # 请求查询预埋单响应
    def OnRspQryParkedOrder(self, pyParkedOrder, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryParkedOrder')

    # 请求查询预埋撤单响应
    def OnRspQryParkedOrderAction(self, pyParkedOrderAction, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryParkedOrderAction')

    # 请求查询交易通知响应
    def OnRspQryTradingNotice(self, pyTradingNotice, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryTradingNotice')

    # 请求查询经纪公司交易参数响应
    def OnRspQryBrokerTradingParams(self, pyBrokerTradingParams, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryBrokerTradingParams')

    # 请求查询经纪公司交易算法响应
    def OnRspQryBrokerTradingAlgos(self, pyBrokerTradingAlgos, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQryBrokerTradingAlgos')

    # 请求查询监控中心用户令牌
    def OnRspQueryCFMMCTradingAccountToken(self, pyQueryCFMMCTradingAccountToken, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQueryCFMMCTradingAccountToken')

    # 银行发起银行资金转期货通知
    def OnRtnFromBankToFutureByBank(self, pyRspTransfer):
        print('OnRtnFromBankToFutureByBank')

    # 银行发起期货资金转银行通知
    def OnRtnFromFutureToBankByBank(self, pyRspTransfer):
        print('OnRtnFromFutureToBankByBank')

    # 银行发起冲正银行转期货通知
    def OnRtnRepealFromBankToFutureByBank(self, pyRspRepeal):
        print('OnRtnRepealFromBankToFutureByBank')

    # 银行发起冲正期货转银行通知
    def OnRtnRepealFromFutureToBankByBank(self, pyRspRepeal):
        print('OnRtnRepealFromFutureToBankByBank')

    # 期货发起银行资金转期货通知
    def OnRtnFromBankToFutureByFuture(self, pyRspTransfer):
        print('OnRtnFromBankToFutureByFuture')

    # 期货发起期货资金转银行通知
    def OnRtnFromFutureToBankByFuture(self, pyRspTransfer):
        print('OnRtnFromFutureToBankByFuture')

    # 系统运行时期货端手工发起冲正银行转期货请求，银行处理完毕后报盘发回的通知
    def OnRtnRepealFromBankToFutureByFutureManual(self, pyRspRepeal):
        print('OnRtnRepealFromBankToFutureByFutureManual')

    # 系统运行时期货端手工发起冲正期货转银行请求，银行处理完毕后报盘发回的通知
    def OnRtnRepealFromFutureToBankByFutureManual(self, pyRspRepeal):
        print('OnRtnRepealFromFutureToBankByFutureManual')

    # 期货发起查询银行余额通知
    def OnRtnQueryBankBalanceByFuture(self, pyNotifyQueryAccount):
        print('OnRtnQueryBankBalanceByFuture')

    # 期货发起银行资金转期货错误回报
    def OnErrRtnBankToFutureByFuture(self, pyReqTransfer, pyRspInfo):
        print('OnErrRtnBankToFutureByFuture')

    # 期货发起期货资金转银行错误回报
    def OnErrRtnFutureToBankByFuture(self, pyReqTransfer, pyRspInfo):
        print('OnErrRtnFutureToBankByFuture')

    # 系统运行时期货端手工发起冲正银行转期货错误回报
    def OnErrRtnRepealBankToFutureByFutureManual(self, pyReqRepeal, pyRspInfo):
        print('OnErrRtnRepealBankToFutureByFutureManual')

    # 系统运行时期货端手工发起冲正期货转银行错误回报
    def OnErrRtnRepealFutureToBankByFutureManual(self, pyReqRepeal, pyRspInfo):
        print('OnErrRtnRepealFutureToBankByFutureManual')

    # 期货发起查询银行余额错误回报
    def OnErrRtnQueryBankBalanceByFuture(self, pyReqQueryAccount, pyRspInfo):
        print('OnErrRtnQueryBankBalanceByFuture')

    # 期货发起冲正银行转期货请求，银行处理完毕后报盘发回的通知
    def OnRtnRepealFromBankToFutureByFuture(self, pyRspRepeal):
        print('OnRtnRepealFromBankToFutureByFuture')

    # 期货发起冲正期货转银行请求，银行处理完毕后报盘发回的通知
    def OnRtnRepealFromFutureToBankByFuture(self, pyRspRepeal):
        print('OnRtnRepealFromFutureToBankByFuture')

    # 期货发起银行资金转期货应答
    def OnRspFromBankToFutureByFuture(self, pyReqTransfer, pyRspInfo, nRequestID, bIsLast):
        print('OnRspFromBankToFutureByFuture')

    # 期货发起期货资金转银行应答
    def OnRspFromFutureToBankByFuture(self, pyReqTransfer, pyRspInfo, nRequestID, bIsLast):
        print('OnRspFromFutureToBankByFuture')

    # 期货发起查询银行余额应答
    def OnRspQueryBankAccountMoneyByFuture(self, pyReqQueryAccount, pyRspInfo, nRequestID, bIsLast):
        print('OnRspQueryBankAccountMoneyByFuture')

    # 银行发起银期开户通知
    def OnRtnOpenAccountByBank(self, pyOpenAccount):
        print('OnRtnOpenAccountByBank')

    # 银行发起银期销户通知
    def OnRtnCancelAccountByBank(self, pyCancelAccount):
        print('OnRtnCancelAccountByBank')

    # 银行发起变更银行账号通知
    def OnRtnChangeAccountByBank(self, pyChangeAccount):
        print('OnRtnChangeAccountByBank')


def main():

    # 产生一个CThostFtdcTraderApi实例
    pytadapi = PyTdApi('tddata/')
    
    # 产生一个事件处理的实例
    pyTdApi.clsTdSpiResponse = myTdSpiResponse(pytadapi)
    
    # 注册一事件处理的实例 
    pytadapi.RegisterSpi()

    pytadapi.RegisterFront('tcp://180.168.146.187:10000') 

    # 订阅私有流 
    #        TERT_RESTART:从本交易日开始重传 
    #        TERT_RESUME:从上次收到的续传 
    #        TERT_QUICK:只传送登录后私有流的内容 
    pytadapi.SubscribePrivateTopic(THOST_TERT_RESTART)

    # 订阅公共流 
    #        TERT_RESTART:从本交易日开始重传 
    #        TERT_RESUME:从上次收到的续传 
    #        TERT_QUICK:只传送登录后公共流的内容 
    pytadapi.SubscribePublicTopic(THOST_TERT_RESTART); 
        
    pytadapi.Init()
    pytadapi.Join()

if __name__ == '__main__':
    main()