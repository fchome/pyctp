# encoding: UTF-8

cimport ctpCStruct
from ctpCStruct cimport *


cdef extern from "TdSpi.h":
    cdef cppclass TdSpi

cdef extern from "TdApi.h":
    cdef cppclass TdApi:
        TdApi() except +

        # 创建TdApi
        # @param pszFlowPath 存贮订阅信息文件的目录，默认为当前目录
        # @return 创建出的UserApi
        TdApi(char *pszFlowPath) except +

        # 删除接口对象本身
        # @remark 不再使用本接口对象时,调用该函数删除接口对象
        void Release()

        # 初始化
        # @remark 初始化运行环境,只有调用后,接口才开始工作
        void Init()

        # 等待接口线程结束运行
        # @return 线程退出代码
        int Join()

        # 获取当前交易日
        # @retrun 获取到的交易日
        # @remark 只有登录成功后,才能得到正确的交易日
        const char *GetTradingDay()

        # 注册前置机网络地址
        # @param pszFrontAddress：前置机网络地址。
        # @remark 网络地址的格式为：“protocol://ipaddress:port”，如：”tcp://127.0.0.1:17001”。 
        # @remark “tcp”代表传输协议，“127.0.0.1”代表服务器地址。”17001”代表服务器端口号。
        void RegisterFront(char *pszFrontAddress)

        # 注册名字服务器网络地址
        # @param pszNsAddress：名字服务器网络地址。
        # @remark 网络地址的格式为：“protocol://ipaddress:port”，如：”tcp://127.0.0.1:12001”。 
        # @remark “tcp”代表传输协议，“127.0.0.1”代表服务器地址。”12001”代表服务器端口号。
        # @remark RegisterNameServer优先于RegisterFront
        void RegisterNameServer(char *pszNsAddress)

        # 注册名字服务器用户信息
        # @param pFensUserInfo：用户信息。
        void RegisterFensUserInfo(CThostFtdcFensUserInfoField * pFensUserInfo)

        # 注册回调接口
        void RegisterSpi()

        # 订阅私有流。
        # @param nResumeType 私有流重传方式  
        #         THOST_TERT_RESTART:从本交易日开始重传
        #         THOST_TERT_RESUME:从上次收到的续传
        #         THOST_TERT_QUICK:只传送登录后私有流的内容
        # @remark 该方法要在Init方法前调用。若不调用则不会收到私有流的数据。
        void SubscribePrivateTopic(THOST_TE_RESUME_TYPE nResumeType)

        # 订阅公共流。
        # @param nResumeType 公共流重传方式  
        #         THOST_TERT_RESTART:从本交易日开始重传
        #         THOST_TERT_RESUME:从上次收到的续传
        #         THOST_TERT_QUICK:只传送登录后公共流的内容
        # @remark 该方法要在Init方法前调用。若不调用则不会收到公共流的数据。
        void SubscribePublicTopic(THOST_TE_RESUME_TYPE nResumeType)

        # 客户端认证请求
        int ReqAuthenticate(CThostFtdcReqAuthenticateField *pReqAuthenticateField, int nRequestID)

        # 用户登录请求
        int ReqUserLogin(CThostFtdcReqUserLoginField *pReqUserLoginField, int nRequestID)


        # 登出请求
        int ReqUserLogout(CThostFtdcUserLogoutField *pUserLogout, int nRequestID)

        # 用户口令更新请求
        int ReqUserPasswordUpdate(CThostFtdcUserPasswordUpdateField *pUserPasswordUpdate, int nRequestID)

        # 资金账户口令更新请求
        int ReqTradingAccountPasswordUpdate(CThostFtdcTradingAccountPasswordUpdateField *pTradingAccountPasswordUpdate, int nRequestID)

        # 报单录入请求
        int ReqOrderInsert(CThostFtdcInputOrderField *pInputOrder, int nRequestID)

        # 预埋单录入请求
        int ReqParkedOrderInsert(CThostFtdcParkedOrderField *pParkedOrder, int nRequestID)

        # 预埋撤单录入请求
        int ReqParkedOrderAction(CThostFtdcParkedOrderActionField *pParkedOrderAction, int nRequestID)

        # 报单操作请求
        int ReqOrderAction(CThostFtdcInputOrderActionField *pInputOrderAction, int nRequestID)

        # 查询最大报单数量请求
        int ReqQueryMaxOrderVolume(CThostFtdcQueryMaxOrderVolumeField *pQueryMaxOrderVolume, int nRequestID)

        # 投资者结算结果确认
        int ReqSettlementInfoConfirm(CThostFtdcSettlementInfoConfirmField *pSettlementInfoConfirm, int nRequestID)

        # 请求删除预埋单
        int ReqRemoveParkedOrder(CThostFtdcRemoveParkedOrderField *pRemoveParkedOrder, int nRequestID)

        # 请求删除预埋撤单
        int ReqRemoveParkedOrderAction(CThostFtdcRemoveParkedOrderActionField *pRemoveParkedOrderAction, int nRequestID)

        # 执行宣告录入请求
        int ReqExecOrderInsert(CThostFtdcInputExecOrderField *pInputExecOrder, int nRequestID)

        # 执行宣告操作请求
        int ReqExecOrderAction(CThostFtdcInputExecOrderActionField *pInputExecOrderAction, int nRequestID)

        # 询价录入请求
        int ReqForQuoteInsert(CThostFtdcInputForQuoteField *pInputForQuote, int nRequestID)

        # 报价录入请求
        int ReqQuoteInsert(CThostFtdcInputQuoteField *pInputQuote, int nRequestID)

        # 报价操作请求
        int ReqQuoteAction(CThostFtdcInputQuoteActionField *pInputQuoteAction, int nRequestID)

        # 申请组合录入请求
        int ReqCombActionInsert(CThostFtdcInputCombActionField *pInputCombAction, int nRequestID)

        # 请求查询报单
        int ReqQryOrder(CThostFtdcQryOrderField *pQryOrder, int nRequestID)

        # 请求查询成交
        int ReqQryTrade(CThostFtdcQryTradeField *pQryTrade, int nRequestID)

        # 请求查询投资者持仓
        int ReqQryInvestorPosition(CThostFtdcQryInvestorPositionField *pQryInvestorPosition, int nRequestID)

        # 请求查询资金账户
        int ReqQryTradingAccount(CThostFtdcQryTradingAccountField *pQryTradingAccount, int nRequestID)

        # 请求查询投资者
        int ReqQryInvestor(CThostFtdcQryInvestorField *pQryInvestor, int nRequestID)

        # 请求查询交易编码
        int ReqQryTradingCode(CThostFtdcQryTradingCodeField *pQryTradingCode, int nRequestID)

        # 请求查询合约保证金率
        int ReqQryInstrumentMarginRate(CThostFtdcQryInstrumentMarginRateField *pQryInstrumentMarginRate, int nRequestID)

        # 请求查询合约手续费率
        int ReqQryInstrumentCommissionRate(CThostFtdcQryInstrumentCommissionRateField *pQryInstrumentCommissionRate, int nRequestID)

        # 请求查询交易所
        int ReqQryExchange(CThostFtdcQryExchangeField *pQryExchange, int nRequestID)

        # 请求查询产品
        int ReqQryProduct(CThostFtdcQryProductField *pQryProduct, int nRequestID)

        # 请求查询合约
        int ReqQryInstrument(CThostFtdcQryInstrumentField *pQryInstrument, int nRequestID)

        # 请求查询行情
        int ReqQryDepthMarketData(CThostFtdcQryDepthMarketDataField *pQryDepthMarketData, int nRequestID)

        # 请求查询投资者结算结果
        int ReqQrySettlementInfo(CThostFtdcQrySettlementInfoField *pQrySettlementInfo, int nRequestID)

        # 请求查询转帐银行
        int ReqQryTransferBank(CThostFtdcQryTransferBankField *pQryTransferBank, int nRequestID)

        # 请求查询投资者持仓明细
        int ReqQryInvestorPositionDetail(CThostFtdcQryInvestorPositionDetailField *pQryInvestorPositionDetail, int nRequestID)

        # 请求查询客户通知
        int ReqQryNotice(CThostFtdcQryNoticeField *pQryNotice, int nRequestID)

        # 请求查询结算信息确认
        int ReqQrySettlementInfoConfirm(CThostFtdcQrySettlementInfoConfirmField *pQrySettlementInfoConfirm, int nRequestID)

        # 请求查询投资者持仓明细
        int ReqQryInvestorPositionCombineDetail(CThostFtdcQryInvestorPositionCombineDetailField *pQryInvestorPositionCombineDetail, int nRequestID)

        # 请求查询保证金监管系统经纪公司资金账户密钥
        int ReqQryCFMMCTradingAccountKey(CThostFtdcQryCFMMCTradingAccountKeyField *pQryCFMMCTradingAccountKey, int nRequestID)

        # 请求查询仓单折抵信息
        int ReqQryEWarrantOffset(CThostFtdcQryEWarrantOffsetField *pQryEWarrantOffset, int nRequestID)

        # 请求查询投资者品种/跨品种保证金
        int ReqQryInvestorProductGroupMargin(CThostFtdcQryInvestorProductGroupMarginField *pQryInvestorProductGroupMargin, int nRequestID)

        # 请求查询交易所保证金率
        int ReqQryExchangeMarginRate(CThostFtdcQryExchangeMarginRateField *pQryExchangeMarginRate, int nRequestID)

        # 请求查询交易所调整保证金率
        int ReqQryExchangeMarginRateAdjust(CThostFtdcQryExchangeMarginRateAdjustField *pQryExchangeMarginRateAdjust, int nRequestID)

        # 请求查询汇率
        int ReqQryExchangeRate(CThostFtdcQryExchangeRateField *pQryExchangeRate, int nRequestID)

        # 请求查询二级代理操作员银期权限
        int ReqQrySecAgentACIDMap(CThostFtdcQrySecAgentACIDMapField *pQrySecAgentACIDMap, int nRequestID)

        # 请求查询产品组
        int ReqQryProductGroup(CThostFtdcQryProductGroupField *pQryProductGroup, int nRequestID)

        # 请求查询报单手续费
        int ReqQryInstrumentOrderCommRate(CThostFtdcQryInstrumentOrderCommRateField *pQryInstrumentOrderCommRate, int nRequestID)

        # 请求查询期权交易成本
        int ReqQryOptionInstrTradeCost(CThostFtdcQryOptionInstrTradeCostField *pQryOptionInstrTradeCost, int nRequestID)

        # 请求查询期权合约手续费
        int ReqQryOptionInstrCommRate(CThostFtdcQryOptionInstrCommRateField *pQryOptionInstrCommRate, int nRequestID)

        # 请求查询执行宣告
        int ReqQryExecOrder(CThostFtdcQryExecOrderField *pQryExecOrder, int nRequestID)

        # 请求查询询价
        int ReqQryForQuote(CThostFtdcQryForQuoteField *pQryForQuote, int nRequestID)

        # 请求查询报价
        int ReqQryQuote(CThostFtdcQryQuoteField *pQryQuote, int nRequestID)

        # 请求查询组合合约安全系数
        int ReqQryCombInstrumentGuard(CThostFtdcQryCombInstrumentGuardField *pQryCombInstrumentGuard, int nRequestID)

        # 请求查询申请组合
        int ReqQryCombAction(CThostFtdcQryCombActionField *pQryCombAction, int nRequestID)

        # 请求查询转帐流水
        int ReqQryTransferSerial(CThostFtdcQryTransferSerialField *pQryTransferSerial, int nRequestID)

        # 请求查询银期签约关系
        int ReqQryAccountregister(CThostFtdcQryAccountregisterField *pQryAccountregister, int nRequestID)

        # 请求查询签约银行
        int ReqQryContractBank(CThostFtdcQryContractBankField *pQryContractBank, int nRequestID)

        # 请求查询预埋单
        int ReqQryParkedOrder(CThostFtdcQryParkedOrderField *pQryParkedOrder, int nRequestID)

        # 请求查询预埋撤单
        int ReqQryParkedOrderAction(CThostFtdcQryParkedOrderActionField *pQryParkedOrderAction, int nRequestID)

        # 请求查询交易通知
        int ReqQryTradingNotice(CThostFtdcQryTradingNoticeField *pQryTradingNotice, int nRequestID)

        # 请求查询经纪公司交易参数
        int ReqQryBrokerTradingParams(CThostFtdcQryBrokerTradingParamsField *pQryBrokerTradingParams, int nRequestID)

        # 请求查询经纪公司交易算法
        int ReqQryBrokerTradingAlgos(CThostFtdcQryBrokerTradingAlgosField *pQryBrokerTradingAlgos, int nRequestID)

        # 请求查询监控中心用户令牌
        int ReqQueryCFMMCTradingAccountToken(CThostFtdcQueryCFMMCTradingAccountTokenField *pQueryCFMMCTradingAccountToken, int nRequestID)

        # 期货发起银行资金转期货请求
        int ReqFromBankToFutureByFuture(CThostFtdcReqTransferField *pReqTransfer, int nRequestID)

        # 期货发起期货资金转银行请求
        int ReqFromFutureToBankByFuture(CThostFtdcReqTransferField *pReqTransfer, int nRequestID)

        # 期货发起查询银行余额请求
        int ReqQueryBankAccountMoneyByFuture(CThostFtdcReqQueryAccountField *pReqQueryAccount, int nRequestID)