# encoding: UTF-8

#########################################################################
### 对TdSpi响应接收类，实际应用时需要继承，并给pyTdApi.clsTdSpiResponse赋值
### 具体看 pyTdSpi.pyx
###
#########################################################################

class TdSpiResponse(object):
    def __init__(self):
        pass

    # 当客户端与交易后台建立起通信连接时（还未登录前），该方法被调用。
    def OnFrontConnected(self):
        raise NotImplementedError

    # 当客户端与交易后台通信连接断开时，该方法被调用。当发生这个情况后，API会自动重新连接，客户端可不做处理。
    # @param nReason 错误原因
    #         0x1001 网络读失败
    #         0x1002 网络写失败
    #         0x2001 接收心跳超时
    #         0x2002 发送心跳失败
    #         0x2003 收到错误报文
    def OnFrontDisconnected(self, nReason):
        raise NotImplementedError
	
    # 心跳超时警告。当长时间未收到报文时，该方法被调用。
    # @param nTimeLapse 距离上次接收报文的时间
    def OnHeartBeatWarning(self, nTimeLapse):
        raise NotImplementedError

    # 客户端认证响应
    def OnRspAuthenticate(self, pyRspAuthenticateField, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError


    # 登录请求响应
    def OnRspUserLogin(self, pyRspUserLogin, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 登出请求响应
    def OnRspUserLogout(self, pyUserLogout, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 用户口令更新请求响应
    def OnRspUserPasswordUpdate(self, pyUserPasswordUpdate, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 资金账户口令更新请求响应
    def OnRspTradingAccountPasswordUpdate(self, pyTradingAccountPasswordUpdate, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 报单录入请求响应
    def OnRspOrderInsert(self, pyInputOrder, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 预埋单录入请求响应
    def OnRspParkedOrderInsert(self, pyParkedOrder, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 预埋撤单录入请求响应
    def OnRspParkedOrderAction(self, pyParkedOrderAction, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 报单操作请求响应
    def OnRspOrderAction(self, pyInputOrderAction, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 查询最大报单数量响应
    def OnRspQueryMaxOrderVolume(self, pyQueryMaxOrderVolume, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 投资者结算结果确认响应
    def OnRspSettlementInfoConfirm(self, pySettlementInfoConfirm, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 删除预埋单响应
    def OnRspRemoveParkedOrder(self, pyRemoveParkedOrder, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 删除预埋撤单响应
    def OnRspRemoveParkedOrderAction(self, pyRemoveParkedOrderAction, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 执行宣告录入请求响应
    def OnRspExecOrderInsert(self, pyInputExecOrder, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 执行宣告操作请求响应
    def OnRspExecOrderAction(self, pyInputExecOrderAction, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 询价录入请求响应
    def OnRspForQuoteInsert(self, pyInputForQuote, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 报价录入请求响应
    def OnRspQuoteInsert(self, pyInputQuote, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 报价操作请求响应
    def OnRspQuoteAction(self, pyInputQuoteAction, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 申请组合录入请求响应
    def OnRspCombActionInsert(self, pyInputCombAction, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询报单响应
    def OnRspQryOrder(self, pyOrder, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询成交响应
    def OnRspQryTrade(self, pyTrade, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询投资者持仓响应
    def OnRspQryInvestorPosition(self, pyInvestorPosition, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询资金账户响应
    def OnRspQryTradingAccount(self, pyTradingAccount, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询投资者响应
    def OnRspQryInvestor(self, pyInvestor, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询交易编码响应
    def OnRspQryTradingCode(self, pyTradingCode, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询合约保证金率响应
    def OnRspQryInstrumentMarginRate(self, pyInstrumentMarginRate, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询合约手续费率响应
    def OnRspQryInstrumentCommissionRate(self, pyInstrumentCommissionRate, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询交易所响应
    def OnRspQryExchange(self, pyExchange, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询产品响应
    def OnRspQryProduct(self, pyProduct, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询合约响应
    def OnRspQryInstrument(self, pyInstrument, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询行情响应
    def OnRspQryDepthMarketData(self, pyDepthMarketData, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询投资者结算结果响应
    def OnRspQrySettlementInfo(self, pySettlementInfo, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询转帐银行响应
    def OnRspQryTransferBank(self, pyTransferBank, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询投资者持仓明细响应
    def OnRspQryInvestorPositionDetail(self, pyInvestorPositionDetail, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询客户通知响应
    def OnRspQryNotice(self, pyNotice, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询结算信息确认响应
    def OnRspQrySettlementInfoConfirm(self, pySettlementInfoConfirm, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询投资者持仓明细响应
    def OnRspQryInvestorPositionCombineDetail(self, pyInvestorPositionCombineDetail, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 查询保证金监管系统经纪公司资金账户密钥响应
    def OnRspQryCFMMCTradingAccountKey(self, pyCFMMCTradingAccountKey, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询仓单折抵信息响应
    def OnRspQryEWarrantOffset(self, pyEWarrantOffset, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询投资者品种/跨品种保证金响应
    def OnRspQryInvestorProductGroupMargin(self, pyInvestorProductGroupMargin, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询交易所保证金率响应
    def OnRspQryExchangeMarginRate(self, pyExchangeMarginRate, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询交易所调整保证金率响应
    def OnRspQryExchangeMarginRateAdjust(self, pyExchangeMarginRateAdjust, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询汇率响应
    def OnRspQryExchangeRate(self, pyExchangeRate, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询二级代理操作员银期权限响应
    def OnRspQrySecAgentACIDMap(self, pySecAgentACIDMap, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询产品组
    def OnRspQryProductGroup(self, pyProductGroup, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询报单手续费响应
    def OnRspQryInstrumentOrderCommRate(self, pyInstrumentOrderCommRate, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询期权交易成本响应
    def OnRspQryOptionInstrTradeCost(self, pyOptionInstrTradeCost, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询期权合约手续费响应
    def OnRspQryOptionInstrCommRate(self, pyOptionInstrCommRate, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询执行宣告响应
    def OnRspQryExecOrder(self, pyExecOrder, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询询价响应
    def OnRspQryForQuote(self, pyForQuote, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询报价响应
    def OnRspQryQuote(self, pyQuote, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询组合合约安全系数响应
    def OnRspQryCombInstrumentGuard(self, pyCombInstrumentGuard, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询申请组合响应
    def OnRspQryCombAction(self, pyCombAction, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询转帐流水响应
    def OnRspQryTransferSerial(self, pyTransferSerial, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询银期签约关系响应
    def OnRspQryAccountregister(self, pyAccountregister, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 错误应答
    def OnRspError(self, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 报单通知
    def OnRtnOrder(self, pyOrder):
        raise NotImplementedError

    # 成交通知
    def OnRtnTrade(self, pyTrade):
        raise NotImplementedError

    # 报单录入错误回报
    def OnErrRtnOrderInsert(self, pyInputOrder, pyRspInfo):
        raise NotImplementedError

    # 报单操作错误回报
    def OnErrRtnOrderAction(self, pyOrderAction, pyRspInfo):
        raise NotImplementedError

    # 合约交易状态通知
    def OnRtnInstrumentStatus(self, pyInstrumentStatus):
        raise NotImplementedError

    # 交易通知
    def OnRtnTradingNotice(self, pyTradingNoticeInfo):
        raise NotImplementedError

    # 提示条件单校验错误
    def OnRtnErrorConditionalOrder(self, pyErrorConditionalOrder):
        raise NotImplementedError

    # 执行宣告通知
    def OnRtnExecOrder(self, pyExecOrder):
        raise NotImplementedError

    # 执行宣告录入错误回报
    def OnErrRtnExecOrderInsert(self, pyInputExecOrder, pyRspInfo):
        raise NotImplementedError

    # 执行宣告操作错误回报
    def OnErrRtnExecOrderAction(self, pyExecOrderAction, pyRspInfo):
        raise NotImplementedError

    # 询价录入错误回报
    def OnErrRtnForQuoteInsert(self, pyInputForQuote, pyRspInfo):
        raise NotImplementedError

    # 报价通知
    def OnRtnQuote(self, pyQuote):
        raise NotImplementedError

    # 报价录入错误回报
    def OnErrRtnQuoteInsert(self, pyInputQuote, pyRspInfo):
        raise NotImplementedError

    # 报价操作错误回报
    def OnErrRtnQuoteAction(self, pyQuoteAction, pyRspInfo):
        raise NotImplementedError

    # 询价通知
    def OnRtnForQuoteRsp(self, pyForQuoteRsp):
        raise NotImplementedError

    # 保证金监控中心用户令牌
    def OnRtnCFMMCTradingAccountToken(self, pyCFMMCTradingAccountToken):
        raise NotImplementedError

    # 申请组合通知
    def OnRtnCombAction(self, pyCombAction):
        raise NotImplementedError

    # 申请组合录入错误回报
    def OnErrRtnCombActionInsert(self, pyInputCombAction, pyRspInfo):
        raise NotImplementedError

    # 请求查询签约银行响应
    def OnRspQryContractBank(self, pyContractBank, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询预埋单响应
    def OnRspQryParkedOrder(self, pyParkedOrder, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询预埋撤单响应
    def OnRspQryParkedOrderAction(self, pyParkedOrderAction, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询交易通知响应
    def OnRspQryTradingNotice(self, pyTradingNotice, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询经纪公司交易参数响应
    def OnRspQryBrokerTradingParams(self, pyBrokerTradingParams, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询经纪公司交易算法响应
    def OnRspQryBrokerTradingAlgos(self, pyBrokerTradingAlgos, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 请求查询监控中心用户令牌
    def OnRspQueryCFMMCTradingAccountToken(self, pyQueryCFMMCTradingAccountToken, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 银行发起银行资金转期货通知
    def OnRtnFromBankToFutureByBank(self, pyRspTransfer):
        raise NotImplementedError

    # 银行发起期货资金转银行通知
    def OnRtnFromFutureToBankByBank(self, pyRspTransfer):
        raise NotImplementedError

    # 银行发起冲正银行转期货通知
    def OnRtnRepealFromBankToFutureByBank(self, pyRspRepeal):
        raise NotImplementedError

    # 银行发起冲正期货转银行通知
    def OnRtnRepealFromFutureToBankByBank(self, pyRspRepeal):
        raise NotImplementedError

    # 期货发起银行资金转期货通知
    def OnRtnFromBankToFutureByFuture(self, pyRspTransfer):
        raise NotImplementedError

    # 期货发起期货资金转银行通知
    def OnRtnFromFutureToBankByFuture(self, pyRspTransfer):
        raise NotImplementedError

    # 系统运行时期货端手工发起冲正银行转期货请求，银行处理完毕后报盘发回的通知
    def OnRtnRepealFromBankToFutureByFutureManual(self, pyRspRepeal):
        raise NotImplementedError

    # 系统运行时期货端手工发起冲正期货转银行请求，银行处理完毕后报盘发回的通知
    def OnRtnRepealFromFutureToBankByFutureManual(self, pyRspRepeal):
        raise NotImplementedError

    # 期货发起查询银行余额通知
    def OnRtnQueryBankBalanceByFuture(self, pyNotifyQueryAccount):
        raise NotImplementedError

    # 期货发起银行资金转期货错误回报
    def OnErrRtnBankToFutureByFuture(self, pyReqTransfer, pyRspInfo):
        raise NotImplementedError

    # 期货发起期货资金转银行错误回报
    def OnErrRtnFutureToBankByFuture(self, pyReqTransfer, pyRspInfo):
        raise NotImplementedError

    # 系统运行时期货端手工发起冲正银行转期货错误回报
    def OnErrRtnRepealBankToFutureByFutureManual(self, pyReqRepeal, pyRspInfo):
        raise NotImplementedError

    # 系统运行时期货端手工发起冲正期货转银行错误回报
    def OnErrRtnRepealFutureToBankByFutureManual(self, pyReqRepeal, pyRspInfo):
        raise NotImplementedError

    # 期货发起查询银行余额错误回报
    def OnErrRtnQueryBankBalanceByFuture(self, pyReqQueryAccount, pyRspInfo):
        raise NotImplementedError

    # 期货发起冲正银行转期货请求，银行处理完毕后报盘发回的通知
    def OnRtnRepealFromBankToFutureByFuture(self, pyRspRepeal):
        raise NotImplementedError

    # 期货发起冲正期货转银行请求，银行处理完毕后报盘发回的通知
    def OnRtnRepealFromFutureToBankByFuture(self, pyRspRepeal):
        raise NotImplementedError

    # 期货发起银行资金转期货应答
    def OnRspFromBankToFutureByFuture(self, pyReqTransfer, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 期货发起期货资金转银行应答
    def OnRspFromFutureToBankByFuture(self, pyReqTransfer, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 期货发起查询银行余额应答
    def OnRspQueryBankAccountMoneyByFuture(self, pyReqQueryAccount, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 银行发起银期开户通知
    def OnRtnOpenAccountByBank(self, pyOpenAccount):
        raise NotImplementedError

    # 银行发起银期销户通知
    def OnRtnCancelAccountByBank(self, pyCancelAccount):
        raise NotImplementedError

    # 银行发起变更银行账号通知
    def OnRtnChangeAccountByBank(self, pyChangeAccount):
        raise NotImplementedError
        