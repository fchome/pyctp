# encoding: UTF-8

from libc.stdlib cimport malloc, free

from ctpTdSpiResponse import *
from ctpStruct import *

clsTdSpiResponse = None

def attr_decode(clsv):
    for name, value in vars(clsv).items():
        if isinstance(getattr(clsv, name), bytes):
            setattr(clsv, name, value.decode('gb2312'))



# 当客户端与交易后台建立起通信连接时（还未登录前），该方法被调用。
cdef extern void OnStaticFrontConnected():
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    clsTdSpiResponse.OnFrontConnected()

# 当客户端与交易后台通信连接断开时，该方法被调用。当发生这个情况后，API会自动重新连接，客户端可不做处理。
# @param nReason 错误原因
#         0x1001 网络读失败
#         0x1002 网络写失败
#         0x2001 接收心跳超时
#         0x2002 发送心跳失败
#         0x2003 收到错误报文
cdef extern void OnStaticFrontDisconnected(int nReason):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    clsTdSpiResponse.OnFrontDisconnected(nReason)
    
# 心跳超时警告。当长时间未收到报文时，该方法被调用。
# @param nTimeLapse 距离上次接收报文的时间
cdef extern void OnStaticHeartBeatWarning(int nTimeLapse):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    clsTdSpiResponse.OnHeartBeatWarning(nTimeLapse)

# 客户端认证响应
cdef extern void OnStaticRspAuthenticate(CThostFtdcRspAuthenticateField *pRspAuthenticateField, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspAuthenticateField = None
    if pRspAuthenticateField:
        pyRspAuthenticateField = pyThostFtdcRspAuthenticateField()
    
        ###经纪公司代码
        pyRspAuthenticateField.BrokerID = pRspAuthenticateField.BrokerID
        ###用户代码
        pyRspAuthenticateField.UserID = pRspAuthenticateField.UserID
        ###用户端产品信息
        pyRspAuthenticateField.UserProductInfo = pRspAuthenticateField.UserProductInfo
    
        attr_decode(pyRspAuthenticateField)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspAuthenticate(pyRspAuthenticateField, pyRspInfo, nRequestID, bIsLast)

# 登录请求响应
cdef extern void OnStaticRspUserLogin(CThostFtdcRspUserLoginField *pRspUserLogin, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspUserLogin = None
    if pRspUserLogin:
        pyRspUserLogin = pyThostFtdcRspUserLoginField()
    
        ###交易日
        pyRspUserLogin.TradingDay = pRspUserLogin.TradingDay
        ###登录成功时间
        pyRspUserLogin.LoginTime = pRspUserLogin.LoginTime
        ###经纪公司代码
        pyRspUserLogin.BrokerID = pRspUserLogin.BrokerID
        ###用户代码
        pyRspUserLogin.UserID = pRspUserLogin.UserID
        ###交易系统名称
        pyRspUserLogin.SystemName = pRspUserLogin.SystemName
        ###前置编号
        pyRspUserLogin.FrontID = pRspUserLogin.FrontID
        ###会话编号
        pyRspUserLogin.SessionID = pRspUserLogin.SessionID
        ###最大报单引用
        pyRspUserLogin.MaxOrderRef = pRspUserLogin.MaxOrderRef
        ###上期所时间
        pyRspUserLogin.SHFETime = pRspUserLogin.SHFETime
        ###大商所时间
        pyRspUserLogin.DCETime = pRspUserLogin.DCETime
        ###郑商所时间
        pyRspUserLogin.CZCETime = pRspUserLogin.CZCETime
        ###中金所时间
        pyRspUserLogin.FFEXTime = pRspUserLogin.FFEXTime
        ###能源中心时间
        pyRspUserLogin.INETime = pRspUserLogin.INETime    
    
        attr_decode(pyRspUserLogin)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspUserLogin(pyRspUserLogin, pyRspInfo, nRequestID, bIsLast)

# 登出请求响应
cdef extern void OnStaticRspUserLogout(CThostFtdcUserLogoutField *pUserLogout, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyUserLogout = None
    if pUserLogout:
        pyUserLogout = pyThostFtdcUserLogoutField()
    
        ###经纪公司代码
        pyUserLogout.BrokerID = pUserLogout.BrokerID
        ###用户代码
        pyUserLogout.UserID = pUserLogout.UserID
    
        attr_decode(pyUserLogout)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspUserLogout(pyUserLogout, pyRspInfo, nRequestID, bIsLast)

# 用户口令更新请求响应
cdef extern void OnStaticRspUserPasswordUpdate(CThostFtdcUserPasswordUpdateField *pUserPasswordUpdate, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyUserPasswordUpdate = None
    if pUserPasswordUpdate:
        pyUserPasswordUpdate = pyThostFtdcUserPasswordUpdateField()
    
        ###经纪公司代码
        pyUserPasswordUpdate.BrokerID = pUserPasswordUpdate.BrokerID
        ###用户代码
        pyUserPasswordUpdate.UserID = pUserPasswordUpdate.UserID
        ###原来的口令
        pyUserPasswordUpdate.OldPassword = pUserPasswordUpdate.OldPassword
        ###新的口令
        pyUserPasswordUpdate.NewPassword = pUserPasswordUpdate.NewPassword
    
        attr_decode(pyUserPasswordUpdate)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspUserPasswordUpdate(pyUserPasswordUpdate, pyRspInfo, nRequestID, bIsLast)

# 资金账户口令更新请求响应
cdef extern void OnStaticRspTradingAccountPasswordUpdate(CThostFtdcTradingAccountPasswordUpdateField *pTradingAccountPasswordUpdate, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyTradingAccountPasswordUpdate = None
    if pTradingAccountPasswordUpdate:
        pyTradingAccountPasswordUpdate = pyThostFtdcTradingAccountPasswordUpdateField()
    
        ###经纪公司代码
        pyTradingAccountPasswordUpdate.BrokerID = pTradingAccountPasswordUpdate.BrokerID
        ###投资者帐号
        pyTradingAccountPasswordUpdate.AccountID = pTradingAccountPasswordUpdate.AccountID
        ###原来的口令
        pyTradingAccountPasswordUpdate.OldPassword = pTradingAccountPasswordUpdate.OldPassword
        ###新的口令
        pyTradingAccountPasswordUpdate.NewPassword = pTradingAccountPasswordUpdate.NewPassword
        ###币种代码
        pyTradingAccountPasswordUpdate.CurrencyID = pTradingAccountPasswordUpdate.CurrencyID
    
        attr_decode(pyTradingAccountPasswordUpdate)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspTradingAccountPasswordUpdate(pyTradingAccountPasswordUpdate, pyRspInfo, nRequestID, bIsLast)

# 报单录入请求响应
cdef extern void OnStaticRspOrderInsert(CThostFtdcInputOrderField *pInputOrder, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputOrder = None
    if pInputOrder:
        pyInputOrder = pyThostFtdcInputOrderField()
    
        ###经纪公司代码
        pyInputOrder.BrokerID = pInputOrder.BrokerID
        ###投资者代码
        pyInputOrder.InvestorID = pInputOrder.InvestorID
        ###合约代码
        pyInputOrder.InstrumentID = pInputOrder.InstrumentID
        ###报单引用
        pyInputOrder.OrderRef = pInputOrder.OrderRef
        ###用户代码
        pyInputOrder.UserID = pInputOrder.UserID
        ###报单价格条件
        pyInputOrder.OrderPriceType = pInputOrder.OrderPriceType
        ###买卖方向
        pyInputOrder.Direction = pInputOrder.Direction
        ###组合开平标志
        pyInputOrder.CombOffsetFlag = pInputOrder.CombOffsetFlag
        ###组合投机套保标志
        pyInputOrder.CombHedgeFlag = pInputOrder.CombHedgeFlag
        ###价格
        pyInputOrder.LimitPrice = pInputOrder.LimitPrice
        ###数量
        pyInputOrder.VolumeTotalOriginal = pInputOrder.VolumeTotalOriginal
        ###有效期类型
        pyInputOrder.TimeCondition = pInputOrder.TimeCondition
        ###GTD日期
        pyInputOrder.GTDDate = pInputOrder.GTDDate
        ###成交量类型
        pyInputOrder.VolumeCondition = pInputOrder.VolumeCondition
        ###最小成交量
        pyInputOrder.MinVolume = pInputOrder.MinVolume
        ###触发条件
        pyInputOrder.ContingentCondition = pInputOrder.ContingentCondition
        ###止损价
        pyInputOrder.StopPrice = pInputOrder.StopPrice
        ###强平原因
        pyInputOrder.ForceCloseReason = pInputOrder.ForceCloseReason
        ###自动挂起标志
        pyInputOrder.IsAutoSuspend = pInputOrder.IsAutoSuspend
        ###业务单元
        pyInputOrder.BusinessUnit = pInputOrder.BusinessUnit
        ###请求编号
        pyInputOrder.RequestID = pInputOrder.RequestID
        ###用户强评标志
        pyInputOrder.UserForceClose = pInputOrder.UserForceClose
        ###互换单标志
        pyInputOrder.IsSwapOrder = pInputOrder.IsSwapOrder
    
        attr_decode(pyInputOrder)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspOrderInsert(pyInputOrder, pyRspInfo, nRequestID, bIsLast)

# 预埋单录入请求响应
cdef extern void OnStaticRspParkedOrderInsert(CThostFtdcParkedOrderField *pParkedOrder, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyParkedOrder = None
    if pParkedOrder:
        pyParkedOrder = pyThostFtdcParkedOrderField()
    
        ###经纪公司代码
        pyParkedOrder.BrokerID = pParkedOrder.BrokerID
        ###投资者代码
        pyParkedOrder.InvestorID = pParkedOrder.InvestorID
        ###合约代码
        pyParkedOrder.InstrumentID = pParkedOrder.InstrumentID
        ###报单引用
        pyParkedOrder.OrderRef = pParkedOrder.OrderRef
        ###用户代码
        pyParkedOrder.UserID = pParkedOrder.UserID
        ###报单价格条件
        pyParkedOrder.OrderPriceType = pParkedOrder.OrderPriceType
        ###买卖方向
        pyParkedOrder.Direction = pParkedOrder.Direction
        ###组合开平标志
        pyParkedOrder.CombOffsetFlag = pParkedOrder.CombOffsetFlag
        ###组合投机套保标志
        pyParkedOrder.CombHedgeFlag = pParkedOrder.CombHedgeFlag
        ###价格
        pyParkedOrder.LimitPrice = pParkedOrder.LimitPrice
        ###数量
        pyParkedOrder.VolumeTotalOriginal = pParkedOrder.VolumeTotalOriginal
        ###有效期类型
        pyParkedOrder.TimeCondition = pParkedOrder.TimeCondition
        ###GTD日期
        pyParkedOrder.GTDDate = pParkedOrder.GTDDate
        ###成交量类型
        pyParkedOrder.VolumeCondition = pParkedOrder.VolumeCondition
        ###最小成交量
        pyParkedOrder.MinVolume = pParkedOrder.MinVolume
        ###触发条件
        pyParkedOrder.ContingentCondition = pParkedOrder.ContingentCondition
        ###止损价
        pyParkedOrder.StopPrice = pParkedOrder.StopPrice
        ###强平原因
        pyParkedOrder.ForceCloseReason = pParkedOrder.ForceCloseReason
        ###自动挂起标志
        pyParkedOrder.IsAutoSuspend = pParkedOrder.IsAutoSuspend
        ###业务单元
        pyParkedOrder.BusinessUnit = pParkedOrder.BusinessUnit
        ###请求编号
        pyParkedOrder.RequestID = pParkedOrder.RequestID
        ###用户强评标志
        pyParkedOrder.UserForceClose = pParkedOrder.UserForceClose
        ###交易所代码
        pyParkedOrder.ExchangeID = pParkedOrder.ExchangeID
        ###预埋报单编号
        pyParkedOrder.ParkedOrderID = pParkedOrder.ParkedOrderID
        ###用户类型
        pyParkedOrder.UserType = pParkedOrder.UserType
        ###预埋单状态
        pyParkedOrder.Status = pParkedOrder.Status
        ###错误代码
        pyParkedOrder.ErrorID = pParkedOrder.ErrorID
        ###错误信息
        pyParkedOrder.ErrorMsg = pParkedOrder.ErrorMsg
        ###互换单标志
        pyParkedOrder.IsSwapOrder = pParkedOrder.IsSwapOrder    
    
        attr_decode(pyParkedOrder)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspParkedOrderInsert(pyParkedOrder, pyRspInfo, nRequestID, bIsLast)

# 预埋撤单录入请求响应
cdef extern void OnStaticRspParkedOrderAction(CThostFtdcParkedOrderActionField *pParkedOrderAction, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyParkedOrderAction = None
    if pParkedOrderAction:
        pyParkedOrderAction = pyThostFtdcParkedOrderActionField()
    
        ###经纪公司代码
        pyParkedOrderAction.BrokerID = pParkedOrderAction.BrokerID
        ###投资者代码
        pyParkedOrderAction.InvestorID = pParkedOrderAction.InvestorID
        ###报单操作引用
        pyParkedOrderAction.OrderActionRef = pParkedOrderAction.OrderActionRef
        ###报单引用
        pyParkedOrderAction.OrderRef = pParkedOrderAction.OrderRef
        ###请求编号
        pyParkedOrderAction.RequestID = pParkedOrderAction.RequestID
        ###前置编号
        pyParkedOrderAction.FrontID = pParkedOrderAction.FrontID
        ###会话编号
        pyParkedOrderAction.SessionID = pParkedOrderAction.SessionID
        ###交易所代码
        pyParkedOrderAction.ExchangeID = pParkedOrderAction.ExchangeID
        ###报单编号
        pyParkedOrderAction.OrderSysID = pParkedOrderAction.OrderSysID
        ###操作标志
        pyParkedOrderAction.ActionFlag = pParkedOrderAction.ActionFlag
        ###价格
        pyParkedOrderAction.LimitPrice = pParkedOrderAction.LimitPrice
        ###数量变化
        pyParkedOrderAction.VolumeChange = pParkedOrderAction.VolumeChange
        ###用户代码
        pyParkedOrderAction.UserID = pParkedOrderAction.UserID
        ###合约代码
        pyParkedOrderAction.InstrumentID = pParkedOrderAction.InstrumentID
        ###预埋撤单单编号
        pyParkedOrderAction.ParkedOrderActionID = pParkedOrderAction.ParkedOrderActionID
        ###用户类型
        pyParkedOrderAction.UserType = pParkedOrderAction.UserType
        ###预埋撤单状态
        pyParkedOrderAction.Status = pParkedOrderAction.Status
        ###错误代码
        pyParkedOrderAction.ErrorID = pParkedOrderAction.ErrorID
        ###错误信息
        pyParkedOrderAction.ErrorMsg = pParkedOrderAction.ErrorMsg
    
        attr_decode(pyParkedOrderAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspParkedOrderAction(pyParkedOrderAction, pyRspInfo, nRequestID, bIsLast)

# 报单操作请求响应
cdef extern void OnStaticRspOrderAction(CThostFtdcInputOrderActionField *pInputOrderAction, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputOrderAction = None
    if pInputOrderAction:
        pyInputOrderAction = pyThostFtdcInputOrderActionField()
    
        ###经纪公司代码
        pyInputOrderAction.BrokerID = pInputOrderAction.BrokerID
        ###投资者代码
        pyInputOrderAction.InvestorID = pInputOrderAction.InvestorID
        ###报单操作引用
        pyInputOrderAction.OrderActionRef = pInputOrderAction.OrderActionRef
        ###报单引用
        pyInputOrderAction.OrderRef = pInputOrderAction.OrderRef
        ###请求编号
        pyInputOrderAction.RequestID = pInputOrderAction.RequestID
        ###前置编号
        pyInputOrderAction.FrontID = pInputOrderAction.FrontID
        ###会话编号
        pyInputOrderAction.SessionID = pInputOrderAction.SessionID
        ###交易所代码
        pyInputOrderAction.ExchangeID = pInputOrderAction.ExchangeID
        ###报单编号
        pyInputOrderAction.OrderSysID = pInputOrderAction.OrderSysID
        ###操作标志
        pyInputOrderAction.ActionFlag = pInputOrderAction.ActionFlag
        ###价格
        pyInputOrderAction.LimitPrice = pInputOrderAction.LimitPrice
        ###数量变化
        pyInputOrderAction.VolumeChange = pInputOrderAction.VolumeChange
        ###用户代码
        pyInputOrderAction.UserID = pInputOrderAction.UserID
        ###合约代码
        pyInputOrderAction.InstrumentID = pInputOrderAction.InstrumentID
    
        attr_decode(pyInputOrderAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspOrderAction(pyInputOrderAction, pyRspInfo, nRequestID, bIsLast)

# 查询最大报单数量响应
cdef extern void OnStaticRspQueryMaxOrderVolume(CThostFtdcQueryMaxOrderVolumeField *pQueryMaxOrderVolume, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyQueryMaxOrderVolume = None
    if pQueryMaxOrderVolume:
        pyQueryMaxOrderVolume = pyThostFtdcQueryMaxOrderVolumeField()
    
        ###经纪公司代码
        pyQueryMaxOrderVolume.BrokerID = pQueryMaxOrderVolume.BrokerID
        ###投资者代码
        pyQueryMaxOrderVolume.InvestorID = pQueryMaxOrderVolume.InvestorID
        ###合约代码
        pyQueryMaxOrderVolume.InstrumentID = pQueryMaxOrderVolume.InstrumentID
        ###买卖方向
        pyQueryMaxOrderVolume.Direction = pQueryMaxOrderVolume.Direction
        ###开平标志
        pyQueryMaxOrderVolume.OffsetFlag = pQueryMaxOrderVolume.OffsetFlag
        ###投机套保标志
        pyQueryMaxOrderVolume.HedgeFlag = pQueryMaxOrderVolume.HedgeFlag
        ###最大允许报单数量
        pyQueryMaxOrderVolume.MaxVolume = pQueryMaxOrderVolume.MaxVolume
    
        attr_decode(pyQueryMaxOrderVolume)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQueryMaxOrderVolume(pyQueryMaxOrderVolume, pyRspInfo, nRequestID, bIsLast)

# 投资者结算结果确认响应
cdef extern void OnStaticRspSettlementInfoConfirm(CThostFtdcSettlementInfoConfirmField *pSettlementInfoConfirm, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pySettlementInfoConfirm = None
    if pSettlementInfoConfirm:
        pySettlementInfoConfirm = pyThostFtdcSettlementInfoConfirmField()
    
        ###经纪公司代码
        pySettlementInfoConfirm.BrokerID = pSettlementInfoConfirm.BrokerID
        ###投资者代码
        pySettlementInfoConfirm.InvestorID = pSettlementInfoConfirm.InvestorID
        ###确认日期
        pySettlementInfoConfirm.ConfirmDate = pSettlementInfoConfirm.ConfirmDate
        ###确认时间
        pySettlementInfoConfirm.ConfirmTime = pSettlementInfoConfirm.ConfirmTime
    
        attr_decode(pySettlementInfoConfirm)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspSettlementInfoConfirm(pySettlementInfoConfirm, pyRspInfo, nRequestID, bIsLast)

# 删除预埋单响应
cdef extern void OnStaticRspRemoveParkedOrder(CThostFtdcRemoveParkedOrderField *pRemoveParkedOrder, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRemoveParkedOrder = None
    if pRemoveParkedOrder:
        pyRemoveParkedOrder = pyThostFtdcRemoveParkedOrderField()
    
        ###经纪公司代码
        pyRemoveParkedOrder.BrokerID = pRemoveParkedOrder.BrokerID
        ###投资者代码
        pyRemoveParkedOrder.InvestorID = pRemoveParkedOrder.InvestorID
        ###预埋报单编号
        pyRemoveParkedOrder.ParkedOrderID = pRemoveParkedOrder.ParkedOrderID
    
        attr_decode(pyRemoveParkedOrder)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspRemoveParkedOrder(pyRemoveParkedOrder, pyRspInfo, nRequestID, bIsLast)

# 删除预埋撤单响应
cdef extern void OnStaticRspRemoveParkedOrderAction(CThostFtdcRemoveParkedOrderActionField *pRemoveParkedOrderAction, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRemoveParkedOrderAction = None
    if pRemoveParkedOrderAction:
        pyRemoveParkedOrderAction = pyThostFtdcRemoveParkedOrderActionField()
    
        ###经纪公司代码
        pyRemoveParkedOrderAction.BrokerID = pRemoveParkedOrderAction.BrokerID
        ###投资者代码
        pyRemoveParkedOrderAction.InvestorID = pRemoveParkedOrderAction.InvestorID
        ###预埋撤单编号
        pyRemoveParkedOrderAction.ParkedOrderActionID = pRemoveParkedOrderAction.ParkedOrderActionID
    
        attr_decode(pyRemoveParkedOrderAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspRemoveParkedOrderAction(pyRemoveParkedOrderAction, pyRspInfo, nRequestID, bIsLast)

# 执行宣告录入请求响应
cdef extern void OnStaticRspExecOrderInsert(CThostFtdcInputExecOrderField *pInputExecOrder, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputExecOrder = None
    if pInputExecOrder:
        pyInputExecOrder = pyThostFtdcInputExecOrderField()
    
        ###经纪公司代码
        pyInputExecOrder.BrokerID = pInputExecOrder.BrokerID
        ###投资者代码
        pyInputExecOrder.InvestorID = pInputExecOrder.InvestorID
        ###合约代码
        pyInputExecOrder.InstrumentID = pInputExecOrder.InstrumentID
        ###执行宣告引用
        pyInputExecOrder.ExecOrderRef = pInputExecOrder.ExecOrderRef
        ###用户代码
        pyInputExecOrder.UserID = pInputExecOrder.UserID
        ###数量
        pyInputExecOrder.Volume = pInputExecOrder.Volume
        ###请求编号
        pyInputExecOrder.RequestID = pInputExecOrder.RequestID
        ###业务单元
        pyInputExecOrder.BusinessUnit = pInputExecOrder.BusinessUnit
        ###开平标志
        pyInputExecOrder.OffsetFlag = pInputExecOrder.OffsetFlag
        ###投机套保标志
        pyInputExecOrder.HedgeFlag = pInputExecOrder.HedgeFlag
        ###执行类型
        pyInputExecOrder.ActionType = pInputExecOrder.ActionType
        ###保留头寸申请的持仓方向
        pyInputExecOrder.PosiDirection = pInputExecOrder.PosiDirection
        ###期权行权后是否保留期货头寸的标记
        pyInputExecOrder.ReservePositionFlag = pInputExecOrder.ReservePositionFlag
        ###期权行权后生成的头寸是否自动平仓
        pyInputExecOrder.CloseFlag = pInputExecOrder.CloseFlag
    
        attr_decode(pyInputExecOrder)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspExecOrderInsert(pyInputExecOrder, pyRspInfo, nRequestID, bIsLast)

# 执行宣告操作请求响应
cdef extern void OnStaticRspExecOrderAction(CThostFtdcInputExecOrderActionField *pInputExecOrderAction, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputExecOrderAction = None
    if pInputExecOrderAction:
        pyInputExecOrderAction = pyThostFtdcInputExecOrderActionField()
    
        ###经纪公司代码
        pyInputExecOrderAction.BrokerID = pInputExecOrderAction.BrokerID
        ###投资者代码
        pyInputExecOrderAction.InvestorID = pInputExecOrderAction.InvestorID
        ###执行宣告操作引用
        pyInputExecOrderAction.ExecOrderActionRef = pInputExecOrderAction.ExecOrderActionRef
        ###执行宣告引用
        pyInputExecOrderAction.ExecOrderRef = pInputExecOrderAction.ExecOrderRef
        ###请求编号
        pyInputExecOrderAction.RequestID = pInputExecOrderAction.RequestID
        ###前置编号
        pyInputExecOrderAction.FrontID = pInputExecOrderAction.FrontID
        ###会话编号
        pyInputExecOrderAction.SessionID = pInputExecOrderAction.SessionID
        ###交易所代码
        pyInputExecOrderAction.ExchangeID = pInputExecOrderAction.ExchangeID
        ###执行宣告操作编号
        pyInputExecOrderAction.ExecOrderSysID = pInputExecOrderAction.ExecOrderSysID
        ###操作标志
        pyInputExecOrderAction.ActionFlag = pInputExecOrderAction.ActionFlag
        ###用户代码
        pyInputExecOrderAction.UserID = pInputExecOrderAction.UserID
        ###合约代码
        pyInputExecOrderAction.InstrumentID = pInputExecOrderAction.InstrumentID
    
        attr_decode(pyInputExecOrderAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspExecOrderAction(pyInputExecOrderAction, pyRspInfo, nRequestID, bIsLast)

# 询价录入请求响应
cdef extern void OnStaticRspForQuoteInsert(CThostFtdcInputForQuoteField *pInputForQuote, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputForQuote = None
    if pInputForQuote:
        pyInputForQuote = pyThostFtdcInputForQuoteField()
    
        ###经纪公司代码
        pyInputForQuote.BrokerID = pInputForQuote.BrokerID
        ###投资者代码
        pyInputForQuote.InvestorID = pInputForQuote.InvestorID
        ###合约代码
        pyInputForQuote.InstrumentID = pInputForQuote.InstrumentID
        ###询价引用
        pyInputForQuote.ForQuoteRef = pInputForQuote.ForQuoteRef
        ###用户代码
        pyInputForQuote.UserID = pInputForQuote.UserID
    
        attr_decode(pyInputForQuote)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspForQuoteInsert(pyInputForQuote, pyRspInfo, nRequestID, bIsLast)

# 报价录入请求响应
cdef extern void OnStaticRspQuoteInsert(CThostFtdcInputQuoteField *pInputQuote, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputQuote = None
    if pInputQuote:
        pyInputQuote = pyThostFtdcInputQuoteField()
    
        ###经纪公司代码
        pyInputQuote.BrokerID = pInputQuote.BrokerID
        ###投资者代码
        pyInputQuote.InvestorID = pInputQuote.InvestorID
        ###合约代码
        pyInputQuote.InstrumentID = pInputQuote.InstrumentID
        ###报价引用
        pyInputQuote.QuoteRef = pInputQuote.QuoteRef
        ###用户代码
        pyInputQuote.UserID = pInputQuote.UserID
        ###卖价格
        pyInputQuote.AskPrice = pInputQuote.AskPrice
        ###买价格
        pyInputQuote.BidPrice = pInputQuote.BidPrice
        ###卖数量
        pyInputQuote.AskVolume = pInputQuote.AskVolume
        ###买数量
        pyInputQuote.BidVolume = pInputQuote.BidVolume
        ###请求编号
        pyInputQuote.RequestID = pInputQuote.RequestID
        ###业务单元
        pyInputQuote.BusinessUnit = pInputQuote.BusinessUnit
        ###卖开平标志
        pyInputQuote.AskOffsetFlag = pInputQuote.AskOffsetFlag
        ###买开平标志
        pyInputQuote.BidOffsetFlag = pInputQuote.BidOffsetFlag
        ###卖投机套保标志
        pyInputQuote.AskHedgeFlag = pInputQuote.AskHedgeFlag
        ###买投机套保标志
        pyInputQuote.BidHedgeFlag = pInputQuote.BidHedgeFlag
        ###衍生卖报单引用
        pyInputQuote.AskOrderRef = pInputQuote.AskOrderRef
        ###衍生买报单引用
        pyInputQuote.BidOrderRef = pInputQuote.BidOrderRef
        ###应价编号
        pyInputQuote.ForQuoteSysID = pInputQuote.ForQuoteSysID
    
        attr_decode(pyInputQuote)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQuoteInsert(pyInputQuote, pyRspInfo, nRequestID, bIsLast)

# 报价操作请求响应
cdef extern void OnStaticRspQuoteAction(CThostFtdcInputQuoteActionField *pInputQuoteAction, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputQuoteAction = None
    if pInputQuoteAction:
        pyInputQuoteAction = pyThostFtdcInputQuoteActionField()
    
        ###经纪公司代码
        pyInputQuoteAction.BrokerID = pInputQuoteAction.BrokerID
        ###投资者代码
        pyInputQuoteAction.InvestorID = pInputQuoteAction.InvestorID
        ###报价操作引用
        pyInputQuoteAction.QuoteActionRef = pInputQuoteAction.QuoteActionRef
        ###报价引用
        pyInputQuoteAction.QuoteRef = pInputQuoteAction.QuoteRef
        ###请求编号
        pyInputQuoteAction.RequestID = pInputQuoteAction.RequestID
        ###前置编号
        pyInputQuoteAction.FrontID = pInputQuoteAction.FrontID
        ###会话编号
        pyInputQuoteAction.SessionID = pInputQuoteAction.SessionID
        ###交易所代码
        pyInputQuoteAction.ExchangeID = pInputQuoteAction.ExchangeID
        ###报价操作编号
        pyInputQuoteAction.QuoteSysID = pInputQuoteAction.QuoteSysID
        ###操作标志
        pyInputQuoteAction.ActionFlag = pInputQuoteAction.ActionFlag
        ###用户代码
        pyInputQuoteAction.UserID = pInputQuoteAction.UserID
        ###合约代码
        pyInputQuoteAction.InstrumentID = pInputQuoteAction.InstrumentID
    
        attr_decode(pyInputQuoteAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQuoteAction(pyInputQuoteAction, pyRspInfo, nRequestID, bIsLast)

# 申请组合录入请求响应
cdef extern void OnStaticRspCombActionInsert(CThostFtdcInputCombActionField *pInputCombAction, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputCombAction = None
    if pInputCombAction:
        pyInputCombAction = pyThostFtdcInputCombActionField()
    
        ###经纪公司代码
        pyInputCombAction.BrokerID = pInputCombAction.BrokerID
        ###投资者代码
        pyInputCombAction.InvestorID = pInputCombAction.InvestorID
        ###合约代码
        pyInputCombAction.InstrumentID = pInputCombAction.InstrumentID
        ###组合引用
        pyInputCombAction.CombActionRef = pInputCombAction.CombActionRef
        ###用户代码
        pyInputCombAction.UserID = pInputCombAction.UserID
        ###买卖方向
        pyInputCombAction.Direction = pInputCombAction.Direction
        ###数量
        pyInputCombAction.Volume = pInputCombAction.Volume
        ###组合指令方向
        pyInputCombAction.CombDirection = pInputCombAction.CombDirection
        ###投机套保标志
        pyInputCombAction.HedgeFlag = pInputCombAction.HedgeFlag
    
        attr_decode(pyInputCombAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspCombActionInsert(pyInputCombAction, pyRspInfo, nRequestID, bIsLast)

# 请求查询报单响应
cdef extern void OnStaticRspQryOrder(CThostFtdcOrderField *pOrder, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyOrder = None
    if pOrder:
        pyOrder = pyThostFtdcOrderField()
    
        ###经纪公司代码
        pyOrder.BrokerID = pOrder.BrokerID
        ###投资者代码
        pyOrder.InvestorID = pOrder.InvestorID
        ###合约代码
        pyOrder.InstrumentID = pOrder.InstrumentID
        ###报单引用
        pyOrder.OrderRef = pOrder.OrderRef
        ###用户代码
        pyOrder.UserID = pOrder.UserID
        ###报单价格条件
        pyOrder.OrderPriceType = pOrder.OrderPriceType
        ###买卖方向
        pyOrder.Direction = pOrder.Direction
        ###组合开平标志
        pyOrder.CombOffsetFlag = pOrder.CombOffsetFlag
        ###组合投机套保标志
        pyOrder.CombHedgeFlag = pOrder.CombHedgeFlag
        ###价格
        pyOrder.LimitPrice = pOrder.LimitPrice
        ###数量
        pyOrder.VolumeTotalOriginal = pOrder.VolumeTotalOriginal
        ###有效期类型
        pyOrder.TimeCondition = pOrder.TimeCondition
        ###GTD日期
        pyOrder.GTDDate = pOrder.GTDDate
        ###成交量类型
        pyOrder.VolumeCondition = pOrder.VolumeCondition
        ###最小成交量
        pyOrder.MinVolume = pOrder.MinVolume
        ###触发条件
        pyOrder.ContingentCondition = pOrder.ContingentCondition
        ###止损价
        pyOrder.StopPrice = pOrder.StopPrice
        ###强平原因
        pyOrder.ForceCloseReason = pOrder.ForceCloseReason
        ###自动挂起标志
        pyOrder.IsAutoSuspend = pOrder.IsAutoSuspend
        ###业务单元
        pyOrder.BusinessUnit = pOrder.BusinessUnit
        ###请求编号
        pyOrder.RequestID = pOrder.RequestID
        ###本地报单编号
        pyOrder.OrderLocalID = pOrder.OrderLocalID
        ###交易所代码
        pyOrder.ExchangeID = pOrder.ExchangeID
        ###会员代码
        pyOrder.ParticipantID = pOrder.ParticipantID
        ###客户代码
        pyOrder.ClientID = pOrder.ClientID
        ###合约在交易所的代码
        pyOrder.ExchangeInstID = pOrder.ExchangeInstID
        ###交易所交易员代码
        pyOrder.TraderID = pOrder.TraderID
        ###安装编号
        pyOrder.InstallID = pOrder.InstallID
        ###报单提交状态
        pyOrder.OrderSubmitStatus = pOrder.OrderSubmitStatus
        ###报单提示序号
        pyOrder.NotifySequence = pOrder.NotifySequence
        ###交易日
        pyOrder.TradingDay = pOrder.TradingDay
        ###结算编号
        pyOrder.SettlementID = pOrder.SettlementID
        ###报单编号
        pyOrder.OrderSysID = pOrder.OrderSysID
        ###报单来源
        pyOrder.OrderSource = pOrder.OrderSource
        ###报单状态
        pyOrder.OrderStatus = pOrder.OrderStatus
        ###报单类型
        pyOrder.OrderType = pOrder.OrderType
        ###今成交数量
        pyOrder.VolumeTraded = pOrder.VolumeTraded
        ###剩余数量
        pyOrder.VolumeTotal = pOrder.VolumeTotal
        ###报单日期
        pyOrder.InsertDate = pOrder.InsertDate
        ###委托时间
        pyOrder.InsertTime = pOrder.InsertTime
        ###激活时间
        pyOrder.ActiveTime = pOrder.ActiveTime
        ###挂起时间
        pyOrder.SuspendTime = pOrder.SuspendTime
        ###最后修改时间
        pyOrder.UpdateTime = pOrder.UpdateTime
        ###撤销时间
        pyOrder.CancelTime = pOrder.CancelTime
        ###最后修改交易所交易员代码
        pyOrder.ActiveTraderID = pOrder.ActiveTraderID
        ###结算会员编号
        pyOrder.ClearingPartID = pOrder.ClearingPartID
        ###序号
        pyOrder.SequenceNo = pOrder.SequenceNo
        ###前置编号
        pyOrder.FrontID = pOrder.FrontID
        ###会话编号
        pyOrder.SessionID = pOrder.SessionID
        ###用户端产品信息
        pyOrder.UserProductInfo = pOrder.UserProductInfo
        ###状态信息
        pyOrder.StatusMsg = pOrder.StatusMsg
        ###用户强评标志
        pyOrder.UserForceClose = pOrder.UserForceClose
        ###操作用户代码
        pyOrder.ActiveUserID = pOrder.ActiveUserID
        ###经纪公司报单编号
        pyOrder.BrokerOrderSeq = pOrder.BrokerOrderSeq
        ###相关报单
        pyOrder.RelativeOrderSysID = pOrder.RelativeOrderSysID
        ###郑商所成交数量
        pyOrder.ZCETotalTradedVolume = pOrder.ZCETotalTradedVolume
        ###互换单标志
        pyOrder.IsSwapOrder = pOrder.IsSwapOrder
    
        attr_decode(pyOrder)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryOrder(pyOrder, pyRspInfo, nRequestID, bIsLast)

# 请求查询成交响应
cdef extern void OnStaticRspQryTrade(CThostFtdcTradeField *pTrade, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyTrade = None
    if pTrade:
        pyTrade = pyThostFtdcTradeField()
    
        ###经纪公司代码
        pyTrade.BrokerID = pTrade.BrokerID
        ###投资者代码
        pyTrade.InvestorID = pTrade.InvestorID
        ###合约代码
        pyTrade.InstrumentID = pTrade.InstrumentID
        ###报单引用
        pyTrade.OrderRef = pTrade.OrderRef
        ###用户代码
        pyTrade.UserID = pTrade.UserID
        ###交易所代码
        pyTrade.ExchangeID = pTrade.ExchangeID
        ###成交编号
        pyTrade.TradeID = pTrade.TradeID
        ###买卖方向
        pyTrade.Direction = pTrade.Direction
        ###报单编号
        pyTrade.OrderSysID = pTrade.OrderSysID
        ###会员代码
        pyTrade.ParticipantID = pTrade.ParticipantID
        ###客户代码
        pyTrade.ClientID = pTrade.ClientID
        ###交易角色
        pyTrade.TradingRole = pTrade.TradingRole
        ###合约在交易所的代码
        pyTrade.ExchangeInstID = pTrade.ExchangeInstID
        ###开平标志
        pyTrade.OffsetFlag = pTrade.OffsetFlag
        ###投机套保标志
        pyTrade.HedgeFlag = pTrade.HedgeFlag
        ###价格
        pyTrade.Price = pTrade.Price
        ###数量
        pyTrade.Volume = pTrade.Volume
        ###成交时期
        pyTrade.TradeDate = pTrade.TradeDate
        ###成交时间
        pyTrade.TradeTime = pTrade.TradeTime
        ###成交类型
        pyTrade.TradeType = pTrade.TradeType
        ###成交价来源
        pyTrade.PriceSource = pTrade.PriceSource
        ###交易所交易员代码
        pyTrade.TraderID = pTrade.TraderID
        ###本地报单编号
        pyTrade.OrderLocalID = pTrade.OrderLocalID
        ###结算会员编号
        pyTrade.ClearingPartID = pTrade.ClearingPartID
        ###业务单元
        pyTrade.BusinessUnit = pTrade.BusinessUnit
        ###序号
        pyTrade.SequenceNo = pTrade.SequenceNo
        ###交易日
        pyTrade.TradingDay = pTrade.TradingDay
        ###结算编号
        pyTrade.SettlementID = pTrade.SettlementID
        ###经纪公司报单编号
        pyTrade.BrokerOrderSeq = pTrade.BrokerOrderSeq
        ###成交来源
        pyTrade.TradeSource = pTrade.TradeSource
    
        attr_decode(pyTrade)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryTrade(pyTrade, pyRspInfo, nRequestID, bIsLast)

# 请求查询投资者持仓响应
cdef extern void OnStaticRspQryInvestorPosition(CThostFtdcInvestorPositionField *pInvestorPosition, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInvestorPosition = None
    if pInvestorPosition:
        pyInvestorPosition = pyThostFtdcInvestorPositionField()
    
        ###合约代码
        pyInvestorPosition.InstrumentID = pInvestorPosition.InstrumentID
        ###经纪公司代码
        pyInvestorPosition.BrokerID = pInvestorPosition.BrokerID
        ###投资者代码
        pyInvestorPosition.InvestorID = pInvestorPosition.InvestorID
        ###持仓多空方向
        pyInvestorPosition.PosiDirection = pInvestorPosition.PosiDirection
        ###投机套保标志
        pyInvestorPosition.HedgeFlag = pInvestorPosition.HedgeFlag
        ###持仓日期
        pyInvestorPosition.PositionDate = pInvestorPosition.PositionDate
        ###上日持仓
        pyInvestorPosition.YdPosition = pInvestorPosition.YdPosition
        ###今日持仓
        pyInvestorPosition.Position = pInvestorPosition.Position
        ###多头冻结
        pyInvestorPosition.LongFrozen = pInvestorPosition.LongFrozen
        ###空头冻结
        pyInvestorPosition.ShortFrozen = pInvestorPosition.ShortFrozen
        ###开仓冻结金额
        pyInvestorPosition.LongFrozenAmount = pInvestorPosition.LongFrozenAmount
        ###开仓冻结金额
        pyInvestorPosition.ShortFrozenAmount = pInvestorPosition.ShortFrozenAmount
        ###开仓量
        pyInvestorPosition.OpenVolume = pInvestorPosition.OpenVolume
        ###平仓量
        pyInvestorPosition.CloseVolume = pInvestorPosition.CloseVolume
        ###开仓金额
        pyInvestorPosition.OpenAmount = pInvestorPosition.OpenAmount
        ###平仓金额
        pyInvestorPosition.CloseAmount = pInvestorPosition.CloseAmount
        ###持仓成本
        pyInvestorPosition.PositionCost = pInvestorPosition.PositionCost
        ###上次占用的保证金
        pyInvestorPosition.PreMargin = pInvestorPosition.PreMargin
        ###占用的保证金
        pyInvestorPosition.UseMargin = pInvestorPosition.UseMargin
        ###冻结的保证金
        pyInvestorPosition.FrozenMargin = pInvestorPosition.FrozenMargin
        ###冻结的资金
        pyInvestorPosition.FrozenCash = pInvestorPosition.FrozenCash
        ###冻结的手续费
        pyInvestorPosition.FrozenCommission = pInvestorPosition.FrozenCommission
        ###资金差额
        pyInvestorPosition.CashIn = pInvestorPosition.CashIn
        ###手续费
        pyInvestorPosition.Commission = pInvestorPosition.Commission
        ###平仓盈亏
        pyInvestorPosition.CloseProfit = pInvestorPosition.CloseProfit
        ###持仓盈亏
        pyInvestorPosition.PositionProfit = pInvestorPosition.PositionProfit
        ###上次结算价
        pyInvestorPosition.PreSettlementPrice = pInvestorPosition.PreSettlementPrice
        ###本次结算价
        pyInvestorPosition.SettlementPrice = pInvestorPosition.SettlementPrice
        ###交易日
        pyInvestorPosition.TradingDay = pInvestorPosition.TradingDay
        ###结算编号
        pyInvestorPosition.SettlementID = pInvestorPosition.SettlementID
        ###开仓成本
        pyInvestorPosition.OpenCost = pInvestorPosition.OpenCost
        ###交易所保证金
        pyInvestorPosition.ExchangeMargin = pInvestorPosition.ExchangeMargin
        ###组合成交形成的持仓
        pyInvestorPosition.CombPosition = pInvestorPosition.CombPosition
        ###组合多头冻结
        pyInvestorPosition.CombLongFrozen = pInvestorPosition.CombLongFrozen
        ###组合空头冻结
        pyInvestorPosition.CombShortFrozen = pInvestorPosition.CombShortFrozen
        ###逐日盯市平仓盈亏
        pyInvestorPosition.CloseProfitByDate = pInvestorPosition.CloseProfitByDate
        ###逐笔对冲平仓盈亏
        pyInvestorPosition.CloseProfitByTrade = pInvestorPosition.CloseProfitByTrade
        ###今日持仓
        pyInvestorPosition.TodayPosition = pInvestorPosition.TodayPosition
        ###保证金率
        pyInvestorPosition.MarginRateByMoney = pInvestorPosition.MarginRateByMoney
        ###保证金率(按手数)
        pyInvestorPosition.MarginRateByVolume = pInvestorPosition.MarginRateByVolume
        ###执行冻结
        pyInvestorPosition.StrikeFrozen = pInvestorPosition.StrikeFrozen
        ###执行冻结金额
        pyInvestorPosition.StrikeFrozenAmount = pInvestorPosition.StrikeFrozenAmount
        ###放弃执行冻结
        pyInvestorPosition.AbandonFrozen = pInvestorPosition.AbandonFrozen
    
        attr_decode(pyInvestorPosition)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryInvestorPosition(pyInvestorPosition, pyRspInfo, nRequestID, bIsLast)

# 请求查询资金账户响应
cdef extern void OnStaticRspQryTradingAccount(CThostFtdcTradingAccountField *pTradingAccount, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError
    
    pyTradingAccount = None
    if pTradingAccount:
        pyTradingAccount = pyThostFtdcTradingAccountField()
        print('in here')
        ###经纪公司代码
        pyTradingAccount.BrokerID = pTradingAccount.BrokerID
        ###投资者帐号
        pyTradingAccount.AccountID = pTradingAccount.AccountID
        ###上次质押金额
        pyTradingAccount.PreMortgage = pTradingAccount.PreMortgage
        ###上次信用额度
        pyTradingAccount.PreCredit = pTradingAccount.PreCredit
        ###上次存款额
        pyTradingAccount.PreDeposit = pTradingAccount.PreDeposit
        ###上次结算准备金
        pyTradingAccount.PreBalance = pTradingAccount.PreBalance
        ###上次占用的保证金
        pyTradingAccount.PreMargin = pTradingAccount.PreMargin
        ###利息基数
        pyTradingAccount.InterestBase = pTradingAccount.InterestBase
        ###利息收入
        pyTradingAccount.Interest = pTradingAccount.Interest
        ###入金金额
        pyTradingAccount.Deposit = pTradingAccount.Deposit
        ###出金金额
        pyTradingAccount.Withdraw = pTradingAccount.Withdraw
        ###冻结的保证金
        pyTradingAccount.FrozenMargin = pTradingAccount.FrozenMargin
        ###冻结的资金
        pyTradingAccount.FrozenCash = pTradingAccount.FrozenCash
        ###冻结的手续费
        pyTradingAccount.FrozenCommission = pTradingAccount.FrozenCommission
        ###当前保证金总额
        pyTradingAccount.CurrMargin = pTradingAccount.CurrMargin
        ###资金差额
        pyTradingAccount.CashIn = pTradingAccount.CashIn
        ###手续费
        pyTradingAccount.Commission = pTradingAccount.Commission
        ###平仓盈亏
        pyTradingAccount.CloseProfit = pTradingAccount.CloseProfit
        ###持仓盈亏
        pyTradingAccount.PositionProfit = pTradingAccount.PositionProfit
        ###期货结算准备金
        pyTradingAccount.Balance = pTradingAccount.Balance
        ###可用资金
        pyTradingAccount.Available = pTradingAccount.Available
        ###可取资金
        pyTradingAccount.WithdrawQuota = pTradingAccount.WithdrawQuota
        ###基本准备金
        pyTradingAccount.Reserve = pTradingAccount.Reserve
        ###交易日
        pyTradingAccount.TradingDay = pTradingAccount.TradingDay
        ###结算编号
        pyTradingAccount.SettlementID = pTradingAccount.SettlementID
        ###信用额度
        pyTradingAccount.Credit = pTradingAccount.Credit
        ###质押金额
        pyTradingAccount.Mortgage = pTradingAccount.Mortgage
        ###交易所保证金
        pyTradingAccount.ExchangeMargin = pTradingAccount.ExchangeMargin
        ###投资者交割保证金
        pyTradingAccount.DeliveryMargin = pTradingAccount.DeliveryMargin
        ###交易所交割保证金
        pyTradingAccount.ExchangeDeliveryMargin = pTradingAccount.ExchangeDeliveryMargin
        ###保底期货结算准备金
        pyTradingAccount.ReserveBalance = pTradingAccount.ReserveBalance
        ###币种代码
        pyTradingAccount.CurrencyID = pTradingAccount.CurrencyID
        ###上次货币质入金额
        pyTradingAccount.PreFundMortgageIn = pTradingAccount.PreFundMortgageIn
        ###上次货币质出金额
        pyTradingAccount.PreFundMortgageOut = pTradingAccount.PreFundMortgageOut
        ###货币质入金额
        pyTradingAccount.FundMortgageIn = pTradingAccount.FundMortgageIn
        ###货币质出金额
        pyTradingAccount.FundMortgageOut = pTradingAccount.FundMortgageOut
        ###货币质押余额
        pyTradingAccount.FundMortgageAvailable = pTradingAccount.FundMortgageAvailable
        ###可质押货币金额
        pyTradingAccount.MortgageableFund = pTradingAccount.MortgageableFund
        ###特殊产品占用保证金
        pyTradingAccount.SpecProductMargin = pTradingAccount.SpecProductMargin
        ###特殊产品冻结保证金
        pyTradingAccount.SpecProductFrozenMargin = pTradingAccount.SpecProductFrozenMargin
        ###特殊产品手续费
        pyTradingAccount.SpecProductCommission = pTradingAccount.SpecProductCommission
        ###特殊产品冻结手续费
        pyTradingAccount.SpecProductFrozenCommission = pTradingAccount.SpecProductFrozenCommission
        ###特殊产品持仓盈亏
        pyTradingAccount.SpecProductPositionProfit = pTradingAccount.SpecProductPositionProfit
        ###特殊产品平仓盈亏
        pyTradingAccount.SpecProductCloseProfit = pTradingAccount.SpecProductCloseProfit
        ###根据持仓盈亏算法计算的特殊产品持仓盈亏
        pyTradingAccount.SpecProductPositionProfitByAlg = pTradingAccount.SpecProductPositionProfitByAlg
        ###特殊产品交易所保证金
        pyTradingAccount.SpecProductExchangeMargin = pTradingAccount.SpecProductExchangeMargin
    
        attr_decode(pyTradingAccount)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()

        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]

        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryTradingAccount(pyTradingAccount, pyRspInfo, nRequestID, bIsLast)

# 请求查询投资者响应
cdef extern void OnStaticRspQryInvestor(CThostFtdcInvestorField *pInvestor, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInvestor = None
    if pInvestor:
        pyInvestor = pyThostFtdcInvestorField()
    
        ###投资者代码
        pyInvestor.InvestorID = pInvestor.InvestorID
        ###经纪公司代码
        pyInvestor.BrokerID = pInvestor.BrokerID
        ###投资者分组代码
        pyInvestor.InvestorGroupID = pInvestor.InvestorGroupID
        ###投资者名称
        pyInvestor.InvestorName = pInvestor.InvestorName
        ###证件类型
        pyInvestor.IdentifiedCardType = pInvestor.IdentifiedCardType
        ###证件号码
        pyInvestor.IdentifiedCardNo = pInvestor.IdentifiedCardNo
        ###是否活跃
        pyInvestor.IsActive = pInvestor.IsActive
        ###联系电话
        pyInvestor.Telephone = pInvestor.Telephone
        ###通讯地址
        pyInvestor.Address = pInvestor.Address
        ###开户日期
        pyInvestor.OpenDate = pInvestor.OpenDate
        ###手机
        pyInvestor.Mobile = pInvestor.Mobile
        ###手续费率模板代码
        pyInvestor.CommModelID = pInvestor.CommModelID
        ###保证金率模板代码
        pyInvestor.MarginModelID = pInvestor.MarginModelID
    
        attr_decode(pyInvestor)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryInvestor(pyInvestor, pyRspInfo, nRequestID, bIsLast)

# 请求查询交易编码响应
cdef extern void OnStaticRspQryTradingCode(CThostFtdcTradingCodeField *pTradingCode, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyTradingCode = None
    if pTradingCode:
        pyTradingCode = pyThostFtdcTradingCodeField()
    
        ###投资者代码
        pyTradingCode.InvestorID = pTradingCode.InvestorID
        ###经纪公司代码
        pyTradingCode.BrokerID = pTradingCode.BrokerID
        ###交易所代码
        pyTradingCode.ExchangeID = pTradingCode.ExchangeID
        ###客户代码
        pyTradingCode.ClientID = pTradingCode.ClientID
        ###是否活跃
        pyTradingCode.IsActive = pTradingCode.IsActive
        ###交易编码类型
        pyTradingCode.ClientIDType = pTradingCode.ClientIDType
    
        attr_decode(pyTradingCode)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryTradingCode(pyTradingCode, pyRspInfo, nRequestID, bIsLast)

# 请求查询合约保证金率响应
cdef extern void OnStaticRspQryInstrumentMarginRate(CThostFtdcInstrumentMarginRateField *pInstrumentMarginRate, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInstrumentMarginRate = None
    if pInstrumentMarginRate:
        pyInstrumentMarginRate = pyThostFtdcInstrumentMarginRateField()
    
        ###合约代码
        pyInstrumentMarginRate.InstrumentID = pInstrumentMarginRate.InstrumentID
        ###投资者范围
        pyInstrumentMarginRate.InvestorRange = pInstrumentMarginRate.InvestorRange
        ###经纪公司代码
        pyInstrumentMarginRate.BrokerID = pInstrumentMarginRate.BrokerID
        ###投资者代码
        pyInstrumentMarginRate.InvestorID = pInstrumentMarginRate.InvestorID
        ###投机套保标志
        pyInstrumentMarginRate.HedgeFlag = pInstrumentMarginRate.HedgeFlag
        ###多头保证金率
        pyInstrumentMarginRate.LongMarginRatioByMoney = pInstrumentMarginRate.LongMarginRatioByMoney
        ###多头保证金费
        pyInstrumentMarginRate.LongMarginRatioByVolume = pInstrumentMarginRate.LongMarginRatioByVolume
        ###空头保证金率
        pyInstrumentMarginRate.ShortMarginRatioByMoney = pInstrumentMarginRate.ShortMarginRatioByMoney
        ###空头保证金费
        pyInstrumentMarginRate.ShortMarginRatioByVolume = pInstrumentMarginRate.ShortMarginRatioByVolume
        ###是否相对交易所收取
        pyInstrumentMarginRate.IsRelative = pInstrumentMarginRate.IsRelative
    
        attr_decode(pyInstrumentMarginRate)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryInstrumentMarginRate(pyInstrumentMarginRate, pyRspInfo, nRequestID, bIsLast)

# 请求查询合约手续费率响应
cdef extern void OnStaticRspQryInstrumentCommissionRate(CThostFtdcInstrumentCommissionRateField *pInstrumentCommissionRate, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInstrumentCommissionRate = None
    if pInstrumentCommissionRate:
        pyInstrumentCommissionRate = pyThostFtdcInstrumentCommissionRateField()
    
        ###合约代码
        pyInstrumentCommissionRate.InstrumentID = pInstrumentCommissionRate.InstrumentID
        ###投资者范围
        pyInstrumentCommissionRate.InvestorRange = pInstrumentCommissionRate.InvestorRange
        ###经纪公司代码
        pyInstrumentCommissionRate.BrokerID = pInstrumentCommissionRate.BrokerID
        ###投资者代码
        pyInstrumentCommissionRate.InvestorID = pInstrumentCommissionRate.InvestorID
        ###开仓手续费率
        pyInstrumentCommissionRate.OpenRatioByMoney = pInstrumentCommissionRate.OpenRatioByMoney
        ###开仓手续费
        pyInstrumentCommissionRate.OpenRatioByVolume = pInstrumentCommissionRate.OpenRatioByVolume
        ###平仓手续费率
        pyInstrumentCommissionRate.CloseRatioByMoney = pInstrumentCommissionRate.CloseRatioByMoney
        ###平仓手续费
        pyInstrumentCommissionRate.CloseRatioByVolume = pInstrumentCommissionRate.CloseRatioByVolume
        ###平今手续费率
        pyInstrumentCommissionRate.CloseTodayRatioByMoney = pInstrumentCommissionRate.CloseTodayRatioByMoney
        ###平今手续费
        pyInstrumentCommissionRate.CloseTodayRatioByVolume = pInstrumentCommissionRate.CloseTodayRatioByVolume
    
        attr_decode(pyInstrumentCommissionRate)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryInstrumentCommissionRate(pyInstrumentCommissionRate, pyRspInfo, nRequestID, bIsLast)

# 请求查询交易所响应
cdef extern void OnStaticRspQryExchange(CThostFtdcExchangeField *pExchange, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyExchange = None
    if pExchange:
        pyExchange = pyThostFtdcExchangeField()
    
        ###交易所代码
        pyExchange.ExchangeID = pExchange.ExchangeID
        ###交易所名称
        pyExchange.ExchangeName = pExchange.ExchangeName
        ###交易所属性
        pyExchange.ExchangeProperty = pExchange.ExchangeProperty
    
        attr_decode(pyExchange)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryExchange(pyExchange, pyRspInfo, nRequestID, bIsLast)

# 请求查询产品响应
cdef extern void OnStaticRspQryProduct(CThostFtdcProductField *pProduct, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyProduct = None
    if pProduct:
        pyProduct = pyThostFtdcProductField()
    
        ###产品代码
        pyProduct.ProductID = pProduct.ProductID
        ###产品名称
        pyProduct.ProductName = pProduct.ProductName
        ###交易所代码
        pyProduct.ExchangeID = pProduct.ExchangeID
        ###产品类型
        pyProduct.ProductClass = pProduct.ProductClass
        ###合约数量乘数
        pyProduct.VolumeMultiple = pProduct.VolumeMultiple
        ###最小变动价位
        pyProduct.PriceTick = pProduct.PriceTick
        ###市价单最大下单量
        pyProduct.MaxMarketOrderVolume = pProduct.MaxMarketOrderVolume
        ###市价单最小下单量
        pyProduct.MinMarketOrderVolume = pProduct.MinMarketOrderVolume
        ###限价单最大下单量
        pyProduct.MaxLimitOrderVolume = pProduct.MaxLimitOrderVolume
        ###限价单最小下单量
        pyProduct.MinLimitOrderVolume = pProduct.MinLimitOrderVolume
        ###持仓类型
        pyProduct.PositionType = pProduct.PositionType
        ###持仓日期类型
        pyProduct.PositionDateType = pProduct.PositionDateType
        ###平仓处理类型
        pyProduct.CloseDealType = pProduct.CloseDealType
        ###交易币种类型
        pyProduct.TradeCurrencyID = pProduct.TradeCurrencyID
        ###质押资金可用范围
        pyProduct.MortgageFundUseRange = pProduct.MortgageFundUseRange
        ###交易所产品代码
        pyProduct.ExchangeProductID = pProduct.ExchangeProductID
        ###合约基础商品乘数
        pyProduct.UnderlyingMultiple = pProduct.UnderlyingMultiple
    
        attr_decode(pyProduct)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryProduct(pyProduct, pyRspInfo, nRequestID, bIsLast)

# 请求查询合约响应
cdef extern void OnStaticRspQryInstrument(CThostFtdcInstrumentField *pInstrument, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInstrument = None
    if pInstrument:
        pyInstrument = pyThostFtdcInstrumentField()
    
        ###合约代码
        pyInstrument.InstrumentID = pInstrument.InstrumentID
        ###交易所代码
        pyInstrument.ExchangeID = pInstrument.ExchangeID
        ###合约名称
        pyInstrument.InstrumentName = pInstrument.InstrumentName
        ###合约在交易所的代码
        pyInstrument.ExchangeInstID = pInstrument.ExchangeInstID
        ###产品代码
        pyInstrument.ProductID = pInstrument.ProductID
        ###产品类型
        pyInstrument.ProductClass = pInstrument.ProductClass
        ###交割年份
        pyInstrument.DeliveryYear = pInstrument.DeliveryYear
        ###交割月
        pyInstrument.DeliveryMonth = pInstrument.DeliveryMonth
        ###市价单最大下单量
        pyInstrument.MaxMarketOrderVolume = pInstrument.MaxMarketOrderVolume
        ###市价单最小下单量
        pyInstrument.MinMarketOrderVolume = pInstrument.MinMarketOrderVolume
        ###限价单最大下单量
        pyInstrument.MaxLimitOrderVolume = pInstrument.MaxLimitOrderVolume
        ###限价单最小下单量
        pyInstrument.MinLimitOrderVolume = pInstrument.MinLimitOrderVolume
        ###合约数量乘数
        pyInstrument.VolumeMultiple = pInstrument.VolumeMultiple
        ###最小变动价位
        pyInstrument.PriceTick = pInstrument.PriceTick
        ###创建日
        pyInstrument.CreateDate = pInstrument.CreateDate
        ###上市日
        pyInstrument.OpenDate = pInstrument.OpenDate
        ###到期日
        pyInstrument.ExpireDate = pInstrument.ExpireDate
        ###开始交割日
        pyInstrument.StartDelivDate = pInstrument.StartDelivDate
        ###结束交割日
        pyInstrument.EndDelivDate = pInstrument.EndDelivDate
        ###合约生命周期状态
        pyInstrument.InstLifePhase = pInstrument.InstLifePhase
        ###当前是否交易
        pyInstrument.IsTrading = pInstrument.IsTrading
        ###持仓类型
        pyInstrument.PositionType = pInstrument.PositionType
        ###持仓日期类型
        pyInstrument.PositionDateType = pInstrument.PositionDateType
        ###多头保证金率
        pyInstrument.LongMarginRatio = pInstrument.LongMarginRatio
        ###空头保证金率
        pyInstrument.ShortMarginRatio = pInstrument.ShortMarginRatio
        ###是否使用大额单边保证金算法
        pyInstrument.MaxMarginSideAlgorithm = pInstrument.MaxMarginSideAlgorithm
        ###基础商品代码
        pyInstrument.UnderlyingInstrID = pInstrument.UnderlyingInstrID
        ###执行价
        pyInstrument.StrikePrice = pInstrument.StrikePrice
        ###期权类型
        pyInstrument.OptionsType = pInstrument.OptionsType
        ###合约基础商品乘数
        pyInstrument.UnderlyingMultiple = pInstrument.UnderlyingMultiple
        ###组合类型
        pyInstrument.CombinationType = pInstrument.CombinationType
    
        attr_decode(pyInstrument)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryInstrument(pyInstrument, pyRspInfo, nRequestID, bIsLast)

# 请求查询行情响应
cdef extern void OnStaticRspQryDepthMarketData(CThostFtdcDepthMarketDataField *pDepthMarketData, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyDepthMarketData = None
    if pDepthMarketData:
        pyDepthMarketData = pyThostFtdcDepthMarketDataField()
    
        ###交易日
        pyDepthMarketData.TradingDay = pDepthMarketData.TradingDay
        ###合约代码
        pyDepthMarketData.InstrumentID = pDepthMarketData.InstrumentID
        ###交易所代码
        pyDepthMarketData.ExchangeID = pDepthMarketData.ExchangeID
        ###合约在交易所的代码
        pyDepthMarketData.ExchangeInstID = pDepthMarketData.ExchangeInstID
        ###最新价
        pyDepthMarketData.LastPrice = pDepthMarketData.LastPrice
        ###上次结算价
        pyDepthMarketData.PreSettlementPrice = pDepthMarketData.PreSettlementPrice
        ###昨收盘
        pyDepthMarketData.PreClosePrice = pDepthMarketData.PreClosePrice
        ###昨持仓量
        pyDepthMarketData.PreOpenInterest = pDepthMarketData.PreOpenInterest
        ###今开盘
        pyDepthMarketData.OpenPrice = pDepthMarketData.OpenPrice
        ###最高价
        pyDepthMarketData.HighestPrice = pDepthMarketData.HighestPrice
        ###最低价
        pyDepthMarketData.LowestPrice = pDepthMarketData.LowestPrice
        ###数量
        pyDepthMarketData.Volume = pDepthMarketData.Volume
        ###成交金额
        pyDepthMarketData.Turnover = pDepthMarketData.Turnover
        ###持仓量
        pyDepthMarketData.OpenInterest = pDepthMarketData.OpenInterest
        ###今收盘
        pyDepthMarketData.ClosePrice = pDepthMarketData.ClosePrice
        ###本次结算价
        pyDepthMarketData.SettlementPrice = pDepthMarketData.SettlementPrice
        ###涨停板价
        pyDepthMarketData.UpperLimitPrice = pDepthMarketData.UpperLimitPrice
        ###跌停板价
        pyDepthMarketData.LowerLimitPrice = pDepthMarketData.LowerLimitPrice
        ###昨虚实度
        pyDepthMarketData.PreDelta = pDepthMarketData.PreDelta
        ###今虚实度
        pyDepthMarketData.CurrDelta = pDepthMarketData.CurrDelta
        ###最后修改时间
        pyDepthMarketData.UpdateTime = pDepthMarketData.UpdateTime
        ###最后修改毫秒
        pyDepthMarketData.UpdateMillisec = pDepthMarketData.UpdateMillisec
        ###申买价一
        pyDepthMarketData.BidPrice1 = pDepthMarketData.BidPrice1
        ###申买量一
        pyDepthMarketData.BidVolume1 = pDepthMarketData.BidVolume1
        ###申卖价一
        pyDepthMarketData.AskPrice1 = pDepthMarketData.AskPrice1
        ###申卖量一
        pyDepthMarketData.AskVolume1 = pDepthMarketData.AskVolume1
        ###申买价二
        pyDepthMarketData.BidPrice2 = pDepthMarketData.BidPrice2
        ###申买量二
        pyDepthMarketData.BidVolume2 = pDepthMarketData.BidVolume2
        ###申卖价二
        pyDepthMarketData.AskPrice2 = pDepthMarketData.AskPrice2
        ###申卖量二
        pyDepthMarketData.AskVolume2 = pDepthMarketData.AskVolume2
        ###申买价三
        pyDepthMarketData.BidPrice3 = pDepthMarketData.BidPrice3
        ###申买量三
        pyDepthMarketData.BidVolume3 = pDepthMarketData.BidVolume3
        ###申卖价三
        pyDepthMarketData.AskPrice3 = pDepthMarketData.AskPrice3
        ###申卖量三
        pyDepthMarketData.AskVolume3 = pDepthMarketData.AskVolume3
        ###申买价四
        pyDepthMarketData.BidPrice4 = pDepthMarketData.BidPrice4
        ###申买量四
        pyDepthMarketData.BidVolume4 = pDepthMarketData.BidVolume4
        ###申卖价四
        pyDepthMarketData.AskPrice4 = pDepthMarketData.AskPrice4
        ###申卖量四
        pyDepthMarketData.AskVolume4 = pDepthMarketData.AskVolume4
        ###申买价五
        pyDepthMarketData.BidPrice5 = pDepthMarketData.BidPrice5
        ###申买量五
        pyDepthMarketData.BidVolume5 = pDepthMarketData.BidVolume5
        ###申卖价五
        pyDepthMarketData.AskPrice5 = pDepthMarketData.AskPrice5
        ###申卖量五
        pyDepthMarketData.AskVolume5 = pDepthMarketData.AskVolume5
        ###当日均价
        pyDepthMarketData.AveragePrice = pDepthMarketData.AveragePrice
        ###业务日期
        pyDepthMarketData.ActionDay = pDepthMarketData.ActionDay
    
        attr_decode(pyDepthMarketData)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryDepthMarketData(pyDepthMarketData, pyRspInfo, nRequestID, bIsLast)

# 请求查询投资者结算结果响应
cdef extern void OnStaticRspQrySettlementInfo(CThostFtdcSettlementInfoField *pSettlementInfo, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pySettlementInfo = None
    if pSettlementInfo:
        pySettlementInfo = pyThostFtdcSettlementInfoField()
    
        ###交易日
        pySettlementInfo.TradingDay = pSettlementInfo.TradingDay
        ###结算编号
        pySettlementInfo.SettlementID = pSettlementInfo.SettlementID
        ###经纪公司代码
        pySettlementInfo.BrokerID = pSettlementInfo.BrokerID
        ###投资者代码
        pySettlementInfo.InvestorID = pSettlementInfo.InvestorID
        ###序号
        pySettlementInfo.SequenceNo = pSettlementInfo.SequenceNo
        ###消息正文
        pySettlementInfo.Content = pSettlementInfo.Content
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQrySettlementInfo(pySettlementInfo, pyRspInfo, nRequestID, bIsLast)

# 请求查询转帐银行响应
cdef extern void OnStaticRspQryTransferBank(CThostFtdcTransferBankField *pTransferBank, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyTransferBank = None
    if pTransferBank:
        pyTransferBank = pyThostFtdcTransferBankField()
    
        ###银行代码
        pyTransferBank.BankID = pTransferBank.BankID
        ###银行分中心代码
        pyTransferBank.BankBrchID = pTransferBank.BankBrchID
        ###银行名称
        pyTransferBank.BankName = pTransferBank.BankName
        ###是否活跃
        pyTransferBank.IsActive = pTransferBank.IsActive
    
        attr_decode(pyTransferBank)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryTransferBank(pyTransferBank, pyRspInfo, nRequestID, bIsLast)

# 请求查询投资者持仓明细响应
cdef extern void OnStaticRspQryInvestorPositionDetail(CThostFtdcInvestorPositionDetailField *pInvestorPositionDetail, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInvestorPositionDetail = None
    if pInvestorPositionDetail:
        pyInvestorPositionDetail = pyThostFtdcInvestorPositionDetailField()
    
        ###合约代码
        pyInvestorPositionDetail.InstrumentID = pInvestorPositionDetail.InstrumentID
        ###经纪公司代码
        pyInvestorPositionDetail.BrokerID = pInvestorPositionDetail.BrokerID
        ###投资者代码
        pyInvestorPositionDetail.InvestorID = pInvestorPositionDetail.InvestorID
        ###投机套保标志
        pyInvestorPositionDetail.HedgeFlag = pInvestorPositionDetail.HedgeFlag
        ###买卖
        pyInvestorPositionDetail.Direction = pInvestorPositionDetail.Direction
        ###开仓日期
        pyInvestorPositionDetail.OpenDate = pInvestorPositionDetail.OpenDate
        ###成交编号
        pyInvestorPositionDetail.TradeID = pInvestorPositionDetail.TradeID
        ###数量
        pyInvestorPositionDetail.Volume = pInvestorPositionDetail.Volume
        ###开仓价
        pyInvestorPositionDetail.OpenPrice = pInvestorPositionDetail.OpenPrice
        ###交易日
        pyInvestorPositionDetail.TradingDay = pInvestorPositionDetail.TradingDay
        ###结算编号
        pyInvestorPositionDetail.SettlementID = pInvestorPositionDetail.SettlementID
        ###成交类型
        pyInvestorPositionDetail.TradeType = pInvestorPositionDetail.TradeType
        ###组合合约代码
        pyInvestorPositionDetail.CombInstrumentID = pInvestorPositionDetail.CombInstrumentID
        ###交易所代码
        pyInvestorPositionDetail.ExchangeID = pInvestorPositionDetail.ExchangeID
        ###逐日盯市平仓盈亏
        pyInvestorPositionDetail.CloseProfitByDate = pInvestorPositionDetail.CloseProfitByDate
        ###逐笔对冲平仓盈亏
        pyInvestorPositionDetail.CloseProfitByTrade = pInvestorPositionDetail.CloseProfitByTrade
        ###逐日盯市持仓盈亏
        pyInvestorPositionDetail.PositionProfitByDate = pInvestorPositionDetail.PositionProfitByDate
        ###逐笔对冲持仓盈亏
        pyInvestorPositionDetail.PositionProfitByTrade = pInvestorPositionDetail.PositionProfitByTrade
        ###投资者保证金
        pyInvestorPositionDetail.Margin = pInvestorPositionDetail.Margin
        ###交易所保证金
        pyInvestorPositionDetail.ExchMargin = pInvestorPositionDetail.ExchMargin
        ###保证金率
        pyInvestorPositionDetail.MarginRateByMoney = pInvestorPositionDetail.MarginRateByMoney
        ###保证金率(按手数)
        pyInvestorPositionDetail.MarginRateByVolume = pInvestorPositionDetail.MarginRateByVolume
        ###昨结算价
        pyInvestorPositionDetail.LastSettlementPrice = pInvestorPositionDetail.LastSettlementPrice
        ###结算价
        pyInvestorPositionDetail.SettlementPrice = pInvestorPositionDetail.SettlementPrice
        ###平仓量
        pyInvestorPositionDetail.CloseVolume = pInvestorPositionDetail.CloseVolume
        ###平仓金额
        pyInvestorPositionDetail.CloseAmount = pInvestorPositionDetail.CloseAmount
    
        attr_decode(pyInvestorPositionDetail)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryInvestorPositionDetail(pyInvestorPositionDetail, pyRspInfo, nRequestID, bIsLast)

# 请求查询客户通知响应
cdef extern void OnStaticRspQryNotice(CThostFtdcNoticeField *pNotice, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyNotice = None
    if pNotice:
        pyNotice = pyThostFtdcNoticeField()
    
        ###经纪公司代码
        pyNotice.BrokerID = pNotice.BrokerID
        ###消息正文
        pyNotice.Content = pNotice.Content
        ###经纪公司通知内容序列号
        pyNotice.SequenceLabel = pNotice.SequenceLabel
    
        attr_decode(pyNotice)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryNotice(pyNotice, pyRspInfo, nRequestID, bIsLast)

# 请求查询结算信息确认响应
cdef extern void OnStaticRspQrySettlementInfoConfirm(CThostFtdcSettlementInfoConfirmField *pSettlementInfoConfirm, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pySettlementInfoConfirm = None
    if pSettlementInfoConfirm:
        pySettlementInfoConfirm = pyThostFtdcSettlementInfoConfirmField()
    
        ###经纪公司代码
        pySettlementInfoConfirm.BrokerID = pSettlementInfoConfirm.BrokerID
        ###投资者代码
        pySettlementInfoConfirm.InvestorID = pSettlementInfoConfirm.InvestorID
        ###确认日期
        pySettlementInfoConfirm.ConfirmDate = pSettlementInfoConfirm.ConfirmDate
        ###确认时间
        pySettlementInfoConfirm.ConfirmTime = pSettlementInfoConfirm.ConfirmTime
    
        attr_decode(pySettlementInfoConfirm)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQrySettlementInfoConfirm(pySettlementInfoConfirm, pyRspInfo, nRequestID, bIsLast)

# 请求查询投资者持仓明细响应
cdef extern void OnStaticRspQryInvestorPositionCombineDetail(CThostFtdcInvestorPositionCombineDetailField *pInvestorPositionCombineDetail, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInvestorPositionCombineDetail = None
    if pInvestorPositionCombineDetail:
        pyInvestorPositionCombineDetail = pyThostFtdcInvestorPositionCombineDetailField()
    
        ###交易日
        pyInvestorPositionCombineDetail.TradingDay = pInvestorPositionCombineDetail.TradingDay
        ###开仓日期
        pyInvestorPositionCombineDetail.OpenDate = pInvestorPositionCombineDetail.OpenDate
        ###交易所代码
        pyInvestorPositionCombineDetail.ExchangeID = pInvestorPositionCombineDetail.ExchangeID
        ###结算编号
        pyInvestorPositionCombineDetail.SettlementID = pInvestorPositionCombineDetail.SettlementID
        ###经纪公司代码
        pyInvestorPositionCombineDetail.BrokerID = pInvestorPositionCombineDetail.BrokerID
        ###投资者代码
        pyInvestorPositionCombineDetail.InvestorID = pInvestorPositionCombineDetail.InvestorID
        ###组合编号
        pyInvestorPositionCombineDetail.ComTradeID = pInvestorPositionCombineDetail.ComTradeID
        ###撮合编号
        pyInvestorPositionCombineDetail.TradeID = pInvestorPositionCombineDetail.TradeID
        ###合约代码
        pyInvestorPositionCombineDetail.InstrumentID = pInvestorPositionCombineDetail.InstrumentID
        ###投机套保标志
        pyInvestorPositionCombineDetail.HedgeFlag = pInvestorPositionCombineDetail.HedgeFlag
        ###买卖
        pyInvestorPositionCombineDetail.Direction = pInvestorPositionCombineDetail.Direction
        ###持仓量
        pyInvestorPositionCombineDetail.TotalAmt = pInvestorPositionCombineDetail.TotalAmt
        ###投资者保证金
        pyInvestorPositionCombineDetail.Margin = pInvestorPositionCombineDetail.Margin
        ###交易所保证金
        pyInvestorPositionCombineDetail.ExchMargin = pInvestorPositionCombineDetail.ExchMargin
        ###保证金率
        pyInvestorPositionCombineDetail.MarginRateByMoney = pInvestorPositionCombineDetail.MarginRateByMoney
        ###保证金率(按手数)
        pyInvestorPositionCombineDetail.MarginRateByVolume = pInvestorPositionCombineDetail.MarginRateByVolume
        ###单腿编号
        pyInvestorPositionCombineDetail.LegID = pInvestorPositionCombineDetail.LegID
        ###单腿乘数
        pyInvestorPositionCombineDetail.LegMultiple = pInvestorPositionCombineDetail.LegMultiple
        ###组合持仓合约编码
        pyInvestorPositionCombineDetail.CombInstrumentID = pInvestorPositionCombineDetail.CombInstrumentID
        ###成交组号
        pyInvestorPositionCombineDetail.TradeGroupID = pInvestorPositionCombineDetail.TradeGroupID
    
        attr_decode(pyInvestorPositionCombineDetail)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryInvestorPositionCombineDetail(pyInvestorPositionCombineDetail, pyRspInfo, nRequestID, bIsLast)

# 查询保证金监管系统经纪公司资金账户密钥响应
cdef extern void OnStaticRspQryCFMMCTradingAccountKey(CThostFtdcCFMMCTradingAccountKeyField *pCFMMCTradingAccountKey, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyCFMMCTradingAccountKey = None
    if pCFMMCTradingAccountKey:
        pyCFMMCTradingAccountKey = pyThostFtdcCFMMCTradingAccountKeyField()
    
        ###经纪公司代码
        pyCFMMCTradingAccountKey.BrokerID = pCFMMCTradingAccountKey.BrokerID
        ###经纪公司统一编码
        pyCFMMCTradingAccountKey.ParticipantID = pCFMMCTradingAccountKey.ParticipantID
        ###投资者帐号
        pyCFMMCTradingAccountKey.AccountID = pCFMMCTradingAccountKey.AccountID
        ###密钥编号
        pyCFMMCTradingAccountKey.KeyID = pCFMMCTradingAccountKey.KeyID
        ###动态密钥
        pyCFMMCTradingAccountKey.CurrentKey = pCFMMCTradingAccountKey.CurrentKey
    
        attr_decode(pyCFMMCTradingAccountKey)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryCFMMCTradingAccountKey(pyCFMMCTradingAccountKey, pyRspInfo, nRequestID, bIsLast)

# 请求查询仓单折抵信息响应
cdef extern void OnStaticRspQryEWarrantOffset(CThostFtdcEWarrantOffsetField *pEWarrantOffset, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyEWarrantOffset = None
    if pEWarrantOffset:
        pyEWarrantOffset = pyThostFtdcEWarrantOffsetField()
    
        ###交易日期
        pyEWarrantOffset.TradingDay = pEWarrantOffset.TradingDay
        ###经纪公司代码
        pyEWarrantOffset.BrokerID = pEWarrantOffset.BrokerID
        ###投资者代码
        pyEWarrantOffset.InvestorID = pEWarrantOffset.InvestorID
        ###交易所代码
        pyEWarrantOffset.ExchangeID = pEWarrantOffset.ExchangeID
        ###合约代码
        pyEWarrantOffset.InstrumentID = pEWarrantOffset.InstrumentID
        ###买卖方向
        pyEWarrantOffset.Direction = pEWarrantOffset.Direction
        ###投机套保标志
        pyEWarrantOffset.HedgeFlag = pEWarrantOffset.HedgeFlag
        ###数量
        pyEWarrantOffset.Volume = pEWarrantOffset.Volume
    
        attr_decode(pyEWarrantOffset)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryEWarrantOffset(pyEWarrantOffset, pyRspInfo, nRequestID, bIsLast)

# 请求查询投资者品种/跨品种保证金响应
cdef extern void OnStaticRspQryInvestorProductGroupMargin(CThostFtdcInvestorProductGroupMarginField *pInvestorProductGroupMargin, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInvestorProductGroupMargin = None
    if pInvestorProductGroupMargin:
        pyInvestorProductGroupMargin = pyThostFtdcInvestorProductGroupMarginField()
    
        ###品种#跨品种标示
        pyInvestorProductGroupMargin.ProductGroupID = pInvestorProductGroupMargin.ProductGroupID
        ###经纪公司代码
        pyInvestorProductGroupMargin.BrokerID = pInvestorProductGroupMargin.BrokerID
        ###投资者代码
        pyInvestorProductGroupMargin.InvestorID = pInvestorProductGroupMargin.InvestorID
        ###交易日
        pyInvestorProductGroupMargin.TradingDay = pInvestorProductGroupMargin.TradingDay
        ###结算编号
        pyInvestorProductGroupMargin.SettlementID = pInvestorProductGroupMargin.SettlementID
        ###冻结的保证金
        pyInvestorProductGroupMargin.FrozenMargin = pInvestorProductGroupMargin.FrozenMargin
        ###多头冻结的保证金
        pyInvestorProductGroupMargin.LongFrozenMargin = pInvestorProductGroupMargin.LongFrozenMargin
        ###空头冻结的保证金
        pyInvestorProductGroupMargin.ShortFrozenMargin = pInvestorProductGroupMargin.ShortFrozenMargin
        ###占用的保证金
        pyInvestorProductGroupMargin.UseMargin = pInvestorProductGroupMargin.UseMargin
        ###多头保证金
        pyInvestorProductGroupMargin.LongUseMargin = pInvestorProductGroupMargin.LongUseMargin
        ###空头保证金
        pyInvestorProductGroupMargin.ShortUseMargin = pInvestorProductGroupMargin.ShortUseMargin
        ###交易所保证金
        pyInvestorProductGroupMargin.ExchMargin = pInvestorProductGroupMargin.ExchMargin
        ###交易所多头保证金
        pyInvestorProductGroupMargin.LongExchMargin = pInvestorProductGroupMargin.LongExchMargin
        ###交易所空头保证金
        pyInvestorProductGroupMargin.ShortExchMargin = pInvestorProductGroupMargin.ShortExchMargin
        ###平仓盈亏
        pyInvestorProductGroupMargin.CloseProfit = pInvestorProductGroupMargin.CloseProfit
        ###冻结的手续费
        pyInvestorProductGroupMargin.FrozenCommission = pInvestorProductGroupMargin.FrozenCommission
        ###手续费
        pyInvestorProductGroupMargin.Commission = pInvestorProductGroupMargin.Commission
        ###冻结的资金
        pyInvestorProductGroupMargin.FrozenCash = pInvestorProductGroupMargin.FrozenCash
        ###资金差额
        pyInvestorProductGroupMargin.CashIn = pInvestorProductGroupMargin.CashIn
        ###持仓盈亏
        pyInvestorProductGroupMargin.PositionProfit = pInvestorProductGroupMargin.PositionProfit
        ###折抵总金额
        pyInvestorProductGroupMargin.OffsetAmount = pInvestorProductGroupMargin.OffsetAmount
        ###多头折抵总金额
        pyInvestorProductGroupMargin.LongOffsetAmount = pInvestorProductGroupMargin.LongOffsetAmount
        ###空头折抵总金额
        pyInvestorProductGroupMargin.ShortOffsetAmount = pInvestorProductGroupMargin.ShortOffsetAmount
        ###交易所折抵总金额
        pyInvestorProductGroupMargin.ExchOffsetAmount = pInvestorProductGroupMargin.ExchOffsetAmount
        ###交易所多头折抵总金额
        pyInvestorProductGroupMargin.LongExchOffsetAmount = pInvestorProductGroupMargin.LongExchOffsetAmount
        ###交易所空头折抵总金额
        pyInvestorProductGroupMargin.ShortExchOffsetAmount = pInvestorProductGroupMargin.ShortExchOffsetAmount
        ###投机套保标志
        pyInvestorProductGroupMargin.HedgeFlag = pInvestorProductGroupMargin.HedgeFlag
    
        attr_decode(pyInvestorProductGroupMargin)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryInvestorProductGroupMargin(pyInvestorProductGroupMargin, pyRspInfo, nRequestID, bIsLast)

# 请求查询交易所保证金率响应
cdef extern void OnStaticRspQryExchangeMarginRate(CThostFtdcExchangeMarginRateField *pExchangeMarginRate, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyExchangeMarginRate = None
    if pExchangeMarginRate:
        pyExchangeMarginRate = pyThostFtdcExchangeMarginRateField()
    
        ###经纪公司代码
        pyExchangeMarginRate.BrokerID = pExchangeMarginRate.BrokerID
        ###合约代码
        pyExchangeMarginRate.InstrumentID = pExchangeMarginRate.InstrumentID
        ###投机套保标志
        pyExchangeMarginRate.HedgeFlag = pExchangeMarginRate.HedgeFlag
        ###多头保证金率
        pyExchangeMarginRate.LongMarginRatioByMoney = pExchangeMarginRate.LongMarginRatioByMoney
        ###多头保证金费
        pyExchangeMarginRate.LongMarginRatioByVolume = pExchangeMarginRate.LongMarginRatioByVolume
        ###空头保证金率
        pyExchangeMarginRate.ShortMarginRatioByMoney = pExchangeMarginRate.ShortMarginRatioByMoney
        ###空头保证金费
        pyExchangeMarginRate.ShortMarginRatioByVolume = pExchangeMarginRate.ShortMarginRatioByVolume
    
        attr_decode(pyExchangeMarginRate)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryExchangeMarginRate(pyExchangeMarginRate, pyRspInfo, nRequestID, bIsLast)

# 请求查询交易所调整保证金率响应
cdef extern void OnStaticRspQryExchangeMarginRateAdjust(CThostFtdcExchangeMarginRateAdjustField *pExchangeMarginRateAdjust, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyExchangeMarginRateAdjust = None
    if pExchangeMarginRateAdjust:
        pyExchangeMarginRateAdjust = pyThostFtdcExchangeMarginRateAdjustField()
    
        ###经纪公司代码
        pyExchangeMarginRateAdjust.BrokerID = pExchangeMarginRateAdjust.BrokerID
        ###合约代码
        pyExchangeMarginRateAdjust.InstrumentID = pExchangeMarginRateAdjust.InstrumentID
        ###投机套保标志
        pyExchangeMarginRateAdjust.HedgeFlag = pExchangeMarginRateAdjust.HedgeFlag
        ###跟随交易所投资者多头保证金率
        pyExchangeMarginRateAdjust.LongMarginRatioByMoney = pExchangeMarginRateAdjust.LongMarginRatioByMoney
        ###跟随交易所投资者多头保证金费
        pyExchangeMarginRateAdjust.LongMarginRatioByVolume = pExchangeMarginRateAdjust.LongMarginRatioByVolume
        ###跟随交易所投资者空头保证金率
        pyExchangeMarginRateAdjust.ShortMarginRatioByMoney = pExchangeMarginRateAdjust.ShortMarginRatioByMoney
        ###跟随交易所投资者空头保证金费
        pyExchangeMarginRateAdjust.ShortMarginRatioByVolume = pExchangeMarginRateAdjust.ShortMarginRatioByVolume
        ###交易所多头保证金率
        pyExchangeMarginRateAdjust.ExchLongMarginRatioByMoney = pExchangeMarginRateAdjust.ExchLongMarginRatioByMoney
        ###交易所多头保证金费
        pyExchangeMarginRateAdjust.ExchLongMarginRatioByVolume = pExchangeMarginRateAdjust.ExchLongMarginRatioByVolume
        ###交易所空头保证金率
        pyExchangeMarginRateAdjust.ExchShortMarginRatioByMoney = pExchangeMarginRateAdjust.ExchShortMarginRatioByMoney
        ###交易所空头保证金费
        pyExchangeMarginRateAdjust.ExchShortMarginRatioByVolume = pExchangeMarginRateAdjust.ExchShortMarginRatioByVolume
        ###不跟随交易所投资者多头保证金率
        pyExchangeMarginRateAdjust.NoLongMarginRatioByMoney = pExchangeMarginRateAdjust.NoLongMarginRatioByMoney
        ###不跟随交易所投资者多头保证金费
        pyExchangeMarginRateAdjust.NoLongMarginRatioByVolume = pExchangeMarginRateAdjust.NoLongMarginRatioByVolume
        ###不跟随交易所投资者空头保证金率
        pyExchangeMarginRateAdjust.NoShortMarginRatioByMoney = pExchangeMarginRateAdjust.NoShortMarginRatioByMoney
        ###不跟随交易所投资者空头保证金费
        pyExchangeMarginRateAdjust.NoShortMarginRatioByVolume = pExchangeMarginRateAdjust.NoShortMarginRatioByVolume
    
        attr_decode(pyExchangeMarginRateAdjust)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryExchangeMarginRateAdjust(pyExchangeMarginRateAdjust, pyRspInfo, nRequestID, bIsLast)

# 请求查询汇率响应
cdef extern void OnStaticRspQryExchangeRate(CThostFtdcExchangeRateField *pExchangeRate, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyExchangeRate = None
    if pExchangeRate:
        pyExchangeRate = pyThostFtdcExchangeRateField()
    
        ###经纪公司代码
        pyExchangeRate.BrokerID = pExchangeRate.BrokerID
        ###源币种
        pyExchangeRate.FromCurrencyID = pExchangeRate.FromCurrencyID
        ###源币种单位数量
        pyExchangeRate.FromCurrencyUnit = pExchangeRate.FromCurrencyUnit
        ###目标币种
        pyExchangeRate.ToCurrencyID = pExchangeRate.ToCurrencyID
        ###汇率
        pyExchangeRate.ExchangeRate = pExchangeRate.ExchangeRate
    
        attr_decode(pyExchangeRate)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryExchangeRate(pyExchangeRate, pyRspInfo, nRequestID, bIsLast)

# 请求查询二级代理操作员银期权限响应
cdef extern void OnStaticRspQrySecAgentACIDMap(CThostFtdcSecAgentACIDMapField *pSecAgentACIDMap, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pySecAgentACIDMap = None
    if pSecAgentACIDMap:
        pySecAgentACIDMap = pyThostFtdcSecAgentACIDMapField()
    
        ###经纪公司代码
        pySecAgentACIDMap.BrokerID = pSecAgentACIDMap.BrokerID
        ###用户代码
        pySecAgentACIDMap.UserID = pSecAgentACIDMap.UserID
        ###资金账户
        pySecAgentACIDMap.AccountID = pSecAgentACIDMap.AccountID
        ###币种
        pySecAgentACIDMap.CurrencyID = pSecAgentACIDMap.CurrencyID
        ###境外中介机构资金帐号
        pySecAgentACIDMap.BrokerSecAgentID = pSecAgentACIDMap.BrokerSecAgentID
    
        attr_decode(pySecAgentACIDMap)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQrySecAgentACIDMap(pySecAgentACIDMap, pyRspInfo, nRequestID, bIsLast)

# 请求查询产品组
cdef extern void OnStaticRspQryProductGroup(CThostFtdcProductGroupField *pProductGroup, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyProductGroup = None
    if pProductGroup:
        pyProductGroup = pyThostFtdcProductGroupField()
    
        ###产品代码
        pyProductGroup.ProductID = pProductGroup.ProductID
        ###交易所代码
        pyProductGroup.ExchangeID = pProductGroup.ExchangeID
        ###产品组代码
        pyProductGroup.ProductGroupID = pProductGroup.ProductGroupID
    
        attr_decode(pyProductGroup)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryProductGroup(pyProductGroup, pyRspInfo, nRequestID, bIsLast)

# 请求查询报单手续费响应
cdef extern void OnStaticRspQryInstrumentOrderCommRate(CThostFtdcInstrumentOrderCommRateField *pInstrumentOrderCommRate, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInstrumentOrderCommRate = None
    if pInstrumentOrderCommRate:
        pyInstrumentOrderCommRate = pyThostFtdcInstrumentOrderCommRateField()
    
        ###合约代码
        pyInstrumentOrderCommRate.InstrumentID = pInstrumentOrderCommRate.InstrumentID
        ###投资者范围
        pyInstrumentOrderCommRate.InvestorRange = pInstrumentOrderCommRate.InvestorRange
        ###经纪公司代码
        pyInstrumentOrderCommRate.BrokerID = pInstrumentOrderCommRate.BrokerID
        ###投资者代码
        pyInstrumentOrderCommRate.InvestorID = pInstrumentOrderCommRate.InvestorID
        ###投机套保标志
        pyInstrumentOrderCommRate.HedgeFlag = pInstrumentOrderCommRate.HedgeFlag
        ###报单手续费
        pyInstrumentOrderCommRate.OrderCommByVolume = pInstrumentOrderCommRate.OrderCommByVolume
        ###撤单手续费
        pyInstrumentOrderCommRate.OrderActionCommByVolume = pInstrumentOrderCommRate.OrderActionCommByVolume
    
        attr_decode(pyInstrumentOrderCommRate)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryInstrumentOrderCommRate(pyInstrumentOrderCommRate, pyRspInfo, nRequestID, bIsLast)

# 请求查询期权交易成本响应
cdef extern void OnStaticRspQryOptionInstrTradeCost(CThostFtdcOptionInstrTradeCostField *pOptionInstrTradeCost, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyOptionInstrTradeCost = None
    if pOptionInstrTradeCost:
        pyOptionInstrTradeCost = pyThostFtdcOptionInstrTradeCostField()
    
        ###经纪公司代码
        pyOptionInstrTradeCost.BrokerID = pOptionInstrTradeCost.BrokerID
        ###投资者代码
        pyOptionInstrTradeCost.InvestorID = pOptionInstrTradeCost.InvestorID
        ###合约代码
        pyOptionInstrTradeCost.InstrumentID = pOptionInstrTradeCost.InstrumentID
        ###投机套保标志
        pyOptionInstrTradeCost.HedgeFlag = pOptionInstrTradeCost.HedgeFlag
        ###期权合约保证金不变部分
        pyOptionInstrTradeCost.FixedMargin = pOptionInstrTradeCost.FixedMargin
        ###期权合约最小保证金
        pyOptionInstrTradeCost.MiniMargin = pOptionInstrTradeCost.MiniMargin
        ###期权合约权利金
        pyOptionInstrTradeCost.Royalty = pOptionInstrTradeCost.Royalty
        ###交易所期权合约保证金不变部分
        pyOptionInstrTradeCost.ExchFixedMargin = pOptionInstrTradeCost.ExchFixedMargin
        ###交易所期权合约最小保证金
        pyOptionInstrTradeCost.ExchMiniMargin = pOptionInstrTradeCost.ExchMiniMargin
    
        attr_decode(pyOptionInstrTradeCost)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryOptionInstrTradeCost(pyOptionInstrTradeCost, pyRspInfo, nRequestID, bIsLast)

# 请求查询期权合约手续费响应
cdef extern void OnStaticRspQryOptionInstrCommRate(CThostFtdcOptionInstrCommRateField *pOptionInstrCommRate, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyOptionInstrCommRate = None
    if pOptionInstrCommRate:
        pyOptionInstrCommRate = pyThostFtdcOptionInstrCommRateField()
    
        ###合约代码
        pyOptionInstrCommRate.InstrumentID = pOptionInstrCommRate.InstrumentID
        ###投资者范围
        pyOptionInstrCommRate.InvestorRange = pOptionInstrCommRate.InvestorRange
        ###经纪公司代码
        pyOptionInstrCommRate.BrokerID = pOptionInstrCommRate.BrokerID
        ###投资者代码
        pyOptionInstrCommRate.InvestorID = pOptionInstrCommRate.InvestorID
        ###开仓手续费率
        pyOptionInstrCommRate.OpenRatioByMoney = pOptionInstrCommRate.OpenRatioByMoney
        ###开仓手续费
        pyOptionInstrCommRate.OpenRatioByVolume = pOptionInstrCommRate.OpenRatioByVolume
        ###平仓手续费率
        pyOptionInstrCommRate.CloseRatioByMoney = pOptionInstrCommRate.CloseRatioByMoney
        ###平仓手续费
        pyOptionInstrCommRate.CloseRatioByVolume = pOptionInstrCommRate.CloseRatioByVolume
        ###平今手续费率
        pyOptionInstrCommRate.CloseTodayRatioByMoney = pOptionInstrCommRate.CloseTodayRatioByMoney
        ###平今手续费
        pyOptionInstrCommRate.CloseTodayRatioByVolume = pOptionInstrCommRate.CloseTodayRatioByVolume
        ###执行手续费率
        pyOptionInstrCommRate.StrikeRatioByMoney = pOptionInstrCommRate.StrikeRatioByMoney
        ###执行手续费
        pyOptionInstrCommRate.StrikeRatioByVolume = pOptionInstrCommRate.StrikeRatioByVolume
    
        attr_decode(pyOptionInstrCommRate)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryOptionInstrCommRate(pyOptionInstrCommRate, pyRspInfo, nRequestID, bIsLast)

# 请求查询执行宣告响应
cdef extern void OnStaticRspQryExecOrder(CThostFtdcExecOrderField *pExecOrder, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyExecOrder = None
    if pExecOrder:
        pyExecOrder = pyThostFtdcExecOrderField()
    
        ###经纪公司代码
        pyExecOrder.BrokerID = pExecOrder.BrokerID
        ###投资者代码
        pyExecOrder.InvestorID = pExecOrder.InvestorID
        ###合约代码
        pyExecOrder.InstrumentID = pExecOrder.InstrumentID
        ###执行宣告引用
        pyExecOrder.ExecOrderRef = pExecOrder.ExecOrderRef
        ###用户代码
        pyExecOrder.UserID = pExecOrder.UserID
        ###数量
        pyExecOrder.Volume = pExecOrder.Volume
        ###请求编号
        pyExecOrder.RequestID = pExecOrder.RequestID
        ###业务单元
        pyExecOrder.BusinessUnit = pExecOrder.BusinessUnit
        ###开平标志
        pyExecOrder.OffsetFlag = pExecOrder.OffsetFlag
        ###投机套保标志
        pyExecOrder.HedgeFlag = pExecOrder.HedgeFlag
        ###执行类型
        pyExecOrder.ActionType = pExecOrder.ActionType
        ###保留头寸申请的持仓方向
        pyExecOrder.PosiDirection = pExecOrder.PosiDirection
        ###期权行权后是否保留期货头寸的标记
        pyExecOrder.ReservePositionFlag = pExecOrder.ReservePositionFlag
        ###期权行权后生成的头寸是否自动平仓
        pyExecOrder.CloseFlag = pExecOrder.CloseFlag
        ###本地执行宣告编号
        pyExecOrder.ExecOrderLocalID = pExecOrder.ExecOrderLocalID
        ###交易所代码
        pyExecOrder.ExchangeID = pExecOrder.ExchangeID
        ###会员代码
        pyExecOrder.ParticipantID = pExecOrder.ParticipantID
        ###客户代码
        pyExecOrder.ClientID = pExecOrder.ClientID
        ###合约在交易所的代码
        pyExecOrder.ExchangeInstID = pExecOrder.ExchangeInstID
        ###交易所交易员代码
        pyExecOrder.TraderID = pExecOrder.TraderID
        ###安装编号
        pyExecOrder.InstallID = pExecOrder.InstallID
        ###执行宣告提交状态
        pyExecOrder.OrderSubmitStatus = pExecOrder.OrderSubmitStatus
        ###报单提示序号
        pyExecOrder.NotifySequence = pExecOrder.NotifySequence
        ###交易日
        pyExecOrder.TradingDay = pExecOrder.TradingDay
        ###结算编号
        pyExecOrder.SettlementID = pExecOrder.SettlementID
        ###执行宣告编号
        pyExecOrder.ExecOrderSysID = pExecOrder.ExecOrderSysID
        ###报单日期
        pyExecOrder.InsertDate = pExecOrder.InsertDate
        ###插入时间
        pyExecOrder.InsertTime = pExecOrder.InsertTime
        ###撤销时间
        pyExecOrder.CancelTime = pExecOrder.CancelTime
        ###执行结果
        pyExecOrder.ExecResult = pExecOrder.ExecResult
        ###结算会员编号
        pyExecOrder.ClearingPartID = pExecOrder.ClearingPartID
        ###序号
        pyExecOrder.SequenceNo = pExecOrder.SequenceNo
        ###前置编号
        pyExecOrder.FrontID = pExecOrder.FrontID
        ###会话编号
        pyExecOrder.SessionID = pExecOrder.SessionID
        ###用户端产品信息
        pyExecOrder.UserProductInfo = pExecOrder.UserProductInfo
        ###状态信息
        pyExecOrder.StatusMsg = pExecOrder.StatusMsg
        ###操作用户代码
        pyExecOrder.ActiveUserID = pExecOrder.ActiveUserID
        ###经纪公司报单编号
        pyExecOrder.BrokerExecOrderSeq = pExecOrder.BrokerExecOrderSeq
    
        attr_decode(pyExecOrder)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryExecOrder(pyExecOrder, pyRspInfo, nRequestID, bIsLast)

# 请求查询询价响应
cdef extern void OnStaticRspQryForQuote(CThostFtdcForQuoteField *pForQuote, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyForQuote = None
    if pForQuote:
        pyForQuote = pyThostFtdcForQuoteField()
    
        ###经纪公司代码
        pyForQuote.BrokerID = pForQuote.BrokerID
        ###投资者代码
        pyForQuote.InvestorID = pForQuote.InvestorID
        ###合约代码
        pyForQuote.InstrumentID = pForQuote.InstrumentID
        ###询价引用
        pyForQuote.ForQuoteRef = pForQuote.ForQuoteRef
        ###用户代码
        pyForQuote.UserID = pForQuote.UserID
        ###本地询价编号
        pyForQuote.ForQuoteLocalID = pForQuote.ForQuoteLocalID
        ###交易所代码
        pyForQuote.ExchangeID = pForQuote.ExchangeID
        ###会员代码
        pyForQuote.ParticipantID = pForQuote.ParticipantID
        ###客户代码
        pyForQuote.ClientID = pForQuote.ClientID
        ###合约在交易所的代码
        pyForQuote.ExchangeInstID = pForQuote.ExchangeInstID
        ###交易所交易员代码
        pyForQuote.TraderID = pForQuote.TraderID
        ###安装编号
        pyForQuote.InstallID = pForQuote.InstallID
        ###报单日期
        pyForQuote.InsertDate = pForQuote.InsertDate
        ###插入时间
        pyForQuote.InsertTime = pForQuote.InsertTime
        ###询价状态
        pyForQuote.ForQuoteStatus = pForQuote.ForQuoteStatus
        ###前置编号
        pyForQuote.FrontID = pForQuote.FrontID
        ###会话编号
        pyForQuote.SessionID = pForQuote.SessionID
        ###状态信息
        pyForQuote.StatusMsg = pForQuote.StatusMsg
        ###操作用户代码
        pyForQuote.ActiveUserID = pForQuote.ActiveUserID
        ###经纪公司询价编号
        pyForQuote.BrokerForQutoSeq = pForQuote.BrokerForQutoSeq
    
        attr_decode(pyForQuote)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryForQuote(pyForQuote, pyRspInfo, nRequestID, bIsLast)

# 请求查询报价响应
cdef extern void OnStaticRspQryQuote(CThostFtdcQuoteField *pQuote, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyQuote = None
    if pQuote:
        pyQuote = pyThostFtdcQuoteField()
    
        ###经纪公司代码
        pyQuote.BrokerID = pQuote.BrokerID
        ###投资者代码
        pyQuote.InvestorID = pQuote.InvestorID
        ###合约代码
        pyQuote.InstrumentID = pQuote.InstrumentID
        ###报价引用
        pyQuote.QuoteRef = pQuote.QuoteRef
        ###用户代码
        pyQuote.UserID = pQuote.UserID
        ###卖价格
        pyQuote.AskPrice = pQuote.AskPrice
        ###买价格
        pyQuote.BidPrice = pQuote.BidPrice
        ###卖数量
        pyQuote.AskVolume = pQuote.AskVolume
        ###买数量
        pyQuote.BidVolume = pQuote.BidVolume
        ###请求编号
        pyQuote.RequestID = pQuote.RequestID
        ###业务单元
        pyQuote.BusinessUnit = pQuote.BusinessUnit
        ###卖开平标志
        pyQuote.AskOffsetFlag = pQuote.AskOffsetFlag
        ###买开平标志
        pyQuote.BidOffsetFlag = pQuote.BidOffsetFlag
        ###卖投机套保标志
        pyQuote.AskHedgeFlag = pQuote.AskHedgeFlag
        ###买投机套保标志
        pyQuote.BidHedgeFlag = pQuote.BidHedgeFlag
        ###本地报价编号
        pyQuote.QuoteLocalID = pQuote.QuoteLocalID
        ###交易所代码
        pyQuote.ExchangeID = pQuote.ExchangeID
        ###会员代码
        pyQuote.ParticipantID = pQuote.ParticipantID
        ###客户代码
        pyQuote.ClientID = pQuote.ClientID
        ###合约在交易所的代码
        pyQuote.ExchangeInstID = pQuote.ExchangeInstID
        ###交易所交易员代码
        pyQuote.TraderID = pQuote.TraderID
        ###安装编号
        pyQuote.InstallID = pQuote.InstallID
        ###报价提示序号
        pyQuote.NotifySequence = pQuote.NotifySequence
        ###报价提交状态
        pyQuote.OrderSubmitStatus = pQuote.OrderSubmitStatus
        ###交易日
        pyQuote.TradingDay = pQuote.TradingDay
        ###结算编号
        pyQuote.SettlementID = pQuote.SettlementID
        ###报价编号
        pyQuote.QuoteSysID = pQuote.QuoteSysID
        ###报单日期
        pyQuote.InsertDate = pQuote.InsertDate
        ###插入时间
        pyQuote.InsertTime = pQuote.InsertTime
        ###撤销时间
        pyQuote.CancelTime = pQuote.CancelTime
        ###报价状态
        pyQuote.QuoteStatus = pQuote.QuoteStatus
        ###结算会员编号
        pyQuote.ClearingPartID = pQuote.ClearingPartID
        ###序号
        pyQuote.SequenceNo = pQuote.SequenceNo
        ###卖方报单编号
        pyQuote.AskOrderSysID = pQuote.AskOrderSysID
        ###买方报单编号
        pyQuote.BidOrderSysID = pQuote.BidOrderSysID
        ###前置编号
        pyQuote.FrontID = pQuote.FrontID
        ###会话编号
        pyQuote.SessionID = pQuote.SessionID
        ###用户端产品信息
        pyQuote.UserProductInfo = pQuote.UserProductInfo
        ###状态信息
        pyQuote.StatusMsg = pQuote.StatusMsg
        ###操作用户代码
        pyQuote.ActiveUserID = pQuote.ActiveUserID
        ###经纪公司报价编号
        pyQuote.BrokerQuoteSeq = pQuote.BrokerQuoteSeq
        ###衍生卖报单引用
        pyQuote.AskOrderRef = pQuote.AskOrderRef
        ###衍生买报单引用
        pyQuote.BidOrderRef = pQuote.BidOrderRef
        ###应价编号
        pyQuote.ForQuoteSysID = pQuote.ForQuoteSysID
    
        attr_decode(pyQuote)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryQuote(pyQuote, pyRspInfo, nRequestID, bIsLast)

# 请求查询组合合约安全系数响应
cdef extern void OnStaticRspQryCombInstrumentGuard(CThostFtdcCombInstrumentGuardField *pCombInstrumentGuard, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyCombInstrumentGuard = None
    if pCombInstrumentGuard:
        pyCombInstrumentGuard = pyThostFtdcCombInstrumentGuardField()
    
        ###经纪公司代码
        pyCombInstrumentGuard.BrokerID = pCombInstrumentGuard.BrokerID
        ###合约代码
        pyCombInstrumentGuard.InstrumentID = pCombInstrumentGuard.InstrumentID
        ###
        pyCombInstrumentGuard.GuarantRatio = pCombInstrumentGuard.GuarantRatio
    
        attr_decode(pyCombInstrumentGuard)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryCombInstrumentGuard(pyCombInstrumentGuard, pyRspInfo, nRequestID, bIsLast)

# 请求查询申请组合响应
cdef extern void OnStaticRspQryCombAction(CThostFtdcCombActionField *pCombAction, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyCombAction = None
    if pCombAction:
        pyCombAction = pyThostFtdcCombActionField()
    
        ###经纪公司代码
        pyCombAction.BrokerID = pCombAction.BrokerID
        ###投资者代码
        pyCombAction.InvestorID = pCombAction.InvestorID
        ###合约代码
        pyCombAction.InstrumentID = pCombAction.InstrumentID
        ###组合引用
        pyCombAction.CombActionRef = pCombAction.CombActionRef
        ###用户代码
        pyCombAction.UserID = pCombAction.UserID
        ###买卖方向
        pyCombAction.Direction = pCombAction.Direction
        ###数量
        pyCombAction.Volume = pCombAction.Volume
        ###组合指令方向
        pyCombAction.CombDirection = pCombAction.CombDirection
        ###投机套保标志
        pyCombAction.HedgeFlag = pCombAction.HedgeFlag
        ###本地申请组合编号
        pyCombAction.ActionLocalID = pCombAction.ActionLocalID
        ###交易所代码
        pyCombAction.ExchangeID = pCombAction.ExchangeID
        ###会员代码
        pyCombAction.ParticipantID = pCombAction.ParticipantID
        ###客户代码
        pyCombAction.ClientID = pCombAction.ClientID
        ###合约在交易所的代码
        pyCombAction.ExchangeInstID = pCombAction.ExchangeInstID
        ###交易所交易员代码
        pyCombAction.TraderID = pCombAction.TraderID
        ###安装编号
        pyCombAction.InstallID = pCombAction.InstallID
        ###组合状态
        pyCombAction.ActionStatus = pCombAction.ActionStatus
        ###报单提示序号
        pyCombAction.NotifySequence = pCombAction.NotifySequence
        ###交易日
        pyCombAction.TradingDay = pCombAction.TradingDay
        ###结算编号
        pyCombAction.SettlementID = pCombAction.SettlementID
        ###序号
        pyCombAction.SequenceNo = pCombAction.SequenceNo
        ###前置编号
        pyCombAction.FrontID = pCombAction.FrontID
        ###会话编号
        pyCombAction.SessionID = pCombAction.SessionID
        ###用户端产品信息
        pyCombAction.UserProductInfo = pCombAction.UserProductInfo
        ###状态信息
        pyCombAction.StatusMsg = pCombAction.StatusMsg
    
        attr_decode(pyCombAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryCombAction(pyCombAction, pyRspInfo, nRequestID, bIsLast)

# 请求查询转帐流水响应
cdef extern void OnStaticRspQryTransferSerial(CThostFtdcTransferSerialField *pTransferSerial, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyTransferSerial = None
    if pTransferSerial:
        pyTransferSerial = pyThostFtdcTransferSerialField()
    
        ###平台流水号
        pyTransferSerial.PlateSerial = pTransferSerial.PlateSerial
        ###交易发起方日期
        pyTransferSerial.TradeDate = pTransferSerial.TradeDate
        ###交易日期
        pyTransferSerial.TradingDay = pTransferSerial.TradingDay
        ###交易时间
        pyTransferSerial.TradeTime = pTransferSerial.TradeTime
        ###交易代码
        pyTransferSerial.TradeCode = pTransferSerial.TradeCode
        ###会话编号
        pyTransferSerial.SessionID = pTransferSerial.SessionID
        ###银行编码
        pyTransferSerial.BankID = pTransferSerial.BankID
        ###银行分支机构编码
        pyTransferSerial.BankBranchID = pTransferSerial.BankBranchID
        ###银行帐号类型
        pyTransferSerial.BankAccType = pTransferSerial.BankAccType
        ###银行帐号
        pyTransferSerial.BankAccount = pTransferSerial.BankAccount
        ###银行流水号
        pyTransferSerial.BankSerial = pTransferSerial.BankSerial
        ###期货公司编码
        pyTransferSerial.BrokerID = pTransferSerial.BrokerID
        ###期商分支机构代码
        pyTransferSerial.BrokerBranchID = pTransferSerial.BrokerBranchID
        ###期货公司帐号类型
        pyTransferSerial.FutureAccType = pTransferSerial.FutureAccType
        ###投资者帐号
        pyTransferSerial.AccountID = pTransferSerial.AccountID
        ###投资者代码
        pyTransferSerial.InvestorID = pTransferSerial.InvestorID
        ###期货公司流水号
        pyTransferSerial.FutureSerial = pTransferSerial.FutureSerial
        ###证件类型
        pyTransferSerial.IdCardType = pTransferSerial.IdCardType
        ###证件号码
        pyTransferSerial.IdentifiedCardNo = pTransferSerial.IdentifiedCardNo
        ###币种代码
        pyTransferSerial.CurrencyID = pTransferSerial.CurrencyID
        ###交易金额
        pyTransferSerial.TradeAmount = pTransferSerial.TradeAmount
        ###应收客户费用
        pyTransferSerial.CustFee = pTransferSerial.CustFee
        ###应收期货公司费用
        pyTransferSerial.BrokerFee = pTransferSerial.BrokerFee
        ###有效标志
        pyTransferSerial.AvailabilityFlag = pTransferSerial.AvailabilityFlag
        ###操作员
        pyTransferSerial.OperatorCode = pTransferSerial.OperatorCode
        ###新银行帐号
        pyTransferSerial.BankNewAccount = pTransferSerial.BankNewAccount
        ###错误代码
        pyTransferSerial.ErrorID = pTransferSerial.ErrorID
        ###错误信息
        pyTransferSerial.ErrorMsg = pTransferSerial.ErrorMsg
    
        attr_decode(pyTransferSerial)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryTransferSerial(pyTransferSerial, pyRspInfo, nRequestID, bIsLast)

# 请求查询银期签约关系响应
cdef extern void OnStaticRspQryAccountregister(CThostFtdcAccountregisterField *pAccountregister, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyAccountregister = None
    if pAccountregister:
        pyAccountregister = pyThostFtdcAccountregisterField()
    
        ###交易日期
        pyAccountregister.TradeDay = pAccountregister.TradeDay
        ###银行编码
        pyAccountregister.BankID = pAccountregister.BankID
        ###银行分支机构编码
        pyAccountregister.BankBranchID = pAccountregister.BankBranchID
        ###银行帐号
        pyAccountregister.BankAccount = pAccountregister.BankAccount
        ###期货公司编码
        pyAccountregister.BrokerID = pAccountregister.BrokerID
        ###期货公司分支机构编码
        pyAccountregister.BrokerBranchID = pAccountregister.BrokerBranchID
        ###投资者帐号
        pyAccountregister.AccountID = pAccountregister.AccountID
        ###证件类型
        pyAccountregister.IdCardType = pAccountregister.IdCardType
        ###证件号码
        pyAccountregister.IdentifiedCardNo = pAccountregister.IdentifiedCardNo
        ###客户姓名
        pyAccountregister.CustomerName = pAccountregister.CustomerName
        ###币种代码
        pyAccountregister.CurrencyID = pAccountregister.CurrencyID
        ###开销户类别
        pyAccountregister.OpenOrDestroy = pAccountregister.OpenOrDestroy
        ###签约日期
        pyAccountregister.RegDate = pAccountregister.RegDate
        ###解约日期
        pyAccountregister.OutDate = pAccountregister.OutDate
        ###交易ID
        pyAccountregister.TID = pAccountregister.TID
        ###客户类型
        pyAccountregister.CustType = pAccountregister.CustType
        ###银行帐号类型
        pyAccountregister.BankAccType = pAccountregister.BankAccType
    
        attr_decode(pyAccountregister)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryAccountregister(pyAccountregister, pyRspInfo, nRequestID, bIsLast)

# 错误应答
cdef extern void OnStaticRspError(CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspError(pyRspInfo, nRequestID, bIsLast)

# 报单通知
cdef extern void OnStaticRtnOrder(CThostFtdcOrderField *pOrder):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyOrder = None
    if pOrder:
        pyOrder = pyThostFtdcOrderField()
    
        ###经纪公司代码
        pyOrder.BrokerID = pOrder.BrokerID
        ###投资者代码
        pyOrder.InvestorID = pOrder.InvestorID
        ###合约代码
        pyOrder.InstrumentID = pOrder.InstrumentID
        ###报单引用
        pyOrder.OrderRef = pOrder.OrderRef
        ###用户代码
        pyOrder.UserID = pOrder.UserID
        ###报单价格条件
        pyOrder.OrderPriceType = pOrder.OrderPriceType
        ###买卖方向
        pyOrder.Direction = pOrder.Direction
        ###组合开平标志
        pyOrder.CombOffsetFlag = pOrder.CombOffsetFlag
        ###组合投机套保标志
        pyOrder.CombHedgeFlag = pOrder.CombHedgeFlag
        ###价格
        pyOrder.LimitPrice = pOrder.LimitPrice
        ###数量
        pyOrder.VolumeTotalOriginal = pOrder.VolumeTotalOriginal
        ###有效期类型
        pyOrder.TimeCondition = pOrder.TimeCondition
        ###GTD日期
        pyOrder.GTDDate = pOrder.GTDDate
        ###成交量类型
        pyOrder.VolumeCondition = pOrder.VolumeCondition
        ###最小成交量
        pyOrder.MinVolume = pOrder.MinVolume
        ###触发条件
        pyOrder.ContingentCondition = pOrder.ContingentCondition
        ###止损价
        pyOrder.StopPrice = pOrder.StopPrice
        ###强平原因
        pyOrder.ForceCloseReason = pOrder.ForceCloseReason
        ###自动挂起标志
        pyOrder.IsAutoSuspend = pOrder.IsAutoSuspend
        ###业务单元
        pyOrder.BusinessUnit = pOrder.BusinessUnit
        ###请求编号
        pyOrder.RequestID = pOrder.RequestID
        ###本地报单编号
        pyOrder.OrderLocalID = pOrder.OrderLocalID
        ###交易所代码
        pyOrder.ExchangeID = pOrder.ExchangeID
        ###会员代码
        pyOrder.ParticipantID = pOrder.ParticipantID
        ###客户代码
        pyOrder.ClientID = pOrder.ClientID
        ###合约在交易所的代码
        pyOrder.ExchangeInstID = pOrder.ExchangeInstID
        ###交易所交易员代码
        pyOrder.TraderID = pOrder.TraderID
        ###安装编号
        pyOrder.InstallID = pOrder.InstallID
        ###报单提交状态
        pyOrder.OrderSubmitStatus = pOrder.OrderSubmitStatus
        ###报单提示序号
        pyOrder.NotifySequence = pOrder.NotifySequence
        ###交易日
        pyOrder.TradingDay = pOrder.TradingDay
        ###结算编号
        pyOrder.SettlementID = pOrder.SettlementID
        ###报单编号
        pyOrder.OrderSysID = pOrder.OrderSysID
        ###报单来源
        pyOrder.OrderSource = pOrder.OrderSource
        ###报单状态
        pyOrder.OrderStatus = pOrder.OrderStatus
        ###报单类型
        pyOrder.OrderType = pOrder.OrderType
        ###今成交数量
        pyOrder.VolumeTraded = pOrder.VolumeTraded
        ###剩余数量
        pyOrder.VolumeTotal = pOrder.VolumeTotal
        ###报单日期
        pyOrder.InsertDate = pOrder.InsertDate
        ###委托时间
        pyOrder.InsertTime = pOrder.InsertTime
        ###激活时间
        pyOrder.ActiveTime = pOrder.ActiveTime
        ###挂起时间
        pyOrder.SuspendTime = pOrder.SuspendTime
        ###最后修改时间
        pyOrder.UpdateTime = pOrder.UpdateTime
        ###撤销时间
        pyOrder.CancelTime = pOrder.CancelTime
        ###最后修改交易所交易员代码
        pyOrder.ActiveTraderID = pOrder.ActiveTraderID
        ###结算会员编号
        pyOrder.ClearingPartID = pOrder.ClearingPartID
        ###序号
        pyOrder.SequenceNo = pOrder.SequenceNo
        ###前置编号
        pyOrder.FrontID = pOrder.FrontID
        ###会话编号
        pyOrder.SessionID = pOrder.SessionID
        ###用户端产品信息
        pyOrder.UserProductInfo = pOrder.UserProductInfo
        ###状态信息
        pyOrder.StatusMsg = pOrder.StatusMsg
        ###用户强评标志
        pyOrder.UserForceClose = pOrder.UserForceClose
        ###操作用户代码
        pyOrder.ActiveUserID = pOrder.ActiveUserID
        ###经纪公司报单编号
        pyOrder.BrokerOrderSeq = pOrder.BrokerOrderSeq
        ###相关报单
        pyOrder.RelativeOrderSysID = pOrder.RelativeOrderSysID
        ###郑商所成交数量
        pyOrder.ZCETotalTradedVolume = pOrder.ZCETotalTradedVolume
        ###互换单标志
        pyOrder.IsSwapOrder = pOrder.IsSwapOrder
    
        attr_decode(pyOrder)
    
    clsTdSpiResponse.OnRtnOrder(pyOrder)

# 成交通知
cdef extern void OnStaticRtnTrade(CThostFtdcTradeField *pTrade):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyTrade = None
    if pTrade:
        pyTrade = pyThostFtdcTradeField()
    
        ###经纪公司代码
        pyTrade.BrokerID = pTrade.BrokerID
        ###投资者代码
        pyTrade.InvestorID = pTrade.InvestorID
        ###合约代码
        pyTrade.InstrumentID = pTrade.InstrumentID
        ###报单引用
        pyTrade.OrderRef = pTrade.OrderRef
        ###用户代码
        pyTrade.UserID = pTrade.UserID
        ###交易所代码
        pyTrade.ExchangeID = pTrade.ExchangeID
        ###成交编号
        pyTrade.TradeID = pTrade.TradeID
        ###买卖方向
        pyTrade.Direction = pTrade.Direction
        ###报单编号
        pyTrade.OrderSysID = pTrade.OrderSysID
        ###会员代码
        pyTrade.ParticipantID = pTrade.ParticipantID
        ###客户代码
        pyTrade.ClientID = pTrade.ClientID
        ###交易角色
        pyTrade.TradingRole = pTrade.TradingRole
        ###合约在交易所的代码
        pyTrade.ExchangeInstID = pTrade.ExchangeInstID
        ###开平标志
        pyTrade.OffsetFlag = pTrade.OffsetFlag
        ###投机套保标志
        pyTrade.HedgeFlag = pTrade.HedgeFlag
        ###价格
        pyTrade.Price = pTrade.Price
        ###数量
        pyTrade.Volume = pTrade.Volume
        ###成交时期
        pyTrade.TradeDate = pTrade.TradeDate
        ###成交时间
        pyTrade.TradeTime = pTrade.TradeTime
        ###成交类型
        pyTrade.TradeType = pTrade.TradeType
        ###成交价来源
        pyTrade.PriceSource = pTrade.PriceSource
        ###交易所交易员代码
        pyTrade.TraderID = pTrade.TraderID
        ###本地报单编号
        pyTrade.OrderLocalID = pTrade.OrderLocalID
        ###结算会员编号
        pyTrade.ClearingPartID = pTrade.ClearingPartID
        ###业务单元
        pyTrade.BusinessUnit = pTrade.BusinessUnit
        ###序号
        pyTrade.SequenceNo = pTrade.SequenceNo
        ###交易日
        pyTrade.TradingDay = pTrade.TradingDay
        ###结算编号
        pyTrade.SettlementID = pTrade.SettlementID
        ###经纪公司报单编号
        pyTrade.BrokerOrderSeq = pTrade.BrokerOrderSeq
        ###成交来源
        pyTrade.TradeSource = pTrade.TradeSource
    
        attr_decode(pyTrade)
    
    clsTdSpiResponse.OnRtnTrade(pyTrade)

# 报单录入错误回报
cdef extern void OnStaticErrRtnOrderInsert(CThostFtdcInputOrderField *pInputOrder, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputOrder = None
    if pInputOrder:
        pyInputOrder = pyThostFtdcInputOrderField()
    
        ###经纪公司代码
        pyInputOrder.BrokerID = pInputOrder.BrokerID
        ###投资者代码
        pyInputOrder.InvestorID = pInputOrder.InvestorID
        ###合约代码
        pyInputOrder.InstrumentID = pInputOrder.InstrumentID
        ###报单引用
        pyInputOrder.OrderRef = pInputOrder.OrderRef
        ###用户代码
        pyInputOrder.UserID = pInputOrder.UserID
        ###报单价格条件
        pyInputOrder.OrderPriceType = pInputOrder.OrderPriceType
        ###买卖方向
        pyInputOrder.Direction = pInputOrder.Direction
        ###组合开平标志
        pyInputOrder.CombOffsetFlag = pInputOrder.CombOffsetFlag
        ###组合投机套保标志
        pyInputOrder.CombHedgeFlag = pInputOrder.CombHedgeFlag
        ###价格
        pyInputOrder.LimitPrice = pInputOrder.LimitPrice
        ###数量
        pyInputOrder.VolumeTotalOriginal = pInputOrder.VolumeTotalOriginal
        ###有效期类型
        pyInputOrder.TimeCondition = pInputOrder.TimeCondition
        ###GTD日期
        pyInputOrder.GTDDate = pInputOrder.GTDDate
        ###成交量类型
        pyInputOrder.VolumeCondition = pInputOrder.VolumeCondition
        ###最小成交量
        pyInputOrder.MinVolume = pInputOrder.MinVolume
        ###触发条件
        pyInputOrder.ContingentCondition = pInputOrder.ContingentCondition
        ###止损价
        pyInputOrder.StopPrice = pInputOrder.StopPrice
        ###强平原因
        pyInputOrder.ForceCloseReason = pInputOrder.ForceCloseReason
        ###自动挂起标志
        pyInputOrder.IsAutoSuspend = pInputOrder.IsAutoSuspend
        ###业务单元
        pyInputOrder.BusinessUnit = pInputOrder.BusinessUnit
        ###请求编号
        pyInputOrder.RequestID = pInputOrder.RequestID
        ###用户强评标志
        pyInputOrder.UserForceClose = pInputOrder.UserForceClose
        ###互换单标志
        pyInputOrder.IsSwapOrder = pInputOrder.IsSwapOrder
    
        attr_decode(pyInputOrder)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnOrderInsert(pyInputOrder, pyRspInfo)

# 报单操作错误回报
cdef extern void OnStaticErrRtnOrderAction(CThostFtdcOrderActionField *pOrderAction, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyOrderAction = None
    if  pOrderAction:
        pyOrderAction = pyThostFtdcOrderActionField()
    
        ###经纪公司代码
        pyOrderAction.BrokerID = pOrderAction.BrokerID
        ###投资者代码
        pyOrderAction.InvestorID = pOrderAction.InvestorID
        ###报单操作引用
        pyOrderAction.OrderActionRef = pOrderAction.OrderActionRef
        ###报单引用
        pyOrderAction.OrderRef = pOrderAction.OrderRef
        ###请求编号
        pyOrderAction.RequestID = pOrderAction.RequestID
        ###前置编号
        pyOrderAction.FrontID = pOrderAction.FrontID
        ###会话编号
        pyOrderAction.SessionID = pOrderAction.SessionID
        ###交易所代码
        pyOrderAction.ExchangeID = pOrderAction.ExchangeID
        ###报单编号
        pyOrderAction.OrderSysID = pOrderAction.OrderSysID
        ###操作标志
        pyOrderAction.ActionFlag = pOrderAction.ActionFlag
        ###价格
        pyOrderAction.LimitPrice = pOrderAction.LimitPrice
        ###数量变化
        pyOrderAction.VolumeChange = pOrderAction.VolumeChange
        ###操作日期
        pyOrderAction.ActionDate = pOrderAction.ActionDate
        ###操作时间
        pyOrderAction.ActionTime = pOrderAction.ActionTime
        ###交易所交易员代码
        pyOrderAction.TraderID = pOrderAction.TraderID
        ###安装编号
        pyOrderAction.InstallID = pOrderAction.InstallID
        ###本地报单编号
        pyOrderAction.OrderLocalID = pOrderAction.OrderLocalID
        ###操作本地编号
        pyOrderAction.ActionLocalID = pOrderAction.ActionLocalID
        ###会员代码
        pyOrderAction.ParticipantID = pOrderAction.ParticipantID
        ###客户代码
        pyOrderAction.ClientID = pOrderAction.ClientID
        ###业务单元
        pyOrderAction.BusinessUnit = pOrderAction.BusinessUnit
        ###报单操作状态
        pyOrderAction.OrderActionStatus = pOrderAction.OrderActionStatus
        ###用户代码
        pyOrderAction.UserID = pOrderAction.UserID
        ###状态信息
        pyOrderAction.StatusMsg = pOrderAction.StatusMsg
        ###合约代码
        pyOrderAction.InstrumentID = pOrderAction.InstrumentID
    
        attr_decode(pyOrderAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnOrderAction(pyOrderAction, pyRspInfo)

# 合约交易状态通知
cdef extern void OnStaticRtnInstrumentStatus(CThostFtdcInstrumentStatusField *pInstrumentStatus):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInstrumentStatus = None
    if pInstrumentStatus:
        pyInstrumentStatus = pyThostFtdcInstrumentStatusField()
    
        ###交易所代码
        pyInstrumentStatus.ExchangeID = pInstrumentStatus.ExchangeID
        ###合约在交易所的代码
        pyInstrumentStatus.ExchangeInstID = pInstrumentStatus.ExchangeInstID
        ###结算组代码
        pyInstrumentStatus.SettlementGroupID = pInstrumentStatus.SettlementGroupID
        ###合约代码
        pyInstrumentStatus.InstrumentID = pInstrumentStatus.InstrumentID
        ###合约交易状态
        pyInstrumentStatus.InstrumentStatus = pInstrumentStatus.InstrumentStatus
        ###交易阶段编号
        pyInstrumentStatus.TradingSegmentSN = pInstrumentStatus.TradingSegmentSN
        ###进入本状态时间
        pyInstrumentStatus.EnterTime = pInstrumentStatus.EnterTime
        ###进入本状态原因
        pyInstrumentStatus.EnterReason = pInstrumentStatus.EnterReason
    
        attr_decode(pyInstrumentStatus)
    
    clsTdSpiResponse.OnRtnInstrumentStatus(pyInstrumentStatus)

# 交易通知
cdef extern void OnStaticRtnTradingNotice(CThostFtdcTradingNoticeInfoField *pTradingNoticeInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyTradingNoticeInfo = None
    if pTradingNoticeInfo:
        pyTradingNoticeInfo = pyThostFtdcTradingNoticeInfoField()
    
        ###经纪公司代码
        pyTradingNoticeInfo.BrokerID = pTradingNoticeInfo.BrokerID
        ###投资者代码
        pyTradingNoticeInfo.InvestorID = pTradingNoticeInfo.InvestorID
        ###发送时间
        pyTradingNoticeInfo.SendTime = pTradingNoticeInfo.SendTime
        ###消息正文
        pyTradingNoticeInfo.FieldContent = pTradingNoticeInfo.FieldContent
        ###序列系列号
        pyTradingNoticeInfo.SequenceSeries = pTradingNoticeInfo.SequenceSeries
        ###序列号
        pyTradingNoticeInfo.SequenceNo = pTradingNoticeInfo.SequenceNo
    
    clsTdSpiResponse.OnRtnTradingNotice(pyTradingNoticeInfo)

# 提示条件单校验错误
cdef extern void OnStaticRtnErrorConditionalOrder(CThostFtdcErrorConditionalOrderField *pErrorConditionalOrder):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyErrorConditionalOrder = None
    if pErrorConditionalOrder:
        pyErrorConditionalOrder = pyThostFtdcErrorConditionalOrderField()
    
        ###经纪公司代码
        pyErrorConditionalOrder.BrokerID = pErrorConditionalOrder.BrokerID
        ###投资者代码
        pyErrorConditionalOrder.InvestorID = pErrorConditionalOrder.InvestorID
        ###合约代码
        pyErrorConditionalOrder.InstrumentID = pErrorConditionalOrder.InstrumentID
        ###报单引用
        pyErrorConditionalOrder.OrderRef = pErrorConditionalOrder.OrderRef
        ###用户代码
        pyErrorConditionalOrder.UserID = pErrorConditionalOrder.UserID
        ###报单价格条件
        pyErrorConditionalOrder.OrderPriceType = pErrorConditionalOrder.OrderPriceType
        ###买卖方向
        pyErrorConditionalOrder.Direction = pErrorConditionalOrder.Direction
        ###组合开平标志
        pyErrorConditionalOrder.CombOffsetFlag = pErrorConditionalOrder.CombOffsetFlag
        ###组合投机套保标志
        pyErrorConditionalOrder.CombHedgeFlag = pErrorConditionalOrder.CombHedgeFlag
        ###价格
        pyErrorConditionalOrder.LimitPrice = pErrorConditionalOrder.LimitPrice
        ###数量
        pyErrorConditionalOrder.VolumeTotalOriginal = pErrorConditionalOrder.VolumeTotalOriginal
        ###有效期类型
        pyErrorConditionalOrder.TimeCondition = pErrorConditionalOrder.TimeCondition
        ###GTD日期
        pyErrorConditionalOrder.GTDDate = pErrorConditionalOrder.GTDDate
        ###成交量类型
        pyErrorConditionalOrder.VolumeCondition = pErrorConditionalOrder.VolumeCondition
        ###最小成交量
        pyErrorConditionalOrder.MinVolume = pErrorConditionalOrder.MinVolume
        ###触发条件
        pyErrorConditionalOrder.ContingentCondition = pErrorConditionalOrder.ContingentCondition
        ###止损价
        pyErrorConditionalOrder.StopPrice = pErrorConditionalOrder.StopPrice
        ###强平原因
        pyErrorConditionalOrder.ForceCloseReason = pErrorConditionalOrder.ForceCloseReason
        ###自动挂起标志
        pyErrorConditionalOrder.IsAutoSuspend = pErrorConditionalOrder.IsAutoSuspend
        ###业务单元
        pyErrorConditionalOrder.BusinessUnit = pErrorConditionalOrder.BusinessUnit
        ###请求编号
        pyErrorConditionalOrder.RequestID = pErrorConditionalOrder.RequestID
        ###本地报单编号
        pyErrorConditionalOrder.OrderLocalID = pErrorConditionalOrder.OrderLocalID
        ###交易所代码
        pyErrorConditionalOrder.ExchangeID = pErrorConditionalOrder.ExchangeID
        ###会员代码
        pyErrorConditionalOrder.ParticipantID = pErrorConditionalOrder.ParticipantID
        ###客户代码
        pyErrorConditionalOrder.ClientID = pErrorConditionalOrder.ClientID
        ###合约在交易所的代码
        pyErrorConditionalOrder.ExchangeInstID = pErrorConditionalOrder.ExchangeInstID
        ###交易所交易员代码
        pyErrorConditionalOrder.TraderID = pErrorConditionalOrder.TraderID
        ###安装编号
        pyErrorConditionalOrder.InstallID = pErrorConditionalOrder.InstallID
        ###报单提交状态
        pyErrorConditionalOrder.OrderSubmitStatus = pErrorConditionalOrder.OrderSubmitStatus
        ###报单提示序号
        pyErrorConditionalOrder.NotifySequence = pErrorConditionalOrder.NotifySequence
        ###交易日
        pyErrorConditionalOrder.TradingDay = pErrorConditionalOrder.TradingDay
        ###结算编号
        pyErrorConditionalOrder.SettlementID = pErrorConditionalOrder.SettlementID
        ###报单编号
        pyErrorConditionalOrder.OrderSysID = pErrorConditionalOrder.OrderSysID
        ###报单来源
        pyErrorConditionalOrder.OrderSource = pErrorConditionalOrder.OrderSource
        ###报单状态
        pyErrorConditionalOrder.OrderStatus = pErrorConditionalOrder.OrderStatus
        ###报单类型
        pyErrorConditionalOrder.OrderType = pErrorConditionalOrder.OrderType
        ###今成交数量
        pyErrorConditionalOrder.VolumeTraded = pErrorConditionalOrder.VolumeTraded
        ###剩余数量
        pyErrorConditionalOrder.VolumeTotal = pErrorConditionalOrder.VolumeTotal
        ###报单日期
        pyErrorConditionalOrder.InsertDate = pErrorConditionalOrder.InsertDate
        ###委托时间
        pyErrorConditionalOrder.InsertTime = pErrorConditionalOrder.InsertTime
        ###激活时间
        pyErrorConditionalOrder.ActiveTime = pErrorConditionalOrder.ActiveTime
        ###挂起时间
        pyErrorConditionalOrder.SuspendTime = pErrorConditionalOrder.SuspendTime
        ###最后修改时间
        pyErrorConditionalOrder.UpdateTime = pErrorConditionalOrder.UpdateTime
        ###撤销时间
        pyErrorConditionalOrder.CancelTime = pErrorConditionalOrder.CancelTime
        ###最后修改交易所交易员代码
        pyErrorConditionalOrder.ActiveTraderID = pErrorConditionalOrder.ActiveTraderID
        ###结算会员编号
        pyErrorConditionalOrder.ClearingPartID = pErrorConditionalOrder.ClearingPartID
        ###序号
        pyErrorConditionalOrder.SequenceNo = pErrorConditionalOrder.SequenceNo
        ###前置编号
        pyErrorConditionalOrder.FrontID = pErrorConditionalOrder.FrontID
        ###会话编号
        pyErrorConditionalOrder.SessionID = pErrorConditionalOrder.SessionID
        ###用户端产品信息
        pyErrorConditionalOrder.UserProductInfo = pErrorConditionalOrder.UserProductInfo
        ###状态信息
        pyErrorConditionalOrder.StatusMsg = pErrorConditionalOrder.StatusMsg
        ###用户强评标志
        pyErrorConditionalOrder.UserForceClose = pErrorConditionalOrder.UserForceClose
        ###操作用户代码
        pyErrorConditionalOrder.ActiveUserID = pErrorConditionalOrder.ActiveUserID
        ###经纪公司报单编号
        pyErrorConditionalOrder.BrokerOrderSeq = pErrorConditionalOrder.BrokerOrderSeq
        ###相关报单
        pyErrorConditionalOrder.RelativeOrderSysID = pErrorConditionalOrder.RelativeOrderSysID
        ###郑商所成交数量
        pyErrorConditionalOrder.ZCETotalTradedVolume = pErrorConditionalOrder.ZCETotalTradedVolume
        ###错误代码
        pyErrorConditionalOrder.ErrorID = pErrorConditionalOrder.ErrorID
        ###错误信息
        pyErrorConditionalOrder.ErrorMsg = pErrorConditionalOrder.ErrorMsg
        ###互换单标志
        pyErrorConditionalOrder.IsSwapOrder = pErrorConditionalOrder.IsSwapOrder
    
        attr_decode(pyErrorConditionalOrder)
    
    clsTdSpiResponse.OnRtnErrorConditionalOrder(pyErrorConditionalOrder)

# 执行宣告通知
cdef extern void OnStaticRtnExecOrder(CThostFtdcExecOrderField *pExecOrder):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyExecOrder = None
    if pExecOrder:
        pyExecOrder = pyThostFtdcExecOrderField()
    
        ###经纪公司代码
        pyExecOrder.BrokerID = pExecOrder.BrokerID
        ###投资者代码
        pyExecOrder.InvestorID = pExecOrder.InvestorID
        ###合约代码
        pyExecOrder.InstrumentID = pExecOrder.InstrumentID
        ###执行宣告引用
        pyExecOrder.ExecOrderRef = pExecOrder.ExecOrderRef
        ###用户代码
        pyExecOrder.UserID = pExecOrder.UserID
        ###数量
        pyExecOrder.Volume = pExecOrder.Volume
        ###请求编号
        pyExecOrder.RequestID = pExecOrder.RequestID
        ###业务单元
        pyExecOrder.BusinessUnit = pExecOrder.BusinessUnit
        ###开平标志
        pyExecOrder.OffsetFlag = pExecOrder.OffsetFlag
        ###投机套保标志
        pyExecOrder.HedgeFlag = pExecOrder.HedgeFlag
        ###执行类型
        pyExecOrder.ActionType = pExecOrder.ActionType
        ###保留头寸申请的持仓方向
        pyExecOrder.PosiDirection = pExecOrder.PosiDirection
        ###期权行权后是否保留期货头寸的标记
        pyExecOrder.ReservePositionFlag = pExecOrder.ReservePositionFlag
        ###期权行权后生成的头寸是否自动平仓
        pyExecOrder.CloseFlag = pExecOrder.CloseFlag
        ###本地执行宣告编号
        pyExecOrder.ExecOrderLocalID = pExecOrder.ExecOrderLocalID
        ###交易所代码
        pyExecOrder.ExchangeID = pExecOrder.ExchangeID
        ###会员代码
        pyExecOrder.ParticipantID = pExecOrder.ParticipantID
        ###客户代码
        pyExecOrder.ClientID = pExecOrder.ClientID
        ###合约在交易所的代码
        pyExecOrder.ExchangeInstID = pExecOrder.ExchangeInstID
        ###交易所交易员代码
        pyExecOrder.TraderID = pExecOrder.TraderID
        ###安装编号
        pyExecOrder.InstallID = pExecOrder.InstallID
        ###执行宣告提交状态
        pyExecOrder.OrderSubmitStatus = pExecOrder.OrderSubmitStatus
        ###报单提示序号
        pyExecOrder.NotifySequence = pExecOrder.NotifySequence
        ###交易日
        pyExecOrder.TradingDay = pExecOrder.TradingDay
        ###结算编号
        pyExecOrder.SettlementID = pExecOrder.SettlementID
        ###执行宣告编号
        pyExecOrder.ExecOrderSysID = pExecOrder.ExecOrderSysID
        ###报单日期
        pyExecOrder.InsertDate = pExecOrder.InsertDate
        ###插入时间
        pyExecOrder.InsertTime = pExecOrder.InsertTime
        ###撤销时间
        pyExecOrder.CancelTime = pExecOrder.CancelTime
        ###执行结果
        pyExecOrder.ExecResult = pExecOrder.ExecResult
        ###结算会员编号
        pyExecOrder.ClearingPartID = pExecOrder.ClearingPartID
        ###序号
        pyExecOrder.SequenceNo = pExecOrder.SequenceNo
        ###前置编号
        pyExecOrder.FrontID = pExecOrder.FrontID
        ###会话编号
        pyExecOrder.SessionID = pExecOrder.SessionID
        ###用户端产品信息
        pyExecOrder.UserProductInfo = pExecOrder.UserProductInfo
        ###状态信息
        pyExecOrder.StatusMsg = pExecOrder.StatusMsg
        ###操作用户代码
        pyExecOrder.ActiveUserID = pExecOrder.ActiveUserID
        ###经纪公司报单编号
        pyExecOrder.BrokerExecOrderSeq = pExecOrder.BrokerExecOrderSeq
    
        attr_decode(pyExecOrder)
    
    clsTdSpiResponse.OnRtnExecOrder(pyExecOrder)

# 执行宣告录入错误回报
cdef extern void OnStaticErrRtnExecOrderInsert(CThostFtdcInputExecOrderField *pInputExecOrder, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputExecOrder = None
    if pInputExecOrder:
        pyInputExecOrder = pyThostFtdcInputExecOrderField()
    
        ###经纪公司代码
        pyInputExecOrder.BrokerID = pInputExecOrder.BrokerID
        ###投资者代码
        pyInputExecOrder.InvestorID = pInputExecOrder.InvestorID
        ###合约代码
        pyInputExecOrder.InstrumentID = pInputExecOrder.InstrumentID
        ###执行宣告引用
        pyInputExecOrder.ExecOrderRef = pInputExecOrder.ExecOrderRef
        ###用户代码
        pyInputExecOrder.UserID = pInputExecOrder.UserID
        ###数量
        pyInputExecOrder.Volume = pInputExecOrder.Volume
        ###请求编号
        pyInputExecOrder.RequestID = pInputExecOrder.RequestID
        ###业务单元
        pyInputExecOrder.BusinessUnit = pInputExecOrder.BusinessUnit
        ###开平标志
        pyInputExecOrder.OffsetFlag = pInputExecOrder.OffsetFlag
        ###投机套保标志
        pyInputExecOrder.HedgeFlag = pInputExecOrder.HedgeFlag
        ###执行类型
        pyInputExecOrder.ActionType = pInputExecOrder.ActionType
        ###保留头寸申请的持仓方向
        pyInputExecOrder.PosiDirection = pInputExecOrder.PosiDirection
        ###期权行权后是否保留期货头寸的标记
        pyInputExecOrder.ReservePositionFlag = pInputExecOrder.ReservePositionFlag
        ###期权行权后生成的头寸是否自动平仓
        pyInputExecOrder.CloseFlag = pInputExecOrder.CloseFlag
    
        attr_decode(pyInputExecOrder)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnExecOrderInsert(pyInputExecOrder, pyRspInfo)

# 执行宣告操作错误回报
cdef extern void OnStaticErrRtnExecOrderAction(CThostFtdcExecOrderActionField *pExecOrderAction, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyExecOrderAction = None
    if pExecOrderAction:
        pyExecOrderAction = pyThostFtdcExecOrderActionField()
    
        ###经纪公司代码
        pyExecOrderAction.BrokerID = pExecOrderAction.BrokerID
        ###投资者代码
        pyExecOrderAction.InvestorID = pExecOrderAction.InvestorID
        ###执行宣告操作引用
        pyExecOrderAction.ExecOrderActionRef = pExecOrderAction.ExecOrderActionRef
        ###执行宣告引用
        pyExecOrderAction.ExecOrderRef = pExecOrderAction.ExecOrderRef
        ###请求编号
        pyExecOrderAction.RequestID = pExecOrderAction.RequestID
        ###前置编号
        pyExecOrderAction.FrontID = pExecOrderAction.FrontID
        ###会话编号
        pyExecOrderAction.SessionID = pExecOrderAction.SessionID
        ###交易所代码
        pyExecOrderAction.ExchangeID = pExecOrderAction.ExchangeID
        ###执行宣告操作编号
        pyExecOrderAction.ExecOrderSysID = pExecOrderAction.ExecOrderSysID
        ###操作标志
        pyExecOrderAction.ActionFlag = pExecOrderAction.ActionFlag
        ###操作日期
        pyExecOrderAction.ActionDate = pExecOrderAction.ActionDate
        ###操作时间
        pyExecOrderAction.ActionTime = pExecOrderAction.ActionTime
        ###交易所交易员代码
        pyExecOrderAction.TraderID = pExecOrderAction.TraderID
        ###安装编号
        pyExecOrderAction.InstallID = pExecOrderAction.InstallID
        ###本地执行宣告编号
        pyExecOrderAction.ExecOrderLocalID = pExecOrderAction.ExecOrderLocalID
        ###操作本地编号
        pyExecOrderAction.ActionLocalID = pExecOrderAction.ActionLocalID
        ###会员代码
        pyExecOrderAction.ParticipantID = pExecOrderAction.ParticipantID
        ###客户代码
        pyExecOrderAction.ClientID = pExecOrderAction.ClientID
        ###业务单元
        pyExecOrderAction.BusinessUnit = pExecOrderAction.BusinessUnit
        ###报单操作状态
        pyExecOrderAction.OrderActionStatus = pExecOrderAction.OrderActionStatus
        ###用户代码
        pyExecOrderAction.UserID = pExecOrderAction.UserID
        ###执行类型
        pyExecOrderAction.ActionType = pExecOrderAction.ActionType
        ###状态信息
        pyExecOrderAction.StatusMsg = pExecOrderAction.StatusMsg
        ###合约代码
        pyExecOrderAction.InstrumentID = pExecOrderAction.InstrumentID
    
        attr_decode(pyExecOrderAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnExecOrderAction(pyExecOrderAction, pyRspInfo)

# 询价录入错误回报
cdef extern void OnStaticErrRtnForQuoteInsert(CThostFtdcInputForQuoteField *pInputForQuote, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputForQuote = None
    if pInputForQuote:
        pyInputForQuote = pyThostFtdcInputForQuoteField()
    
        ###经纪公司代码
        pyInputForQuote.BrokerID = pInputForQuote.BrokerID
        ###投资者代码
        pyInputForQuote.InvestorID = pInputForQuote.InvestorID
        ###合约代码
        pyInputForQuote.InstrumentID = pInputForQuote.InstrumentID
        ###询价引用
        pyInputForQuote.ForQuoteRef = pInputForQuote.ForQuoteRef
        ###用户代码
        pyInputForQuote.UserID = pInputForQuote.UserID
    
        attr_decode(pyInputForQuote)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnForQuoteInsert(pyInputForQuote, pyRspInfo)

# 报价通知
cdef extern void OnStaticRtnQuote(CThostFtdcQuoteField *pQuote):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyQuote = None
    if pQuote:
        pyQuote = pyThostFtdcQuoteField()
    
        ###经纪公司代码
        pyQuote.BrokerID = pQuote.BrokerID
        ###投资者代码
        pyQuote.InvestorID = pQuote.InvestorID
        ###合约代码
        pyQuote.InstrumentID = pQuote.InstrumentID
        ###报价引用
        pyQuote.QuoteRef = pQuote.QuoteRef
        ###用户代码
        pyQuote.UserID = pQuote.UserID
        ###卖价格
        pyQuote.AskPrice = pQuote.AskPrice
        ###买价格
        pyQuote.BidPrice = pQuote.BidPrice
        ###卖数量
        pyQuote.AskVolume = pQuote.AskVolume
        ###买数量
        pyQuote.BidVolume = pQuote.BidVolume
        ###请求编号
        pyQuote.RequestID = pQuote.RequestID
        ###业务单元
        pyQuote.BusinessUnit = pQuote.BusinessUnit
        ###卖开平标志
        pyQuote.AskOffsetFlag = pQuote.AskOffsetFlag
        ###买开平标志
        pyQuote.BidOffsetFlag = pQuote.BidOffsetFlag
        ###卖投机套保标志
        pyQuote.AskHedgeFlag = pQuote.AskHedgeFlag
        ###买投机套保标志
        pyQuote.BidHedgeFlag = pQuote.BidHedgeFlag
        ###本地报价编号
        pyQuote.QuoteLocalID = pQuote.QuoteLocalID
        ###交易所代码
        pyQuote.ExchangeID = pQuote.ExchangeID
        ###会员代码
        pyQuote.ParticipantID = pQuote.ParticipantID
        ###客户代码
        pyQuote.ClientID = pQuote.ClientID
        ###合约在交易所的代码
        pyQuote.ExchangeInstID = pQuote.ExchangeInstID
        ###交易所交易员代码
        pyQuote.TraderID = pQuote.TraderID
        ###安装编号
        pyQuote.InstallID = pQuote.InstallID
        ###报价提示序号
        pyQuote.NotifySequence = pQuote.NotifySequence
        ###报价提交状态
        pyQuote.OrderSubmitStatus = pQuote.OrderSubmitStatus
        ###交易日
        pyQuote.TradingDay = pQuote.TradingDay
        ###结算编号
        pyQuote.SettlementID = pQuote.SettlementID
        ###报价编号
        pyQuote.QuoteSysID = pQuote.QuoteSysID
        ###报单日期
        pyQuote.InsertDate = pQuote.InsertDate
        ###插入时间
        pyQuote.InsertTime = pQuote.InsertTime
        ###撤销时间
        pyQuote.CancelTime = pQuote.CancelTime
        ###报价状态
        pyQuote.QuoteStatus = pQuote.QuoteStatus
        ###结算会员编号
        pyQuote.ClearingPartID = pQuote.ClearingPartID
        ###序号
        pyQuote.SequenceNo = pQuote.SequenceNo
        ###卖方报单编号
        pyQuote.AskOrderSysID = pQuote.AskOrderSysID
        ###买方报单编号
        pyQuote.BidOrderSysID = pQuote.BidOrderSysID
        ###前置编号
        pyQuote.FrontID = pQuote.FrontID
        ###会话编号
        pyQuote.SessionID = pQuote.SessionID
        ###用户端产品信息
        pyQuote.UserProductInfo = pQuote.UserProductInfo
        ###状态信息
        pyQuote.StatusMsg = pQuote.StatusMsg
        ###操作用户代码
        pyQuote.ActiveUserID = pQuote.ActiveUserID
        ###经纪公司报价编号
        pyQuote.BrokerQuoteSeq = pQuote.BrokerQuoteSeq
        ###衍生卖报单引用
        pyQuote.AskOrderRef = pQuote.AskOrderRef
        ###衍生买报单引用
        pyQuote.BidOrderRef = pQuote.BidOrderRef
        ###应价编号
        pyQuote.ForQuoteSysID = pQuote.ForQuoteSysID
    
        attr_decode(pyQuote)
    
    clsTdSpiResponse.OnRtnQuote(pyQuote)

# 报价录入错误回报
cdef extern void OnStaticErrRtnQuoteInsert(CThostFtdcInputQuoteField *pInputQuote, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputQuote = None
    if pInputQuote:
        pyInputQuote = pyThostFtdcInputQuoteField()
    
        ###经纪公司代码
        pyInputQuote.BrokerID = pInputQuote.BrokerID
        ###投资者代码
        pyInputQuote.InvestorID = pInputQuote.InvestorID
        ###合约代码
        pyInputQuote.InstrumentID = pInputQuote.InstrumentID
        ###报价引用
        pyInputQuote.QuoteRef = pInputQuote.QuoteRef
        ###用户代码
        pyInputQuote.UserID = pInputQuote.UserID
        ###卖价格
        pyInputQuote.AskPrice = pInputQuote.AskPrice
        ###买价格
        pyInputQuote.BidPrice = pInputQuote.BidPrice
        ###卖数量
        pyInputQuote.AskVolume = pInputQuote.AskVolume
        ###买数量
        pyInputQuote.BidVolume = pInputQuote.BidVolume
        ###请求编号
        pyInputQuote.RequestID = pInputQuote.RequestID
        ###业务单元
        pyInputQuote.BusinessUnit = pInputQuote.BusinessUnit
        ###卖开平标志
        pyInputQuote.AskOffsetFlag = pInputQuote.AskOffsetFlag
        ###买开平标志
        pyInputQuote.BidOffsetFlag = pInputQuote.BidOffsetFlag
        ###卖投机套保标志
        pyInputQuote.AskHedgeFlag = pInputQuote.AskHedgeFlag
        ###买投机套保标志
        pyInputQuote.BidHedgeFlag = pInputQuote.BidHedgeFlag
        ###衍生卖报单引用
        pyInputQuote.AskOrderRef = pInputQuote.AskOrderRef
        ###衍生买报单引用
        pyInputQuote.BidOrderRef = pInputQuote.BidOrderRef
        ###应价编号
        pyInputQuote.ForQuoteSysID = pInputQuote.ForQuoteSysID
    
        attr_decode(pyInputQuote)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnQuoteInsert(pyInputQuote, pyRspInfo)

# 报价操作错误回报
cdef extern void OnStaticErrRtnQuoteAction(CThostFtdcQuoteActionField *pQuoteAction, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyQuoteAction = None
    if pQuoteAction:
        pyQuoteAction = pyThostFtdcQuoteActionField()
    
        ###经纪公司代码
        pyQuoteAction.BrokerID = pQuoteAction.BrokerID
        ###投资者代码
        pyQuoteAction.InvestorID = pQuoteAction.InvestorID
        ###报价操作引用
        pyQuoteAction.QuoteActionRef = pQuoteAction.QuoteActionRef
        ###报价引用
        pyQuoteAction.QuoteRef = pQuoteAction.QuoteRef
        ###请求编号
        pyQuoteAction.RequestID = pQuoteAction.RequestID
        ###前置编号
        pyQuoteAction.FrontID = pQuoteAction.FrontID
        ###会话编号
        pyQuoteAction.SessionID = pQuoteAction.SessionID
        ###交易所代码
        pyQuoteAction.ExchangeID = pQuoteAction.ExchangeID
        ###报价操作编号
        pyQuoteAction.QuoteSysID = pQuoteAction.QuoteSysID
        ###操作标志
        pyQuoteAction.ActionFlag = pQuoteAction.ActionFlag
        ###操作日期
        pyQuoteAction.ActionDate = pQuoteAction.ActionDate
        ###操作时间
        pyQuoteAction.ActionTime = pQuoteAction.ActionTime
        ###交易所交易员代码
        pyQuoteAction.TraderID = pQuoteAction.TraderID
        ###安装编号
        pyQuoteAction.InstallID = pQuoteAction.InstallID
        ###本地报价编号
        pyQuoteAction.QuoteLocalID = pQuoteAction.QuoteLocalID
        ###操作本地编号
        pyQuoteAction.ActionLocalID = pQuoteAction.ActionLocalID
        ###会员代码
        pyQuoteAction.ParticipantID = pQuoteAction.ParticipantID
        ###客户代码
        pyQuoteAction.ClientID = pQuoteAction.ClientID
        ###业务单元
        pyQuoteAction.BusinessUnit = pQuoteAction.BusinessUnit
        ###报单操作状态
        pyQuoteAction.OrderActionStatus = pQuoteAction.OrderActionStatus
        ###用户代码
        pyQuoteAction.UserID = pQuoteAction.UserID
        ###状态信息
        pyQuoteAction.StatusMsg = pQuoteAction.StatusMsg
        ###合约代码
        pyQuoteAction.InstrumentID = pQuoteAction.InstrumentID
    
        attr_decode(pyQuoteAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnQuoteAction(pyQuoteAction, pyRspInfo)

# 询价通知
cdef extern void OnStaticRtnForQuoteRsp(CThostFtdcForQuoteRspField *pForQuoteRsp):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyForQuoteRsp = None
    if pForQuoteRsp:
        pyForQuoteRsp = pyThostFtdcForQuoteRspField()
    
        ###交易日
        pyForQuoteRsp.TradingDay = pForQuoteRsp.TradingDay
        ###合约代码
        pyForQuoteRsp.InstrumentID = pForQuoteRsp.InstrumentID
        ###询价编号
        pyForQuoteRsp.ForQuoteSysID = pForQuoteRsp.ForQuoteSysID
        ###询价时间
        pyForQuoteRsp.ForQuoteTime = pForQuoteRsp.ForQuoteTime
        ###业务日期
        pyForQuoteRsp.ActionDay = pForQuoteRsp.ActionDay
        ###交易所代码
        pyForQuoteRsp.ExchangeID = pForQuoteRsp.ExchangeID
    
        attr_decode(pyForQuoteRsp)
    
    clsTdSpiResponse.OnRtnForQuoteRsp(pyForQuoteRsp)

# 保证金监控中心用户令牌
cdef extern void OnStaticRtnCFMMCTradingAccountToken(CThostFtdcCFMMCTradingAccountTokenField *pCFMMCTradingAccountToken):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyCFMMCTradingAccountToken = None
    if pCFMMCTradingAccountToken:
        pyCFMMCTradingAccountToken = pyThostFtdcCFMMCTradingAccountTokenField()
    
        ###经纪公司代码
        pyCFMMCTradingAccountToken.BrokerID = pCFMMCTradingAccountToken.BrokerID
        ###经纪公司统一编码
        pyCFMMCTradingAccountToken.ParticipantID = pCFMMCTradingAccountToken.ParticipantID
        ###投资者帐号
        pyCFMMCTradingAccountToken.AccountID = pCFMMCTradingAccountToken.AccountID
        ###密钥编号
        pyCFMMCTradingAccountToken.KeyID = pCFMMCTradingAccountToken.KeyID
        ###动态令牌
        pyCFMMCTradingAccountToken.Token = pCFMMCTradingAccountToken.Token
    
        attr_decode(pyCFMMCTradingAccountToken)
    
    clsTdSpiResponse.OnRtnCFMMCTradingAccountToken(pyCFMMCTradingAccountToken)

# 申请组合通知
cdef extern void OnStaticRtnCombAction(CThostFtdcCombActionField *pCombAction):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyCombAction = None
    if pCombAction:
        pyCombAction = pyThostFtdcCombActionField()
    
        ###经纪公司代码
        pyCombAction.BrokerID = pCombAction.BrokerID
        ###投资者代码
        pyCombAction.InvestorID = pCombAction.InvestorID
        ###合约代码
        pyCombAction.InstrumentID = pCombAction.InstrumentID
        ###组合引用
        pyCombAction.CombActionRef = pCombAction.CombActionRef
        ###用户代码
        pyCombAction.UserID = pCombAction.UserID
        ###买卖方向
        pyCombAction.Direction = pCombAction.Direction
        ###数量
        pyCombAction.Volume = pCombAction.Volume
        ###组合指令方向
        pyCombAction.CombDirection = pCombAction.CombDirection
        ###投机套保标志
        pyCombAction.HedgeFlag = pCombAction.HedgeFlag
        ###本地申请组合编号
        pyCombAction.ActionLocalID = pCombAction.ActionLocalID
        ###交易所代码
        pyCombAction.ExchangeID = pCombAction.ExchangeID
        ###会员代码
        pyCombAction.ParticipantID = pCombAction.ParticipantID
        ###客户代码
        pyCombAction.ClientID = pCombAction.ClientID
        ###合约在交易所的代码
        pyCombAction.ExchangeInstID = pCombAction.ExchangeInstID
        ###交易所交易员代码
        pyCombAction.TraderID = pCombAction.TraderID
        ###安装编号
        pyCombAction.InstallID = pCombAction.InstallID
        ###组合状态
        pyCombAction.ActionStatus = pCombAction.ActionStatus
        ###报单提示序号
        pyCombAction.NotifySequence = pCombAction.NotifySequence
        ###交易日
        pyCombAction.TradingDay = pCombAction.TradingDay
        ###结算编号
        pyCombAction.SettlementID = pCombAction.SettlementID
        ###序号
        pyCombAction.SequenceNo = pCombAction.SequenceNo
        ###前置编号
        pyCombAction.FrontID = pCombAction.FrontID
        ###会话编号
        pyCombAction.SessionID = pCombAction.SessionID
        ###用户端产品信息
        pyCombAction.UserProductInfo = pCombAction.UserProductInfo
        ###状态信息
        pyCombAction.StatusMsg = pCombAction.StatusMsg
    
        attr_decode(pyCombAction)
    
    clsTdSpiResponse.OnRtnCombAction(pyCombAction)

# 申请组合录入错误回报
cdef extern void OnStaticErrRtnCombActionInsert(CThostFtdcInputCombActionField *pInputCombAction, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyInputCombAction = None
    if pInputCombAction:
        pyInputCombAction = pyThostFtdcInputCombActionField()
    
        ###经纪公司代码
        pyInputCombAction.BrokerID = pInputCombAction.BrokerID
        ###投资者代码
        pyInputCombAction.InvestorID = pInputCombAction.InvestorID
        ###合约代码
        pyInputCombAction.InstrumentID = pInputCombAction.InstrumentID
        ###组合引用
        pyInputCombAction.CombActionRef = pInputCombAction.CombActionRef
        ###用户代码
        pyInputCombAction.UserID = pInputCombAction.UserID
        ###买卖方向
        pyInputCombAction.Direction = pInputCombAction.Direction
        ###数量
        pyInputCombAction.Volume = pInputCombAction.Volume
        ###组合指令方向
        pyInputCombAction.CombDirection = pInputCombAction.CombDirection
        ###投机套保标志
        pyInputCombAction.HedgeFlag = pInputCombAction.HedgeFlag
    
        attr_decode(pyInputCombAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnCombActionInsert(pyInputCombAction, pyRspInfo)

# 请求查询签约银行响应
cdef extern void OnStaticRspQryContractBank(CThostFtdcContractBankField *pContractBank, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyContractBank = None
    if pContractBank:
        pyContractBank = pyThostFtdcContractBankField()
    
        ###经纪公司代码
        pyContractBank.BrokerID = pContractBank.BrokerID
        ###银行代码
        pyContractBank.BankID = pContractBank.BankID
        ###银行分中心代码
        pyContractBank.BankBrchID = pContractBank.BankBrchID
        ###银行名称
        pyContractBank.BankName = pContractBank.BankName
    
        attr_decode(pyContractBank)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryContractBank(pyContractBank, pyRspInfo, nRequestID, bIsLast)

# 请求查询预埋单响应
cdef extern void OnStaticRspQryParkedOrder(CThostFtdcParkedOrderField *pParkedOrder, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyParkedOrder = None
    if pParkedOrder:
        pyParkedOrder = pyThostFtdcParkedOrderField()
    
        ###经纪公司代码
        pyParkedOrder.BrokerID = pParkedOrder.BrokerID
        ###投资者代码
        pyParkedOrder.InvestorID = pParkedOrder.InvestorID
        ###合约代码
        pyParkedOrder.InstrumentID = pParkedOrder.InstrumentID
        ###报单引用
        pyParkedOrder.OrderRef = pParkedOrder.OrderRef
        ###用户代码
        pyParkedOrder.UserID = pParkedOrder.UserID
        ###报单价格条件
        pyParkedOrder.OrderPriceType = pParkedOrder.OrderPriceType
        ###买卖方向
        pyParkedOrder.Direction = pParkedOrder.Direction
        ###组合开平标志
        pyParkedOrder.CombOffsetFlag = pParkedOrder.CombOffsetFlag
        ###组合投机套保标志
        pyParkedOrder.CombHedgeFlag = pParkedOrder.CombHedgeFlag
        ###价格
        pyParkedOrder.LimitPrice = pParkedOrder.LimitPrice
        ###数量
        pyParkedOrder.VolumeTotalOriginal = pParkedOrder.VolumeTotalOriginal
        ###有效期类型
        pyParkedOrder.TimeCondition = pParkedOrder.TimeCondition
        ###GTD日期
        pyParkedOrder.GTDDate = pParkedOrder.GTDDate
        ###成交量类型
        pyParkedOrder.VolumeCondition = pParkedOrder.VolumeCondition
        ###最小成交量
        pyParkedOrder.MinVolume = pParkedOrder.MinVolume
        ###触发条件
        pyParkedOrder.ContingentCondition = pParkedOrder.ContingentCondition
        ###止损价
        pyParkedOrder.StopPrice = pParkedOrder.StopPrice
        ###强平原因
        pyParkedOrder.ForceCloseReason = pParkedOrder.ForceCloseReason
        ###自动挂起标志
        pyParkedOrder.IsAutoSuspend = pParkedOrder.IsAutoSuspend
        ###业务单元
        pyParkedOrder.BusinessUnit = pParkedOrder.BusinessUnit
        ###请求编号
        pyParkedOrder.RequestID = pParkedOrder.RequestID
        ###用户强评标志
        pyParkedOrder.UserForceClose = pParkedOrder.UserForceClose
        ###交易所代码
        pyParkedOrder.ExchangeID = pParkedOrder.ExchangeID
        ###预埋报单编号
        pyParkedOrder.ParkedOrderID = pParkedOrder.ParkedOrderID
        ###用户类型
        pyParkedOrder.UserType = pParkedOrder.UserType
        ###预埋单状态
        pyParkedOrder.Status = pParkedOrder.Status
        ###错误代码
        pyParkedOrder.ErrorID = pParkedOrder.ErrorID
        ###错误信息
        pyParkedOrder.ErrorMsg = pParkedOrder.ErrorMsg
        ###互换单标志
        pyParkedOrder.IsSwapOrder = pParkedOrder.IsSwapOrder
    
        attr_decode(pyParkedOrder)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryParkedOrder(pyParkedOrder, pyRspInfo, nRequestID, bIsLast)

# 请求查询预埋撤单响应
cdef extern void OnStaticRspQryParkedOrderAction(CThostFtdcParkedOrderActionField *pParkedOrderAction, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyParkedOrderAction = None
    if pParkedOrderAction:
        pyParkedOrderAction = pyThostFtdcParkedOrderActionField()
    
        ###经纪公司代码
        pyParkedOrderAction.BrokerID = pParkedOrderAction.BrokerID
        ###投资者代码
        pyParkedOrderAction.InvestorID = pParkedOrderAction.InvestorID
        ###报单操作引用
        pyParkedOrderAction.OrderActionRef = pParkedOrderAction.OrderActionRef
        ###报单引用
        pyParkedOrderAction.OrderRef = pParkedOrderAction.OrderRef
        ###请求编号
        pyParkedOrderAction.RequestID = pParkedOrderAction.RequestID
        ###前置编号
        pyParkedOrderAction.FrontID = pParkedOrderAction.FrontID
        ###会话编号
        pyParkedOrderAction.SessionID = pParkedOrderAction.SessionID
        ###交易所代码
        pyParkedOrderAction.ExchangeID = pParkedOrderAction.ExchangeID
        ###报单编号
        pyParkedOrderAction.OrderSysID = pParkedOrderAction.OrderSysID
        ###操作标志
        pyParkedOrderAction.ActionFlag = pParkedOrderAction.ActionFlag
        ###价格
        pyParkedOrderAction.LimitPrice = pParkedOrderAction.LimitPrice
        ###数量变化
        pyParkedOrderAction.VolumeChange = pParkedOrderAction.VolumeChange
        ###用户代码
        pyParkedOrderAction.UserID = pParkedOrderAction.UserID
        ###合约代码
        pyParkedOrderAction.InstrumentID = pParkedOrderAction.InstrumentID
        ###预埋撤单单编号
        pyParkedOrderAction.ParkedOrderActionID = pParkedOrderAction.ParkedOrderActionID
        ###用户类型
        pyParkedOrderAction.UserType = pParkedOrderAction.UserType
        ###预埋撤单状态
        pyParkedOrderAction.Status = pParkedOrderAction.Status
        ###错误代码
        pyParkedOrderAction.ErrorID = pParkedOrderAction.ErrorID
        ###错误信息
        pyParkedOrderAction.ErrorMsg = pParkedOrderAction.ErrorMsg
    
        attr_decode(pyParkedOrderAction)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryParkedOrderAction(pyParkedOrderAction, pyRspInfo, nRequestID, bIsLast)

# 请求查询交易通知响应
cdef extern void OnStaticRspQryTradingNotice(CThostFtdcTradingNoticeField *pTradingNotice, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyTradingNotice = None
    if pTradingNotice:
        pyTradingNotice = pyThostFtdcTradingNoticeField()
    
        ###经纪公司代码
        pyTradingNotice.BrokerID = pTradingNotice.BrokerID
        ###投资者范围
        pyTradingNotice.InvestorRange = pTradingNotice.InvestorRange
        ###投资者代码
        pyTradingNotice.InvestorID = pTradingNotice.InvestorID
        ###序列系列号
        pyTradingNotice.SequenceSeries = pTradingNotice.SequenceSeries
        ###用户代码
        pyTradingNotice.UserID = pTradingNotice.UserID
        ###发送时间
        pyTradingNotice.SendTime = pTradingNotice.SendTime
        ###序列号
        pyTradingNotice.SequenceNo = pTradingNotice.SequenceNo
        ###消息正文
        pyTradingNotice.FieldContent = pTradingNotice.FieldContent
    
        attr_decode(pyTradingNotice)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryTradingNotice(pyTradingNotice, pyRspInfo, nRequestID, bIsLast)

# 请求查询经纪公司交易参数响应
cdef extern void OnStaticRspQryBrokerTradingParams(CThostFtdcBrokerTradingParamsField *pBrokerTradingParams, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyBrokerTradingParams = None
    if pBrokerTradingParams:
        pyBrokerTradingParams = pyThostFtdcBrokerTradingParamsField()
    
        ###经纪公司代码
        pyBrokerTradingParams.BrokerID = pBrokerTradingParams.BrokerID
        ###投资者代码
        pyBrokerTradingParams.InvestorID = pBrokerTradingParams.InvestorID
        ###保证金价格类型
        pyBrokerTradingParams.MarginPriceType = pBrokerTradingParams.MarginPriceType
        ###盈亏算法
        pyBrokerTradingParams.Algorithm = pBrokerTradingParams.Algorithm
        ###可用是否包含平仓盈利
        pyBrokerTradingParams.AvailIncludeCloseProfit = pBrokerTradingParams.AvailIncludeCloseProfit
        ###币种代码
        pyBrokerTradingParams.CurrencyID = pBrokerTradingParams.CurrencyID
        ###期权权利金价格类型
        pyBrokerTradingParams.OptionRoyaltyPriceType = pBrokerTradingParams.OptionRoyaltyPriceType
    
        attr_decode(pyBrokerTradingParams)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryBrokerTradingParams(pyBrokerTradingParams, pyRspInfo, nRequestID, bIsLast)

# 请求查询经纪公司交易算法响应
cdef extern void OnStaticRspQryBrokerTradingAlgos(CThostFtdcBrokerTradingAlgosField *pBrokerTradingAlgos, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyBrokerTradingAlgos = None
    if pBrokerTradingAlgos:
        pyBrokerTradingAlgos = pyThostFtdcBrokerTradingAlgosField()
    
        ###经纪公司代码
        pyBrokerTradingAlgos.BrokerID = pBrokerTradingAlgos.BrokerID
        ###交易所代码
        pyBrokerTradingAlgos.ExchangeID = pBrokerTradingAlgos.ExchangeID
        ###合约代码
        pyBrokerTradingAlgos.InstrumentID = pBrokerTradingAlgos.InstrumentID
        ###持仓处理算法编号
        pyBrokerTradingAlgos.HandlePositionAlgoID = pBrokerTradingAlgos.HandlePositionAlgoID
        ###寻找保证金率算法编号
        pyBrokerTradingAlgos.FindMarginRateAlgoID = pBrokerTradingAlgos.FindMarginRateAlgoID
        ###资金处理算法编号
        pyBrokerTradingAlgos.HandleTradingAccountAlgoID = pBrokerTradingAlgos.HandleTradingAccountAlgoID
    
        attr_decode(pyBrokerTradingAlgos)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQryBrokerTradingAlgos(pyBrokerTradingAlgos, pyRspInfo, nRequestID, bIsLast)

# 请求查询监控中心用户令牌
cdef extern void OnStaticRspQueryCFMMCTradingAccountToken(CThostFtdcQueryCFMMCTradingAccountTokenField *pQueryCFMMCTradingAccountToken, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyQueryCFMMCTradingAccountToken = None
    if pQueryCFMMCTradingAccountToken:
        pyQueryCFMMCTradingAccountToken = pyThostFtdcQueryCFMMCTradingAccountTokenField()
    
        ###经纪公司代码
        pyQueryCFMMCTradingAccountToken.BrokerID = pQueryCFMMCTradingAccountToken.BrokerID
        ###投资者代码
        pyQueryCFMMCTradingAccountToken.InvestorID = pQueryCFMMCTradingAccountToken.InvestorID
    
        attr_decode(pyQueryCFMMCTradingAccountToken)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQueryCFMMCTradingAccountToken(pyQueryCFMMCTradingAccountToken, pyRspInfo, nRequestID, bIsLast)

# 银行发起银行资金转期货通知
cdef extern void OnStaticRtnFromBankToFutureByBank(CThostFtdcRspTransferField *pRspTransfer):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspTransfer = None
    if pRspTransfer:
        pyRspTransfer = pyThostFtdcRspTransferField()
    
        ###业务功能码
        pyRspTransfer.TradeCode = pRspTransfer.TradeCode
        ###银行代码
        pyRspTransfer.BankID = pRspTransfer.BankID
        ###银行分支机构代码
        pyRspTransfer.BankBranchID = pRspTransfer.BankBranchID
        ###期商代码
        pyRspTransfer.BrokerID = pRspTransfer.BrokerID
        ###期商分支机构代码
        pyRspTransfer.BrokerBranchID = pRspTransfer.BrokerBranchID
        ###交易日期
        pyRspTransfer.TradeDate = pRspTransfer.TradeDate
        ###交易时间
        pyRspTransfer.TradeTime = pRspTransfer.TradeTime
        ###银行流水号
        pyRspTransfer.BankSerial = pRspTransfer.BankSerial
        ###交易系统日期 
        pyRspTransfer.TradingDay = pRspTransfer.TradingDay
        ###银期平台消息流水号
        pyRspTransfer.PlateSerial = pRspTransfer.PlateSerial
        ###最后分片标志
        pyRspTransfer.LastFragment = pRspTransfer.LastFragment
        ###会话号
        pyRspTransfer.SessionID = pRspTransfer.SessionID
        ###客户姓名
        pyRspTransfer.CustomerName = pRspTransfer.CustomerName
        ###证件类型
        pyRspTransfer.IdCardType = pRspTransfer.IdCardType
        ###证件号码
        pyRspTransfer.IdentifiedCardNo = pRspTransfer.IdentifiedCardNo
        ###客户类型
        pyRspTransfer.CustType = pRspTransfer.CustType
        ###银行帐号
        pyRspTransfer.BankAccount = pRspTransfer.BankAccount
        ###银行密码
        pyRspTransfer.BankPassWord = pRspTransfer.BankPassWord
        ###投资者帐号
        pyRspTransfer.AccountID = pRspTransfer.AccountID
        ###期货密码
        pyRspTransfer.Password = pRspTransfer.Password
        ###安装编号
        pyRspTransfer.InstallID = pRspTransfer.InstallID
        ###期货公司流水号
        pyRspTransfer.FutureSerial = pRspTransfer.FutureSerial
        ###用户标识
        pyRspTransfer.UserID = pRspTransfer.UserID
        ###验证客户证件号码标志
        pyRspTransfer.VerifyCertNoFlag = pRspTransfer.VerifyCertNoFlag
        ###币种代码
        pyRspTransfer.CurrencyID = pRspTransfer.CurrencyID
        ###转帐金额
        pyRspTransfer.TradeAmount = pRspTransfer.TradeAmount
        ###期货可取金额
        pyRspTransfer.FutureFetchAmount = pRspTransfer.FutureFetchAmount
        ###费用支付标志
        pyRspTransfer.FeePayFlag = pRspTransfer.FeePayFlag
        ###应收客户费用
        pyRspTransfer.CustFee = pRspTransfer.CustFee
        ###应收期货公司费用
        pyRspTransfer.BrokerFee = pRspTransfer.BrokerFee
        ###发送方给接收方的消息
        pyRspTransfer.Message = pRspTransfer.Message
        ###摘要
        pyRspTransfer.Digest = pRspTransfer.Digest
        ###银行帐号类型
        pyRspTransfer.BankAccType = pRspTransfer.BankAccType
        ###渠道标志
        pyRspTransfer.DeviceID = pRspTransfer.DeviceID
        ###期货单位帐号类型
        pyRspTransfer.BankSecuAccType = pRspTransfer.BankSecuAccType
        ###期货公司银行编码
        pyRspTransfer.BrokerIDByBank = pRspTransfer.BrokerIDByBank
        ###期货单位帐号
        pyRspTransfer.BankSecuAcc = pRspTransfer.BankSecuAcc
        ###银行密码标志
        pyRspTransfer.BankPwdFlag = pRspTransfer.BankPwdFlag
        ###期货资金密码核对标志
        pyRspTransfer.SecuPwdFlag = pRspTransfer.SecuPwdFlag
        ###交易柜员
        pyRspTransfer.OperNo = pRspTransfer.OperNo
        ###请求编号
        pyRspTransfer.RequestID = pRspTransfer.RequestID
        ###交易ID
        pyRspTransfer.TID = pRspTransfer.TID
        ###转账交易状态
        pyRspTransfer.TransferStatus = pRspTransfer.TransferStatus
        ###错误代码
        pyRspTransfer.ErrorID = pRspTransfer.ErrorID
        ###错误信息
        pyRspTransfer.ErrorMsg = pRspTransfer.ErrorMsg
    
        attr_decode(pyRspTransfer)
    
    clsTdSpiResponse.OnRtnFromBankToFutureByBank(pyRspTransfer)

# 银行发起期货资金转银行通知
cdef extern void OnStaticRtnFromFutureToBankByBank(CThostFtdcRspTransferField *pRspTransfer):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspTransfer = None
    if pRspTransfer:
        pyRspTransfer = pyThostFtdcRspTransferField()
    
        ###业务功能码
        pyRspTransfer.TradeCode = pRspTransfer.TradeCode
        ###银行代码
        pyRspTransfer.BankID = pRspTransfer.BankID
        ###银行分支机构代码
        pyRspTransfer.BankBranchID = pRspTransfer.BankBranchID
        ###期商代码
        pyRspTransfer.BrokerID = pRspTransfer.BrokerID
        ###期商分支机构代码
        pyRspTransfer.BrokerBranchID = pRspTransfer.BrokerBranchID
        ###交易日期
        pyRspTransfer.TradeDate = pRspTransfer.TradeDate
        ###交易时间
        pyRspTransfer.TradeTime = pRspTransfer.TradeTime
        ###银行流水号
        pyRspTransfer.BankSerial = pRspTransfer.BankSerial
        ###交易系统日期 
        pyRspTransfer.TradingDay = pRspTransfer.TradingDay
        ###银期平台消息流水号
        pyRspTransfer.PlateSerial = pRspTransfer.PlateSerial
        ###最后分片标志
        pyRspTransfer.LastFragment = pRspTransfer.LastFragment
        ###会话号
        pyRspTransfer.SessionID = pRspTransfer.SessionID
        ###客户姓名
        pyRspTransfer.CustomerName = pRspTransfer.CustomerName
        ###证件类型
        pyRspTransfer.IdCardType = pRspTransfer.IdCardType
        ###证件号码
        pyRspTransfer.IdentifiedCardNo = pRspTransfer.IdentifiedCardNo
        ###客户类型
        pyRspTransfer.CustType = pRspTransfer.CustType
        ###银行帐号
        pyRspTransfer.BankAccount = pRspTransfer.BankAccount
        ###银行密码
        pyRspTransfer.BankPassWord = pRspTransfer.BankPassWord
        ###投资者帐号
        pyRspTransfer.AccountID = pRspTransfer.AccountID
        ###期货密码
        pyRspTransfer.Password = pRspTransfer.Password
        ###安装编号
        pyRspTransfer.InstallID = pRspTransfer.InstallID
        ###期货公司流水号
        pyRspTransfer.FutureSerial = pRspTransfer.FutureSerial
        ###用户标识
        pyRspTransfer.UserID = pRspTransfer.UserID
        ###验证客户证件号码标志
        pyRspTransfer.VerifyCertNoFlag = pRspTransfer.VerifyCertNoFlag
        ###币种代码
        pyRspTransfer.CurrencyID = pRspTransfer.CurrencyID
        ###转帐金额
        pyRspTransfer.TradeAmount = pRspTransfer.TradeAmount
        ###期货可取金额
        pyRspTransfer.FutureFetchAmount = pRspTransfer.FutureFetchAmount
        ###费用支付标志
        pyRspTransfer.FeePayFlag = pRspTransfer.FeePayFlag
        ###应收客户费用
        pyRspTransfer.CustFee = pRspTransfer.CustFee
        ###应收期货公司费用
        pyRspTransfer.BrokerFee = pRspTransfer.BrokerFee
        ###发送方给接收方的消息
        pyRspTransfer.Message = pRspTransfer.Message
        ###摘要
        pyRspTransfer.Digest = pRspTransfer.Digest
        ###银行帐号类型
        pyRspTransfer.BankAccType = pRspTransfer.BankAccType
        ###渠道标志
        pyRspTransfer.DeviceID = pRspTransfer.DeviceID
        ###期货单位帐号类型
        pyRspTransfer.BankSecuAccType = pRspTransfer.BankSecuAccType
        ###期货公司银行编码
        pyRspTransfer.BrokerIDByBank = pRspTransfer.BrokerIDByBank
        ###期货单位帐号
        pyRspTransfer.BankSecuAcc = pRspTransfer.BankSecuAcc
        ###银行密码标志
        pyRspTransfer.BankPwdFlag = pRspTransfer.BankPwdFlag
        ###期货资金密码核对标志
        pyRspTransfer.SecuPwdFlag = pRspTransfer.SecuPwdFlag
        ###交易柜员
        pyRspTransfer.OperNo = pRspTransfer.OperNo
        ###请求编号
        pyRspTransfer.RequestID = pRspTransfer.RequestID
        ###交易ID
        pyRspTransfer.TID = pRspTransfer.TID
        ###转账交易状态
        pyRspTransfer.TransferStatus = pRspTransfer.TransferStatus
        ###错误代码
        pyRspTransfer.ErrorID = pRspTransfer.ErrorID
        ###错误信息
        pyRspTransfer.ErrorMsg = pRspTransfer.ErrorMsg
    
        attr_decode(pyRspTransfer)
    
    clsTdSpiResponse.OnRtnFromFutureToBankByBank(pyRspTransfer)

# 银行发起冲正银行转期货通知
cdef extern void OnStaticRtnRepealFromBankToFutureByBank(CThostFtdcRspRepealField *pRspRepeal):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspRepeal = None
    if pRspRepeal:
        pyRspRepeal = pyThostFtdcRspRepealField()
    
        ###冲正时间间隔
        pyRspRepeal.RepealTimeInterval = pRspRepeal.RepealTimeInterval
        ###已经冲正次数
        pyRspRepeal.RepealedTimes = pRspRepeal.RepealedTimes
        ###银行冲正标志
        pyRspRepeal.BankRepealFlag = pRspRepeal.BankRepealFlag
        ###期商冲正标志
        pyRspRepeal.BrokerRepealFlag = pRspRepeal.BrokerRepealFlag
        ###被冲正平台流水号
        pyRspRepeal.PlateRepealSerial = pRspRepeal.PlateRepealSerial
        ###被冲正银行流水号
        pyRspRepeal.BankRepealSerial = pRspRepeal.BankRepealSerial
        ###被冲正期货流水号
        pyRspRepeal.FutureRepealSerial = pRspRepeal.FutureRepealSerial
        ###业务功能码
        pyRspRepeal.TradeCode = pRspRepeal.TradeCode
        ###银行代码
        pyRspRepeal.BankID = pRspRepeal.BankID
        ###银行分支机构代码
        pyRspRepeal.BankBranchID = pRspRepeal.BankBranchID
        ###期商代码
        pyRspRepeal.BrokerID = pRspRepeal.BrokerID
        ###期商分支机构代码
        pyRspRepeal.BrokerBranchID = pRspRepeal.BrokerBranchID
        ###交易日期
        pyRspRepeal.TradeDate = pRspRepeal.TradeDate
        ###交易时间
        pyRspRepeal.TradeTime = pRspRepeal.TradeTime
        ###银行流水号
        pyRspRepeal.BankSerial = pRspRepeal.BankSerial
        ###交易系统日期 
        pyRspRepeal.TradingDay = pRspRepeal.TradingDay
        ###银期平台消息流水号
        pyRspRepeal.PlateSerial = pRspRepeal.PlateSerial
        ###最后分片标志
        pyRspRepeal.LastFragment = pRspRepeal.LastFragment
        ###会话号
        pyRspRepeal.SessionID = pRspRepeal.SessionID
        ###客户姓名
        pyRspRepeal.CustomerName = pRspRepeal.CustomerName
        ###证件类型
        pyRspRepeal.IdCardType = pRspRepeal.IdCardType
        ###证件号码
        pyRspRepeal.IdentifiedCardNo = pRspRepeal.IdentifiedCardNo
        ###客户类型
        pyRspRepeal.CustType = pRspRepeal.CustType
        ###银行帐号
        pyRspRepeal.BankAccount = pRspRepeal.BankAccount
        ###银行密码
        pyRspRepeal.BankPassWord = pRspRepeal.BankPassWord
        ###投资者帐号
        pyRspRepeal.AccountID = pRspRepeal.AccountID
        ###期货密码
        pyRspRepeal.Password = pRspRepeal.Password
        ###安装编号
        pyRspRepeal.InstallID = pRspRepeal.InstallID
        ###期货公司流水号
        pyRspRepeal.FutureSerial = pRspRepeal.FutureSerial
        ###用户标识
        pyRspRepeal.UserID = pRspRepeal.UserID
        ###验证客户证件号码标志
        pyRspRepeal.VerifyCertNoFlag = pRspRepeal.VerifyCertNoFlag
        ###币种代码
        pyRspRepeal.CurrencyID = pRspRepeal.CurrencyID
        ###转帐金额
        pyRspRepeal.TradeAmount = pRspRepeal.TradeAmount
        ###期货可取金额
        pyRspRepeal.FutureFetchAmount = pRspRepeal.FutureFetchAmount
        ###费用支付标志
        pyRspRepeal.FeePayFlag = pRspRepeal.FeePayFlag
        ###应收客户费用
        pyRspRepeal.CustFee = pRspRepeal.CustFee
        ###应收期货公司费用
        pyRspRepeal.BrokerFee = pRspRepeal.BrokerFee
        ###发送方给接收方的消息
        pyRspRepeal.Message = pRspRepeal.Message
        ###摘要
        pyRspRepeal.Digest = pRspRepeal.Digest
        ###银行帐号类型
        pyRspRepeal.BankAccType = pRspRepeal.BankAccType
        ###渠道标志
        pyRspRepeal.DeviceID = pRspRepeal.DeviceID
        ###期货单位帐号类型
        pyRspRepeal.BankSecuAccType = pRspRepeal.BankSecuAccType
        ###期货公司银行编码
        pyRspRepeal.BrokerIDByBank = pRspRepeal.BrokerIDByBank
        ###期货单位帐号
        pyRspRepeal.BankSecuAcc = pRspRepeal.BankSecuAcc
        ###银行密码标志
        pyRspRepeal.BankPwdFlag = pRspRepeal.BankPwdFlag
        ###期货资金密码核对标志
        pyRspRepeal.SecuPwdFlag = pRspRepeal.SecuPwdFlag
        ###交易柜员
        pyRspRepeal.OperNo = pRspRepeal.OperNo
        ###请求编号
        pyRspRepeal.RequestID = pRspRepeal.RequestID
        ###交易ID
        pyRspRepeal.TID = pRspRepeal.TID
        ###转账交易状态
        pyRspRepeal.TransferStatus = pRspRepeal.TransferStatus
        ###错误代码
        pyRspRepeal.ErrorID = pRspRepeal.ErrorID
        ###错误信息
        pyRspRepeal.ErrorMsg = pRspRepeal.ErrorMsg
    
        attr_decode(pyRspRepeal)
    
    clsTdSpiResponse.OnRtnRepealFromBankToFutureByBank(pyRspRepeal)

# 银行发起冲正期货转银行通知
cdef extern void OnStaticRtnRepealFromFutureToBankByBank(CThostFtdcRspRepealField *pRspRepeal):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspRepeal = None
    if pRspRepeal:
        pyRspRepeal = pyThostFtdcRspRepealField()
    
        ###冲正时间间隔
        pyRspRepeal.RepealTimeInterval = pRspRepeal.RepealTimeInterval
        ###已经冲正次数
        pyRspRepeal.RepealedTimes = pRspRepeal.RepealedTimes
        ###银行冲正标志
        pyRspRepeal.BankRepealFlag = pRspRepeal.BankRepealFlag
        ###期商冲正标志
        pyRspRepeal.BrokerRepealFlag = pRspRepeal.BrokerRepealFlag
        ###被冲正平台流水号
        pyRspRepeal.PlateRepealSerial = pRspRepeal.PlateRepealSerial
        ###被冲正银行流水号
        pyRspRepeal.BankRepealSerial = pRspRepeal.BankRepealSerial
        ###被冲正期货流水号
        pyRspRepeal.FutureRepealSerial = pRspRepeal.FutureRepealSerial
        ###业务功能码
        pyRspRepeal.TradeCode = pRspRepeal.TradeCode
        ###银行代码
        pyRspRepeal.BankID = pRspRepeal.BankID
        ###银行分支机构代码
        pyRspRepeal.BankBranchID = pRspRepeal.BankBranchID
        ###期商代码
        pyRspRepeal.BrokerID = pRspRepeal.BrokerID
        ###期商分支机构代码
        pyRspRepeal.BrokerBranchID = pRspRepeal.BrokerBranchID
        ###交易日期
        pyRspRepeal.TradeDate = pRspRepeal.TradeDate
        ###交易时间
        pyRspRepeal.TradeTime = pRspRepeal.TradeTime
        ###银行流水号
        pyRspRepeal.BankSerial = pRspRepeal.BankSerial
        ###交易系统日期 
        pyRspRepeal.TradingDay = pRspRepeal.TradingDay
        ###银期平台消息流水号
        pyRspRepeal.PlateSerial = pRspRepeal.PlateSerial
        ###最后分片标志
        pyRspRepeal.LastFragment = pRspRepeal.LastFragment
        ###会话号
        pyRspRepeal.SessionID = pRspRepeal.SessionID
        ###客户姓名
        pyRspRepeal.CustomerName = pRspRepeal.CustomerName
        ###证件类型
        pyRspRepeal.IdCardType = pRspRepeal.IdCardType
        ###证件号码
        pyRspRepeal.IdentifiedCardNo = pRspRepeal.IdentifiedCardNo
        ###客户类型
        pyRspRepeal.CustType = pRspRepeal.CustType
        ###银行帐号
        pyRspRepeal.BankAccount = pRspRepeal.BankAccount
        ###银行密码
        pyRspRepeal.BankPassWord = pRspRepeal.BankPassWord
        ###投资者帐号
        pyRspRepeal.AccountID = pRspRepeal.AccountID
        ###期货密码
        pyRspRepeal.Password = pRspRepeal.Password
        ###安装编号
        pyRspRepeal.InstallID = pRspRepeal.InstallID
        ###期货公司流水号
        pyRspRepeal.FutureSerial = pRspRepeal.FutureSerial
        ###用户标识
        pyRspRepeal.UserID = pRspRepeal.UserID
        ###验证客户证件号码标志
        pyRspRepeal.VerifyCertNoFlag = pRspRepeal.VerifyCertNoFlag
        ###币种代码
        pyRspRepeal.CurrencyID = pRspRepeal.CurrencyID
        ###转帐金额
        pyRspRepeal.TradeAmount = pRspRepeal.TradeAmount
        ###期货可取金额
        pyRspRepeal.FutureFetchAmount = pRspRepeal.FutureFetchAmount
        ###费用支付标志
        pyRspRepeal.FeePayFlag = pRspRepeal.FeePayFlag
        ###应收客户费用
        pyRspRepeal.CustFee = pRspRepeal.CustFee
        ###应收期货公司费用
        pyRspRepeal.BrokerFee = pRspRepeal.BrokerFee
        ###发送方给接收方的消息
        pyRspRepeal.Message = pRspRepeal.Message
        ###摘要
        pyRspRepeal.Digest = pRspRepeal.Digest
        ###银行帐号类型
        pyRspRepeal.BankAccType = pRspRepeal.BankAccType
        ###渠道标志
        pyRspRepeal.DeviceID = pRspRepeal.DeviceID
        ###期货单位帐号类型
        pyRspRepeal.BankSecuAccType = pRspRepeal.BankSecuAccType
        ###期货公司银行编码
        pyRspRepeal.BrokerIDByBank = pRspRepeal.BrokerIDByBank
        ###期货单位帐号
        pyRspRepeal.BankSecuAcc = pRspRepeal.BankSecuAcc
        ###银行密码标志
        pyRspRepeal.BankPwdFlag = pRspRepeal.BankPwdFlag
        ###期货资金密码核对标志
        pyRspRepeal.SecuPwdFlag = pRspRepeal.SecuPwdFlag
        ###交易柜员
        pyRspRepeal.OperNo = pRspRepeal.OperNo
        ###请求编号
        pyRspRepeal.RequestID = pRspRepeal.RequestID
        ###交易ID
        pyRspRepeal.TID = pRspRepeal.TID
        ###转账交易状态
        pyRspRepeal.TransferStatus = pRspRepeal.TransferStatus
        ###错误代码
        pyRspRepeal.ErrorID = pRspRepeal.ErrorID
        ###错误信息
        pyRspRepeal.ErrorMsg = pRspRepeal.ErrorMsg
    
        attr_decode(pyRspRepeal)
    
    clsTdSpiResponse.OnRtnRepealFromFutureToBankByBank(pyRspRepeal)

# 期货发起银行资金转期货通知
cdef extern void OnStaticRtnFromBankToFutureByFuture(CThostFtdcRspTransferField *pRspTransfer):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspTransfer = None
    if pRspTransfer:
        pyRspTransfer = pyThostFtdcRspTransferField()
    
        ###业务功能码
        pyRspTransfer.TradeCode = pRspTransfer.TradeCode
        ###银行代码
        pyRspTransfer.BankID = pRspTransfer.BankID
        ###银行分支机构代码
        pyRspTransfer.BankBranchID = pRspTransfer.BankBranchID
        ###期商代码
        pyRspTransfer.BrokerID = pRspTransfer.BrokerID
        ###期商分支机构代码
        pyRspTransfer.BrokerBranchID = pRspTransfer.BrokerBranchID
        ###交易日期
        pyRspTransfer.TradeDate = pRspTransfer.TradeDate
        ###交易时间
        pyRspTransfer.TradeTime = pRspTransfer.TradeTime
        ###银行流水号
        pyRspTransfer.BankSerial = pRspTransfer.BankSerial
        ###交易系统日期 
        pyRspTransfer.TradingDay = pRspTransfer.TradingDay
        ###银期平台消息流水号
        pyRspTransfer.PlateSerial = pRspTransfer.PlateSerial
        ###最后分片标志
        pyRspTransfer.LastFragment = pRspTransfer.LastFragment
        ###会话号
        pyRspTransfer.SessionID = pRspTransfer.SessionID
        ###客户姓名
        pyRspTransfer.CustomerName = pRspTransfer.CustomerName
        ###证件类型
        pyRspTransfer.IdCardType = pRspTransfer.IdCardType
        ###证件号码
        pyRspTransfer.IdentifiedCardNo = pRspTransfer.IdentifiedCardNo
        ###客户类型
        pyRspTransfer.CustType = pRspTransfer.CustType
        ###银行帐号
        pyRspTransfer.BankAccount = pRspTransfer.BankAccount
        ###银行密码
        pyRspTransfer.BankPassWord = pRspTransfer.BankPassWord
        ###投资者帐号
        pyRspTransfer.AccountID = pRspTransfer.AccountID
        ###期货密码
        pyRspTransfer.Password = pRspTransfer.Password
        ###安装编号
        pyRspTransfer.InstallID = pRspTransfer.InstallID
        ###期货公司流水号
        pyRspTransfer.FutureSerial = pRspTransfer.FutureSerial
        ###用户标识
        pyRspTransfer.UserID = pRspTransfer.UserID
        ###验证客户证件号码标志
        pyRspTransfer.VerifyCertNoFlag = pRspTransfer.VerifyCertNoFlag
        ###币种代码
        pyRspTransfer.CurrencyID = pRspTransfer.CurrencyID
        ###转帐金额
        pyRspTransfer.TradeAmount = pRspTransfer.TradeAmount
        ###期货可取金额
        pyRspTransfer.FutureFetchAmount = pRspTransfer.FutureFetchAmount
        ###费用支付标志
        pyRspTransfer.FeePayFlag = pRspTransfer.FeePayFlag
        ###应收客户费用
        pyRspTransfer.CustFee = pRspTransfer.CustFee
        ###应收期货公司费用
        pyRspTransfer.BrokerFee = pRspTransfer.BrokerFee
        ###发送方给接收方的消息
        pyRspTransfer.Message = pRspTransfer.Message
        ###摘要
        pyRspTransfer.Digest = pRspTransfer.Digest
        ###银行帐号类型
        pyRspTransfer.BankAccType = pRspTransfer.BankAccType
        ###渠道标志
        pyRspTransfer.DeviceID = pRspTransfer.DeviceID
        ###期货单位帐号类型
        pyRspTransfer.BankSecuAccType = pRspTransfer.BankSecuAccType
        ###期货公司银行编码
        pyRspTransfer.BrokerIDByBank = pRspTransfer.BrokerIDByBank
        ###期货单位帐号
        pyRspTransfer.BankSecuAcc = pRspTransfer.BankSecuAcc
        ###银行密码标志
        pyRspTransfer.BankPwdFlag = pRspTransfer.BankPwdFlag
        ###期货资金密码核对标志
        pyRspTransfer.SecuPwdFlag = pRspTransfer.SecuPwdFlag
        ###交易柜员
        pyRspTransfer.OperNo = pRspTransfer.OperNo
        ###请求编号
        pyRspTransfer.RequestID = pRspTransfer.RequestID
        ###交易ID
        pyRspTransfer.TID = pRspTransfer.TID
        ###转账交易状态
        pyRspTransfer.TransferStatus = pRspTransfer.TransferStatus
        ###错误代码
        pyRspTransfer.ErrorID = pRspTransfer.ErrorID
        ###错误信息
        pyRspTransfer.ErrorMsg = pRspTransfer.ErrorMsg
    
        attr_decode(pyRspTransfer)
    
    clsTdSpiResponse.OnRtnFromBankToFutureByFuture(pyRspTransfer)

# 期货发起期货资金转银行通知
cdef extern void OnStaticRtnFromFutureToBankByFuture(CThostFtdcRspTransferField *pRspTransfer):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspTransfer = None
    if pRspTransfer:
        pyRspTransfer = pyThostFtdcRspTransferField()
    
        ###业务功能码
        pyRspTransfer.TradeCode = pRspTransfer.TradeCode
        ###银行代码
        pyRspTransfer.BankID = pRspTransfer.BankID
        ###银行分支机构代码
        pyRspTransfer.BankBranchID = pRspTransfer.BankBranchID
        ###期商代码
        pyRspTransfer.BrokerID = pRspTransfer.BrokerID
        ###期商分支机构代码
        pyRspTransfer.BrokerBranchID = pRspTransfer.BrokerBranchID
        ###交易日期
        pyRspTransfer.TradeDate = pRspTransfer.TradeDate
        ###交易时间
        pyRspTransfer.TradeTime = pRspTransfer.TradeTime
        ###银行流水号
        pyRspTransfer.BankSerial = pRspTransfer.BankSerial
        ###交易系统日期 
        pyRspTransfer.TradingDay = pRspTransfer.TradingDay
        ###银期平台消息流水号
        pyRspTransfer.PlateSerial = pRspTransfer.PlateSerial
        ###最后分片标志
        pyRspTransfer.LastFragment = pRspTransfer.LastFragment
        ###会话号
        pyRspTransfer.SessionID = pRspTransfer.SessionID
        ###客户姓名
        pyRspTransfer.CustomerName = pRspTransfer.CustomerName
        ###证件类型
        pyRspTransfer.IdCardType = pRspTransfer.IdCardType
        ###证件号码
        pyRspTransfer.IdentifiedCardNo = pRspTransfer.IdentifiedCardNo
        ###客户类型
        pyRspTransfer.CustType = pRspTransfer.CustType
        ###银行帐号
        pyRspTransfer.BankAccount = pRspTransfer.BankAccount
        ###银行密码
        pyRspTransfer.BankPassWord = pRspTransfer.BankPassWord
        ###投资者帐号
        pyRspTransfer.AccountID = pRspTransfer.AccountID
        ###期货密码
        pyRspTransfer.Password = pRspTransfer.Password
        ###安装编号
        pyRspTransfer.InstallID = pRspTransfer.InstallID
        ###期货公司流水号
        pyRspTransfer.FutureSerial = pRspTransfer.FutureSerial
        ###用户标识
        pyRspTransfer.UserID = pRspTransfer.UserID
        ###验证客户证件号码标志
        pyRspTransfer.VerifyCertNoFlag = pRspTransfer.VerifyCertNoFlag
        ###币种代码
        pyRspTransfer.CurrencyID = pRspTransfer.CurrencyID
        ###转帐金额
        pyRspTransfer.TradeAmount = pRspTransfer.TradeAmount
        ###期货可取金额
        pyRspTransfer.FutureFetchAmount = pRspTransfer.FutureFetchAmount
        ###费用支付标志
        pyRspTransfer.FeePayFlag = pRspTransfer.FeePayFlag
        ###应收客户费用
        pyRspTransfer.CustFee = pRspTransfer.CustFee
        ###应收期货公司费用
        pyRspTransfer.BrokerFee = pRspTransfer.BrokerFee
        ###发送方给接收方的消息
        pyRspTransfer.Message = pRspTransfer.Message
        ###摘要
        pyRspTransfer.Digest = pRspTransfer.Digest
        ###银行帐号类型
        pyRspTransfer.BankAccType = pRspTransfer.BankAccType
        ###渠道标志
        pyRspTransfer.DeviceID = pRspTransfer.DeviceID
        ###期货单位帐号类型
        pyRspTransfer.BankSecuAccType = pRspTransfer.BankSecuAccType
        ###期货公司银行编码
        pyRspTransfer.BrokerIDByBank = pRspTransfer.BrokerIDByBank
        ###期货单位帐号
        pyRspTransfer.BankSecuAcc = pRspTransfer.BankSecuAcc
        ###银行密码标志
        pyRspTransfer.BankPwdFlag = pRspTransfer.BankPwdFlag
        ###期货资金密码核对标志
        pyRspTransfer.SecuPwdFlag = pRspTransfer.SecuPwdFlag
        ###交易柜员
        pyRspTransfer.OperNo = pRspTransfer.OperNo
        ###请求编号
        pyRspTransfer.RequestID = pRspTransfer.RequestID
        ###交易ID
        pyRspTransfer.TID = pRspTransfer.TID
        ###转账交易状态
        pyRspTransfer.TransferStatus = pRspTransfer.TransferStatus
        ###错误代码
        pyRspTransfer.ErrorID = pRspTransfer.ErrorID
        ###错误信息
        pyRspTransfer.ErrorMsg = pRspTransfer.ErrorMsg
    
        attr_decode(pyRspTransfer)
    
    clsTdSpiResponse.OnRtnFromFutureToBankByFuture(pyRspTransfer)

# 系统运行时期货端手工发起冲正银行转期货请求，银行处理完毕后报盘发回的通知
cdef extern void OnStaticRtnRepealFromBankToFutureByFutureManual(CThostFtdcRspRepealField *pRspRepeal):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspRepeal = None
    if pRspRepeal:
        pyRspRepeal = pyThostFtdcRspRepealField()
    
        ###冲正时间间隔
        pyRspRepeal.RepealTimeInterval = pRspRepeal.RepealTimeInterval
        ###已经冲正次数
        pyRspRepeal.RepealedTimes = pRspRepeal.RepealedTimes
        ###银行冲正标志
        pyRspRepeal.BankRepealFlag = pRspRepeal.BankRepealFlag
        ###期商冲正标志
        pyRspRepeal.BrokerRepealFlag = pRspRepeal.BrokerRepealFlag
        ###被冲正平台流水号
        pyRspRepeal.PlateRepealSerial = pRspRepeal.PlateRepealSerial
        ###被冲正银行流水号
        pyRspRepeal.BankRepealSerial = pRspRepeal.BankRepealSerial
        ###被冲正期货流水号
        pyRspRepeal.FutureRepealSerial = pRspRepeal.FutureRepealSerial
        ###业务功能码
        pyRspRepeal.TradeCode = pRspRepeal.TradeCode
        ###银行代码
        pyRspRepeal.BankID = pRspRepeal.BankID
        ###银行分支机构代码
        pyRspRepeal.BankBranchID = pRspRepeal.BankBranchID
        ###期商代码
        pyRspRepeal.BrokerID = pRspRepeal.BrokerID
        ###期商分支机构代码
        pyRspRepeal.BrokerBranchID = pRspRepeal.BrokerBranchID
        ###交易日期
        pyRspRepeal.TradeDate = pRspRepeal.TradeDate
        ###交易时间
        pyRspRepeal.TradeTime = pRspRepeal.TradeTime
        ###银行流水号
        pyRspRepeal.BankSerial = pRspRepeal.BankSerial
        ###交易系统日期 
        pyRspRepeal.TradingDay = pRspRepeal.TradingDay
        ###银期平台消息流水号
        pyRspRepeal.PlateSerial = pRspRepeal.PlateSerial
        ###最后分片标志
        pyRspRepeal.LastFragment = pRspRepeal.LastFragment
        ###会话号
        pyRspRepeal.SessionID = pRspRepeal.SessionID
        ###客户姓名
        pyRspRepeal.CustomerName = pRspRepeal.CustomerName
        ###证件类型
        pyRspRepeal.IdCardType = pRspRepeal.IdCardType
        ###证件号码
        pyRspRepeal.IdentifiedCardNo = pRspRepeal.IdentifiedCardNo
        ###客户类型
        pyRspRepeal.CustType = pRspRepeal.CustType
        ###银行帐号
        pyRspRepeal.BankAccount = pRspRepeal.BankAccount
        ###银行密码
        pyRspRepeal.BankPassWord = pRspRepeal.BankPassWord
        ###投资者帐号
        pyRspRepeal.AccountID = pRspRepeal.AccountID
        ###期货密码
        pyRspRepeal.Password = pRspRepeal.Password
        ###安装编号
        pyRspRepeal.InstallID = pRspRepeal.InstallID
        ###期货公司流水号
        pyRspRepeal.FutureSerial = pRspRepeal.FutureSerial
        ###用户标识
        pyRspRepeal.UserID = pRspRepeal.UserID
        ###验证客户证件号码标志
        pyRspRepeal.VerifyCertNoFlag = pRspRepeal.VerifyCertNoFlag
        ###币种代码
        pyRspRepeal.CurrencyID = pRspRepeal.CurrencyID
        ###转帐金额
        pyRspRepeal.TradeAmount = pRspRepeal.TradeAmount
        ###期货可取金额
        pyRspRepeal.FutureFetchAmount = pRspRepeal.FutureFetchAmount
        ###费用支付标志
        pyRspRepeal.FeePayFlag = pRspRepeal.FeePayFlag
        ###应收客户费用
        pyRspRepeal.CustFee = pRspRepeal.CustFee
        ###应收期货公司费用
        pyRspRepeal.BrokerFee = pRspRepeal.BrokerFee
        ###发送方给接收方的消息
        pyRspRepeal.Message = pRspRepeal.Message
        ###摘要
        pyRspRepeal.Digest = pRspRepeal.Digest
        ###银行帐号类型
        pyRspRepeal.BankAccType = pRspRepeal.BankAccType
        ###渠道标志
        pyRspRepeal.DeviceID = pRspRepeal.DeviceID
        ###期货单位帐号类型
        pyRspRepeal.BankSecuAccType = pRspRepeal.BankSecuAccType
        ###期货公司银行编码
        pyRspRepeal.BrokerIDByBank = pRspRepeal.BrokerIDByBank
        ###期货单位帐号
        pyRspRepeal.BankSecuAcc = pRspRepeal.BankSecuAcc
        ###银行密码标志
        pyRspRepeal.BankPwdFlag = pRspRepeal.BankPwdFlag
        ###期货资金密码核对标志
        pyRspRepeal.SecuPwdFlag = pRspRepeal.SecuPwdFlag
        ###交易柜员
        pyRspRepeal.OperNo = pRspRepeal.OperNo
        ###请求编号
        pyRspRepeal.RequestID = pRspRepeal.RequestID
        ###交易ID
        pyRspRepeal.TID = pRspRepeal.TID
        ###转账交易状态
        pyRspRepeal.TransferStatus = pRspRepeal.TransferStatus
        ###错误代码
        pyRspRepeal.ErrorID = pRspRepeal.ErrorID
        ###错误信息
        pyRspRepeal.ErrorMsg = pRspRepeal.ErrorMsg
    
        attr_decode(pyRspRepeal)
    
    clsTdSpiResponse.OnRtnRepealFromBankToFutureByFutureManual(pyRspRepeal)

# 系统运行时期货端手工发起冲正期货转银行请求，银行处理完毕后报盘发回的通知
cdef extern void OnStaticRtnRepealFromFutureToBankByFutureManual(CThostFtdcRspRepealField *pRspRepeal):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspRepeal = None
    if pRspRepeal:
        pyRspRepeal = pyThostFtdcRspRepealField()
    
        ###冲正时间间隔
        pyRspRepeal.RepealTimeInterval = pRspRepeal.RepealTimeInterval
        ###已经冲正次数
        pyRspRepeal.RepealedTimes = pRspRepeal.RepealedTimes
        ###银行冲正标志
        pyRspRepeal.BankRepealFlag = pRspRepeal.BankRepealFlag
        ###期商冲正标志
        pyRspRepeal.BrokerRepealFlag = pRspRepeal.BrokerRepealFlag
        ###被冲正平台流水号
        pyRspRepeal.PlateRepealSerial = pRspRepeal.PlateRepealSerial
        ###被冲正银行流水号
        pyRspRepeal.BankRepealSerial = pRspRepeal.BankRepealSerial
        ###被冲正期货流水号
        pyRspRepeal.FutureRepealSerial = pRspRepeal.FutureRepealSerial
        ###业务功能码
        pyRspRepeal.TradeCode = pRspRepeal.TradeCode
        ###银行代码
        pyRspRepeal.BankID = pRspRepeal.BankID
        ###银行分支机构代码
        pyRspRepeal.BankBranchID = pRspRepeal.BankBranchID
        ###期商代码
        pyRspRepeal.BrokerID = pRspRepeal.BrokerID
        ###期商分支机构代码
        pyRspRepeal.BrokerBranchID = pRspRepeal.BrokerBranchID
        ###交易日期
        pyRspRepeal.TradeDate = pRspRepeal.TradeDate
        ###交易时间
        pyRspRepeal.TradeTime = pRspRepeal.TradeTime
        ###银行流水号
        pyRspRepeal.BankSerial = pRspRepeal.BankSerial
        ###交易系统日期 
        pyRspRepeal.TradingDay = pRspRepeal.TradingDay
        ###银期平台消息流水号
        pyRspRepeal.PlateSerial = pRspRepeal.PlateSerial
        ###最后分片标志
        pyRspRepeal.LastFragment = pRspRepeal.LastFragment
        ###会话号
        pyRspRepeal.SessionID = pRspRepeal.SessionID
        ###客户姓名
        pyRspRepeal.CustomerName = pRspRepeal.CustomerName
        ###证件类型
        pyRspRepeal.IdCardType = pRspRepeal.IdCardType
        ###证件号码
        pyRspRepeal.IdentifiedCardNo = pRspRepeal.IdentifiedCardNo
        ###客户类型
        pyRspRepeal.CustType = pRspRepeal.CustType
        ###银行帐号
        pyRspRepeal.BankAccount = pRspRepeal.BankAccount
        ###银行密码
        pyRspRepeal.BankPassWord = pRspRepeal.BankPassWord
        ###投资者帐号
        pyRspRepeal.AccountID = pRspRepeal.AccountID
        ###期货密码
        pyRspRepeal.Password = pRspRepeal.Password
        ###安装编号
        pyRspRepeal.InstallID = pRspRepeal.InstallID
        ###期货公司流水号
        pyRspRepeal.FutureSerial = pRspRepeal.FutureSerial
        ###用户标识
        pyRspRepeal.UserID = pRspRepeal.UserID
        ###验证客户证件号码标志
        pyRspRepeal.VerifyCertNoFlag = pRspRepeal.VerifyCertNoFlag
        ###币种代码
        pyRspRepeal.CurrencyID = pRspRepeal.CurrencyID
        ###转帐金额
        pyRspRepeal.TradeAmount = pRspRepeal.TradeAmount
        ###期货可取金额
        pyRspRepeal.FutureFetchAmount = pRspRepeal.FutureFetchAmount
        ###费用支付标志
        pyRspRepeal.FeePayFlag = pRspRepeal.FeePayFlag
        ###应收客户费用
        pyRspRepeal.CustFee = pRspRepeal.CustFee
        ###应收期货公司费用
        pyRspRepeal.BrokerFee = pRspRepeal.BrokerFee
        ###发送方给接收方的消息
        pyRspRepeal.Message = pRspRepeal.Message
        ###摘要
        pyRspRepeal.Digest = pRspRepeal.Digest
        ###银行帐号类型
        pyRspRepeal.BankAccType = pRspRepeal.BankAccType
        ###渠道标志
        pyRspRepeal.DeviceID = pRspRepeal.DeviceID
        ###期货单位帐号类型
        pyRspRepeal.BankSecuAccType = pRspRepeal.BankSecuAccType
        ###期货公司银行编码
        pyRspRepeal.BrokerIDByBank = pRspRepeal.BrokerIDByBank
        ###期货单位帐号
        pyRspRepeal.BankSecuAcc = pRspRepeal.BankSecuAcc
        ###银行密码标志
        pyRspRepeal.BankPwdFlag = pRspRepeal.BankPwdFlag
        ###期货资金密码核对标志
        pyRspRepeal.SecuPwdFlag = pRspRepeal.SecuPwdFlag
        ###交易柜员
        pyRspRepeal.OperNo = pRspRepeal.OperNo
        ###请求编号
        pyRspRepeal.RequestID = pRspRepeal.RequestID
        ###交易ID
        pyRspRepeal.TID = pRspRepeal.TID
        ###转账交易状态
        pyRspRepeal.TransferStatus = pRspRepeal.TransferStatus
        ###错误代码
        pyRspRepeal.ErrorID = pRspRepeal.ErrorID
        ###错误信息
        pyRspRepeal.ErrorMsg = pRspRepeal.ErrorMsg
    
        attr_decode(pyRspRepeal)
    
    clsTdSpiResponse.OnRtnRepealFromFutureToBankByFutureManual(pyRspRepeal)

# 期货发起查询银行余额通知
cdef extern void OnStaticRtnQueryBankBalanceByFuture(CThostFtdcNotifyQueryAccountField *pNotifyQueryAccount):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyNotifyQueryAccount = None
    if pNotifyQueryAccount:
        pyNotifyQueryAccount = pyThostFtdcNotifyQueryAccountField()
    
        ###业务功能码
        pyNotifyQueryAccount.TradeCode = pNotifyQueryAccount.TradeCode
        ###银行代码
        pyNotifyQueryAccount.BankID = pNotifyQueryAccount.BankID
        ###银行分支机构代码
        pyNotifyQueryAccount.BankBranchID = pNotifyQueryAccount.BankBranchID
        ###期商代码
        pyNotifyQueryAccount.BrokerID = pNotifyQueryAccount.BrokerID
        ###期商分支机构代码
        pyNotifyQueryAccount.BrokerBranchID = pNotifyQueryAccount.BrokerBranchID
        ###交易日期
        pyNotifyQueryAccount.TradeDate = pNotifyQueryAccount.TradeDate
        ###交易时间
        pyNotifyQueryAccount.TradeTime = pNotifyQueryAccount.TradeTime
        ###银行流水号
        pyNotifyQueryAccount.BankSerial = pNotifyQueryAccount.BankSerial
        ###交易系统日期 
        pyNotifyQueryAccount.TradingDay = pNotifyQueryAccount.TradingDay
        ###银期平台消息流水号
        pyNotifyQueryAccount.PlateSerial = pNotifyQueryAccount.PlateSerial
        ###最后分片标志
        pyNotifyQueryAccount.LastFragment = pNotifyQueryAccount.LastFragment
        ###会话号
        pyNotifyQueryAccount.SessionID = pNotifyQueryAccount.SessionID
        ###客户姓名
        pyNotifyQueryAccount.CustomerName = pNotifyQueryAccount.CustomerName
        ###证件类型
        pyNotifyQueryAccount.IdCardType = pNotifyQueryAccount.IdCardType
        ###证件号码
        pyNotifyQueryAccount.IdentifiedCardNo = pNotifyQueryAccount.IdentifiedCardNo
        ###客户类型
        pyNotifyQueryAccount.CustType = pNotifyQueryAccount.CustType
        ###银行帐号
        pyNotifyQueryAccount.BankAccount = pNotifyQueryAccount.BankAccount
        ###银行密码
        pyNotifyQueryAccount.BankPassWord = pNotifyQueryAccount.BankPassWord
        ###投资者帐号
        pyNotifyQueryAccount.AccountID = pNotifyQueryAccount.AccountID
        ###期货密码
        pyNotifyQueryAccount.Password = pNotifyQueryAccount.Password
        ###期货公司流水号
        pyNotifyQueryAccount.FutureSerial = pNotifyQueryAccount.FutureSerial
        ###安装编号
        pyNotifyQueryAccount.InstallID = pNotifyQueryAccount.InstallID
        ###用户标识
        pyNotifyQueryAccount.UserID = pNotifyQueryAccount.UserID
        ###验证客户证件号码标志
        pyNotifyQueryAccount.VerifyCertNoFlag = pNotifyQueryAccount.VerifyCertNoFlag
        ###币种代码
        pyNotifyQueryAccount.CurrencyID = pNotifyQueryAccount.CurrencyID
        ###摘要
        pyNotifyQueryAccount.Digest = pNotifyQueryAccount.Digest
        ###银行帐号类型
        pyNotifyQueryAccount.BankAccType = pNotifyQueryAccount.BankAccType
        ###渠道标志
        pyNotifyQueryAccount.DeviceID = pNotifyQueryAccount.DeviceID
        ###期货单位帐号类型
        pyNotifyQueryAccount.BankSecuAccType = pNotifyQueryAccount.BankSecuAccType
        ###期货公司银行编码
        pyNotifyQueryAccount.BrokerIDByBank = pNotifyQueryAccount.BrokerIDByBank
        ###期货单位帐号
        pyNotifyQueryAccount.BankSecuAcc = pNotifyQueryAccount.BankSecuAcc
        ###银行密码标志
        pyNotifyQueryAccount.BankPwdFlag = pNotifyQueryAccount.BankPwdFlag
        ###期货资金密码核对标志
        pyNotifyQueryAccount.SecuPwdFlag = pNotifyQueryAccount.SecuPwdFlag
        ###交易柜员
        pyNotifyQueryAccount.OperNo = pNotifyQueryAccount.OperNo
        ###请求编号
        pyNotifyQueryAccount.RequestID = pNotifyQueryAccount.RequestID
        ###交易ID
        pyNotifyQueryAccount.TID = pNotifyQueryAccount.TID
        ###银行可用金额
        pyNotifyQueryAccount.BankUseAmount = pNotifyQueryAccount.BankUseAmount
        ###银行可取金额
        pyNotifyQueryAccount.BankFetchAmount = pNotifyQueryAccount.BankFetchAmount
        ###错误代码
        pyNotifyQueryAccount.ErrorID = pNotifyQueryAccount.ErrorID
        ###错误信息
        pyNotifyQueryAccount.ErrorMsg = pNotifyQueryAccount.ErrorMsg
    
        attr_decode(pyNotifyQueryAccount)
    
    clsTdSpiResponse.OnRtnQueryBankBalanceByFuture(pyNotifyQueryAccount)

# 期货发起银行资金转期货错误回报
cdef extern void OnStaticErrRtnBankToFutureByFuture(CThostFtdcReqTransferField *pReqTransfer, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyReqTransfer = None
    if pReqTransfer:
        pyReqTransfer = pyThostFtdcReqTransferField()
    
        ###业务功能码
        pyReqTransfer.TradeCode = pReqTransfer.TradeCode
        ###银行代码
        pyReqTransfer.BankID = pReqTransfer.BankID
        ###银行分支机构代码
        pyReqTransfer.BankBranchID = pReqTransfer.BankBranchID
        ###期商代码
        pyReqTransfer.BrokerID = pReqTransfer.BrokerID
        ###期商分支机构代码
        pyReqTransfer.BrokerBranchID = pReqTransfer.BrokerBranchID
        ###交易日期
        pyReqTransfer.TradeDate = pReqTransfer.TradeDate
        ###交易时间
        pyReqTransfer.TradeTime = pReqTransfer.TradeTime
        ###银行流水号
        pyReqTransfer.BankSerial = pReqTransfer.BankSerial
        ###交易系统日期 
        pyReqTransfer.TradingDay = pReqTransfer.TradingDay
        ###银期平台消息流水号
        pyReqTransfer.PlateSerial = pReqTransfer.PlateSerial
        ###最后分片标志
        pyReqTransfer.LastFragment = pReqTransfer.LastFragment
        ###会话号
        pyReqTransfer.SessionID = pReqTransfer.SessionID
        ###客户姓名
        pyReqTransfer.CustomerName = pReqTransfer.CustomerName
        ###证件类型
        pyReqTransfer.IdCardType = pReqTransfer.IdCardType
        ###证件号码
        pyReqTransfer.IdentifiedCardNo = pReqTransfer.IdentifiedCardNo
        ###客户类型
        pyReqTransfer.CustType = pReqTransfer.CustType
        ###银行帐号
        pyReqTransfer.BankAccount = pReqTransfer.BankAccount
        ###银行密码
        pyReqTransfer.BankPassWord = pReqTransfer.BankPassWord
        ###投资者帐号
        pyReqTransfer.AccountID = pReqTransfer.AccountID
        ###期货密码
        pyReqTransfer.Password = pReqTransfer.Password
        ###安装编号
        pyReqTransfer.InstallID = pReqTransfer.InstallID
        ###期货公司流水号
        pyReqTransfer.FutureSerial = pReqTransfer.FutureSerial
        ###用户标识
        pyReqTransfer.UserID = pReqTransfer.UserID
        ###验证客户证件号码标志
        pyReqTransfer.VerifyCertNoFlag = pReqTransfer.VerifyCertNoFlag
        ###币种代码
        pyReqTransfer.CurrencyID = pReqTransfer.CurrencyID
        ###转帐金额
        pyReqTransfer.TradeAmount = pReqTransfer.TradeAmount
        ###期货可取金额
        pyReqTransfer.FutureFetchAmount = pReqTransfer.FutureFetchAmount
        ###费用支付标志
        pyReqTransfer.FeePayFlag = pReqTransfer.FeePayFlag
        ###应收客户费用
        pyReqTransfer.CustFee = pReqTransfer.CustFee
        ###应收期货公司费用
        pyReqTransfer.BrokerFee = pReqTransfer.BrokerFee
        ###发送方给接收方的消息
        pyReqTransfer.Message = pReqTransfer.Message
        ###摘要
        pyReqTransfer.Digest = pReqTransfer.Digest
        ###银行帐号类型
        pyReqTransfer.BankAccType = pReqTransfer.BankAccType
        ###渠道标志
        pyReqTransfer.DeviceID = pReqTransfer.DeviceID
        ###期货单位帐号类型
        pyReqTransfer.BankSecuAccType = pReqTransfer.BankSecuAccType
        ###期货公司银行编码
        pyReqTransfer.BrokerIDByBank = pReqTransfer.BrokerIDByBank
        ###期货单位帐号
        pyReqTransfer.BankSecuAcc = pReqTransfer.BankSecuAcc
        ###银行密码标志
        pyReqTransfer.BankPwdFlag = pReqTransfer.BankPwdFlag
        ###期货资金密码核对标志
        pyReqTransfer.SecuPwdFlag = pReqTransfer.SecuPwdFlag
        ###交易柜员
        pyReqTransfer.OperNo = pReqTransfer.OperNo
        ###请求编号
        pyReqTransfer.RequestID = pReqTransfer.RequestID
        ###交易ID
        pyReqTransfer.TID = pReqTransfer.TID
        ###转账交易状态
        pyReqTransfer.TransferStatus = pReqTransfer.TransferStatus
    
        attr_decode(pyReqTransfer)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnBankToFutureByFuture(pyReqTransfer, pyRspInfo)

# 期货发起期货资金转银行错误回报
cdef extern void OnStaticErrRtnFutureToBankByFuture(CThostFtdcReqTransferField *pReqTransfer, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyReqTransfer = None
    if pReqTransfer:
        pyReqTransfer = pyThostFtdcReqTransferField()
    
        ###业务功能码
        pyReqTransfer.TradeCode = pReqTransfer.TradeCode
        ###银行代码
        pyReqTransfer.BankID = pReqTransfer.BankID
        ###银行分支机构代码
        pyReqTransfer.BankBranchID = pReqTransfer.BankBranchID
        ###期商代码
        pyReqTransfer.BrokerID = pReqTransfer.BrokerID
        ###期商分支机构代码
        pyReqTransfer.BrokerBranchID = pReqTransfer.BrokerBranchID
        ###交易日期
        pyReqTransfer.TradeDate = pReqTransfer.TradeDate
        ###交易时间
        pyReqTransfer.TradeTime = pReqTransfer.TradeTime
        ###银行流水号
        pyReqTransfer.BankSerial = pReqTransfer.BankSerial
        ###交易系统日期 
        pyReqTransfer.TradingDay = pReqTransfer.TradingDay
        ###银期平台消息流水号
        pyReqTransfer.PlateSerial = pReqTransfer.PlateSerial
        ###最后分片标志
        pyReqTransfer.LastFragment = pReqTransfer.LastFragment
        ###会话号
        pyReqTransfer.SessionID = pReqTransfer.SessionID
        ###客户姓名
        pyReqTransfer.CustomerName = pReqTransfer.CustomerName
        ###证件类型
        pyReqTransfer.IdCardType = pReqTransfer.IdCardType
        ###证件号码
        pyReqTransfer.IdentifiedCardNo = pReqTransfer.IdentifiedCardNo
        ###客户类型
        pyReqTransfer.CustType = pReqTransfer.CustType
        ###银行帐号
        pyReqTransfer.BankAccount = pReqTransfer.BankAccount
        ###银行密码
        pyReqTransfer.BankPassWord = pReqTransfer.BankPassWord
        ###投资者帐号
        pyReqTransfer.AccountID = pReqTransfer.AccountID
        ###期货密码
        pyReqTransfer.Password = pReqTransfer.Password
        ###安装编号
        pyReqTransfer.InstallID = pReqTransfer.InstallID
        ###期货公司流水号
        pyReqTransfer.FutureSerial = pReqTransfer.FutureSerial
        ###用户标识
        pyReqTransfer.UserID = pReqTransfer.UserID
        ###验证客户证件号码标志
        pyReqTransfer.VerifyCertNoFlag = pReqTransfer.VerifyCertNoFlag
        ###币种代码
        pyReqTransfer.CurrencyID = pReqTransfer.CurrencyID
        ###转帐金额
        pyReqTransfer.TradeAmount = pReqTransfer.TradeAmount
        ###期货可取金额
        pyReqTransfer.FutureFetchAmount = pReqTransfer.FutureFetchAmount
        ###费用支付标志
        pyReqTransfer.FeePayFlag = pReqTransfer.FeePayFlag
        ###应收客户费用
        pyReqTransfer.CustFee = pReqTransfer.CustFee
        ###应收期货公司费用
        pyReqTransfer.BrokerFee = pReqTransfer.BrokerFee
        ###发送方给接收方的消息
        pyReqTransfer.Message = pReqTransfer.Message
        ###摘要
        pyReqTransfer.Digest = pReqTransfer.Digest
        ###银行帐号类型
        pyReqTransfer.BankAccType = pReqTransfer.BankAccType
        ###渠道标志
        pyReqTransfer.DeviceID = pReqTransfer.DeviceID
        ###期货单位帐号类型
        pyReqTransfer.BankSecuAccType = pReqTransfer.BankSecuAccType
        ###期货公司银行编码
        pyReqTransfer.BrokerIDByBank = pReqTransfer.BrokerIDByBank
        ###期货单位帐号
        pyReqTransfer.BankSecuAcc = pReqTransfer.BankSecuAcc
        ###银行密码标志
        pyReqTransfer.BankPwdFlag = pReqTransfer.BankPwdFlag
        ###期货资金密码核对标志
        pyReqTransfer.SecuPwdFlag = pReqTransfer.SecuPwdFlag
        ###交易柜员
        pyReqTransfer.OperNo = pReqTransfer.OperNo
        ###请求编号
        pyReqTransfer.RequestID = pReqTransfer.RequestID
        ###交易ID
        pyReqTransfer.TID = pReqTransfer.TID
        ###转账交易状态
        pyReqTransfer.TransferStatus = pReqTransfer.TransferStatus
    
        attr_decode(pyReqTransfer)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnFutureToBankByFuture(pyReqTransfer, pyRspInfo)

# 系统运行时期货端手工发起冲正银行转期货错误回报
cdef extern void OnStaticErrRtnRepealBankToFutureByFutureManual(CThostFtdcReqRepealField *pReqRepeal, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyReqRepeal = None
    if pReqRepeal:
        pyReqRepeal = pyThostFtdcReqRepealField()
    
        ###冲正时间间隔
        pyReqRepeal.RepealTimeInterval = pReqRepeal.RepealTimeInterval
        ###已经冲正次数
        pyReqRepeal.RepealedTimes = pReqRepeal.RepealedTimes
        ###银行冲正标志
        pyReqRepeal.BankRepealFlag = pReqRepeal.BankRepealFlag
        ###期商冲正标志
        pyReqRepeal.BrokerRepealFlag = pReqRepeal.BrokerRepealFlag
        ###被冲正平台流水号
        pyReqRepeal.PlateRepealSerial = pReqRepeal.PlateRepealSerial
        ###被冲正银行流水号
        pyReqRepeal.BankRepealSerial = pReqRepeal.BankRepealSerial
        ###被冲正期货流水号
        pyReqRepeal.FutureRepealSerial = pReqRepeal.FutureRepealSerial
        ###业务功能码
        pyReqRepeal.TradeCode = pReqRepeal.TradeCode
        ###银行代码
        pyReqRepeal.BankID = pReqRepeal.BankID
        ###银行分支机构代码
        pyReqRepeal.BankBranchID = pReqRepeal.BankBranchID
        ###期商代码
        pyReqRepeal.BrokerID = pReqRepeal.BrokerID
        ###期商分支机构代码
        pyReqRepeal.BrokerBranchID = pReqRepeal.BrokerBranchID
        ###交易日期
        pyReqRepeal.TradeDate = pReqRepeal.TradeDate
        ###交易时间
        pyReqRepeal.TradeTime = pReqRepeal.TradeTime
        ###银行流水号
        pyReqRepeal.BankSerial = pReqRepeal.BankSerial
        ###交易系统日期 
        pyReqRepeal.TradingDay = pReqRepeal.TradingDay
        ###银期平台消息流水号
        pyReqRepeal.PlateSerial = pReqRepeal.PlateSerial
        ###最后分片标志
        pyReqRepeal.LastFragment = pReqRepeal.LastFragment
        ###会话号
        pyReqRepeal.SessionID = pReqRepeal.SessionID
        ###客户姓名
        pyReqRepeal.CustomerName = pReqRepeal.CustomerName
        ###证件类型
        pyReqRepeal.IdCardType = pReqRepeal.IdCardType
        ###证件号码
        pyReqRepeal.IdentifiedCardNo = pReqRepeal.IdentifiedCardNo
        ###客户类型
        pyReqRepeal.CustType = pReqRepeal.CustType
        ###银行帐号
        pyReqRepeal.BankAccount = pReqRepeal.BankAccount
        ###银行密码
        pyReqRepeal.BankPassWord = pReqRepeal.BankPassWord
        ###投资者帐号
        pyReqRepeal.AccountID = pReqRepeal.AccountID
        ###期货密码
        pyReqRepeal.Password = pReqRepeal.Password
        ###安装编号
        pyReqRepeal.InstallID = pReqRepeal.InstallID
        ###期货公司流水号
        pyReqRepeal.FutureSerial = pReqRepeal.FutureSerial
        ###用户标识
        pyReqRepeal.UserID = pReqRepeal.UserID
        ###验证客户证件号码标志
        pyReqRepeal.VerifyCertNoFlag = pReqRepeal.VerifyCertNoFlag
        ###币种代码
        pyReqRepeal.CurrencyID = pReqRepeal.CurrencyID
        ###转帐金额
        pyReqRepeal.TradeAmount = pReqRepeal.TradeAmount
        ###期货可取金额
        pyReqRepeal.FutureFetchAmount = pReqRepeal.FutureFetchAmount
        ###费用支付标志
        pyReqRepeal.FeePayFlag = pReqRepeal.FeePayFlag
        ###应收客户费用
        pyReqRepeal.CustFee = pReqRepeal.CustFee
        ###应收期货公司费用
        pyReqRepeal.BrokerFee = pReqRepeal.BrokerFee
        ###发送方给接收方的消息
        pyReqRepeal.Message = pReqRepeal.Message
        ###摘要
        pyReqRepeal.Digest = pReqRepeal.Digest
        ###银行帐号类型
        pyReqRepeal.BankAccType = pReqRepeal.BankAccType
        ###渠道标志
        pyReqRepeal.DeviceID = pReqRepeal.DeviceID
        ###期货单位帐号类型
        pyReqRepeal.BankSecuAccType = pReqRepeal.BankSecuAccType
        ###期货公司银行编码
        pyReqRepeal.BrokerIDByBank = pReqRepeal.BrokerIDByBank
        ###期货单位帐号
        pyReqRepeal.BankSecuAcc = pReqRepeal.BankSecuAcc
        ###银行密码标志
        pyReqRepeal.BankPwdFlag = pReqRepeal.BankPwdFlag
        ###期货资金密码核对标志
        pyReqRepeal.SecuPwdFlag = pReqRepeal.SecuPwdFlag
        ###交易柜员
        pyReqRepeal.OperNo = pReqRepeal.OperNo
        ###请求编号
        pyReqRepeal.RequestID = pReqRepeal.RequestID
        ###交易ID
        pyReqRepeal.TID = pReqRepeal.TID
        ###转账交易状态
        pyReqRepeal.TransferStatus = pReqRepeal.TransferStatus
    
        attr_decode(pyReqRepeal)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnRepealBankToFutureByFutureManual(pyReqRepeal, pyRspInfo)

# 系统运行时期货端手工发起冲正期货转银行错误回报
cdef extern void OnStaticErrRtnRepealFutureToBankByFutureManual(CThostFtdcReqRepealField *pReqRepeal, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyReqRepeal = None
    if pReqRepeal:
        pyReqRepeal = pyThostFtdcReqRepealField()
    
        ###冲正时间间隔
        pyReqRepeal.RepealTimeInterval = pReqRepeal.RepealTimeInterval
        ###已经冲正次数
        pyReqRepeal.RepealedTimes = pReqRepeal.RepealedTimes
        ###银行冲正标志
        pyReqRepeal.BankRepealFlag = pReqRepeal.BankRepealFlag
        ###期商冲正标志
        pyReqRepeal.BrokerRepealFlag = pReqRepeal.BrokerRepealFlag
        ###被冲正平台流水号
        pyReqRepeal.PlateRepealSerial = pReqRepeal.PlateRepealSerial
        ###被冲正银行流水号
        pyReqRepeal.BankRepealSerial = pReqRepeal.BankRepealSerial
        ###被冲正期货流水号
        pyReqRepeal.FutureRepealSerial = pReqRepeal.FutureRepealSerial
        ###业务功能码
        pyReqRepeal.TradeCode = pReqRepeal.TradeCode
        ###银行代码
        pyReqRepeal.BankID = pReqRepeal.BankID
        ###银行分支机构代码
        pyReqRepeal.BankBranchID = pReqRepeal.BankBranchID
        ###期商代码
        pyReqRepeal.BrokerID = pReqRepeal.BrokerID
        ###期商分支机构代码
        pyReqRepeal.BrokerBranchID = pReqRepeal.BrokerBranchID
        ###交易日期
        pyReqRepeal.TradeDate = pReqRepeal.TradeDate
        ###交易时间
        pyReqRepeal.TradeTime = pReqRepeal.TradeTime
        ###银行流水号
        pyReqRepeal.BankSerial = pReqRepeal.BankSerial
        ###交易系统日期 
        pyReqRepeal.TradingDay = pReqRepeal.TradingDay
        ###银期平台消息流水号
        pyReqRepeal.PlateSerial = pReqRepeal.PlateSerial
        ###最后分片标志
        pyReqRepeal.LastFragment = pReqRepeal.LastFragment
        ###会话号
        pyReqRepeal.SessionID = pReqRepeal.SessionID
        ###客户姓名
        pyReqRepeal.CustomerName = pReqRepeal.CustomerName
        ###证件类型
        pyReqRepeal.IdCardType = pReqRepeal.IdCardType
        ###证件号码
        pyReqRepeal.IdentifiedCardNo = pReqRepeal.IdentifiedCardNo
        ###客户类型
        pyReqRepeal.CustType = pReqRepeal.CustType
        ###银行帐号
        pyReqRepeal.BankAccount = pReqRepeal.BankAccount
        ###银行密码
        pyReqRepeal.BankPassWord = pReqRepeal.BankPassWord
        ###投资者帐号
        pyReqRepeal.AccountID = pReqRepeal.AccountID
        ###期货密码
        pyReqRepeal.Password = pReqRepeal.Password
        ###安装编号
        pyReqRepeal.InstallID = pReqRepeal.InstallID
        ###期货公司流水号
        pyReqRepeal.FutureSerial = pReqRepeal.FutureSerial
        ###用户标识
        pyReqRepeal.UserID = pReqRepeal.UserID
        ###验证客户证件号码标志
        pyReqRepeal.VerifyCertNoFlag = pReqRepeal.VerifyCertNoFlag
        ###币种代码
        pyReqRepeal.CurrencyID = pReqRepeal.CurrencyID
        ###转帐金额
        pyReqRepeal.TradeAmount = pReqRepeal.TradeAmount
        ###期货可取金额
        pyReqRepeal.FutureFetchAmount = pReqRepeal.FutureFetchAmount
        ###费用支付标志
        pyReqRepeal.FeePayFlag = pReqRepeal.FeePayFlag
        ###应收客户费用
        pyReqRepeal.CustFee = pReqRepeal.CustFee
        ###应收期货公司费用
        pyReqRepeal.BrokerFee = pReqRepeal.BrokerFee
        ###发送方给接收方的消息
        pyReqRepeal.Message = pReqRepeal.Message
        ###摘要
        pyReqRepeal.Digest = pReqRepeal.Digest
        ###银行帐号类型
        pyReqRepeal.BankAccType = pReqRepeal.BankAccType
        ###渠道标志
        pyReqRepeal.DeviceID = pReqRepeal.DeviceID
        ###期货单位帐号类型
        pyReqRepeal.BankSecuAccType = pReqRepeal.BankSecuAccType
        ###期货公司银行编码
        pyReqRepeal.BrokerIDByBank = pReqRepeal.BrokerIDByBank
        ###期货单位帐号
        pyReqRepeal.BankSecuAcc = pReqRepeal.BankSecuAcc
        ###银行密码标志
        pyReqRepeal.BankPwdFlag = pReqRepeal.BankPwdFlag
        ###期货资金密码核对标志
        pyReqRepeal.SecuPwdFlag = pReqRepeal.SecuPwdFlag
        ###交易柜员
        pyReqRepeal.OperNo = pReqRepeal.OperNo
        ###请求编号
        pyReqRepeal.RequestID = pReqRepeal.RequestID
        ###交易ID
        pyReqRepeal.TID = pReqRepeal.TID
        ###转账交易状态
        pyReqRepeal.TransferStatus = pReqRepeal.TransferStatus
    
        attr_decode(pyReqRepeal)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnRepealFutureToBankByFutureManual(pyReqRepeal, pyRspInfo)

# 期货发起查询银行余额错误回报
cdef extern void OnStaticErrRtnQueryBankBalanceByFuture(CThostFtdcReqQueryAccountField *pReqQueryAccount, CThostFtdcRspInfoField *pRspInfo):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyReqQueryAccount = None
    if pReqQueryAccount:
        pyReqQueryAccount = pyThostFtdcReqQueryAccountField()
    
        ###业务功能码
        pyReqQueryAccount.TradeCode = pReqQueryAccount.TradeCode
        ###银行代码
        pyReqQueryAccount.BankID = pReqQueryAccount.BankID
        ###银行分支机构代码
        pyReqQueryAccount.BankBranchID = pReqQueryAccount.BankBranchID
        ###期商代码
        pyReqQueryAccount.BrokerID = pReqQueryAccount.BrokerID
        ###期商分支机构代码
        pyReqQueryAccount.BrokerBranchID = pReqQueryAccount.BrokerBranchID
        ###交易日期
        pyReqQueryAccount.TradeDate = pReqQueryAccount.TradeDate
        ###交易时间
        pyReqQueryAccount.TradeTime = pReqQueryAccount.TradeTime
        ###银行流水号
        pyReqQueryAccount.BankSerial = pReqQueryAccount.BankSerial
        ###交易系统日期 
        pyReqQueryAccount.TradingDay = pReqQueryAccount.TradingDay
        ###银期平台消息流水号
        pyReqQueryAccount.PlateSerial = pReqQueryAccount.PlateSerial
        ###最后分片标志
        pyReqQueryAccount.LastFragment = pReqQueryAccount.LastFragment
        ###会话号
        pyReqQueryAccount.SessionID = pReqQueryAccount.SessionID
        ###客户姓名
        pyReqQueryAccount.CustomerName = pReqQueryAccount.CustomerName
        ###证件类型
        pyReqQueryAccount.IdCardType = pReqQueryAccount.IdCardType
        ###证件号码
        pyReqQueryAccount.IdentifiedCardNo = pReqQueryAccount.IdentifiedCardNo
        ###客户类型
        pyReqQueryAccount.CustType = pReqQueryAccount.CustType
        ###银行帐号
        pyReqQueryAccount.BankAccount = pReqQueryAccount.BankAccount
        ###银行密码
        pyReqQueryAccount.BankPassWord = pReqQueryAccount.BankPassWord
        ###投资者帐号
        pyReqQueryAccount.AccountID = pReqQueryAccount.AccountID
        ###期货密码
        pyReqQueryAccount.Password = pReqQueryAccount.Password
        ###期货公司流水号
        pyReqQueryAccount.FutureSerial = pReqQueryAccount.FutureSerial
        ###安装编号
        pyReqQueryAccount.InstallID = pReqQueryAccount.InstallID
        ###用户标识
        pyReqQueryAccount.UserID = pReqQueryAccount.UserID
        ###验证客户证件号码标志
        pyReqQueryAccount.VerifyCertNoFlag = pReqQueryAccount.VerifyCertNoFlag
        ###币种代码
        pyReqQueryAccount.CurrencyID = pReqQueryAccount.CurrencyID
        ###摘要
        pyReqQueryAccount.Digest = pReqQueryAccount.Digest
        ###银行帐号类型
        pyReqQueryAccount.BankAccType = pReqQueryAccount.BankAccType
        ###渠道标志
        pyReqQueryAccount.DeviceID = pReqQueryAccount.DeviceID
        ###期货单位帐号类型
        pyReqQueryAccount.BankSecuAccType = pReqQueryAccount.BankSecuAccType
        ###期货公司银行编码
        pyReqQueryAccount.BrokerIDByBank = pReqQueryAccount.BrokerIDByBank
        ###期货单位帐号
        pyReqQueryAccount.BankSecuAcc = pReqQueryAccount.BankSecuAcc
        ###银行密码标志
        pyReqQueryAccount.BankPwdFlag = pReqQueryAccount.BankPwdFlag
        ###期货资金密码核对标志
        pyReqQueryAccount.SecuPwdFlag = pReqQueryAccount.SecuPwdFlag
        ###交易柜员
        pyReqQueryAccount.OperNo = pReqQueryAccount.OperNo
        ###请求编号
        pyReqQueryAccount.RequestID = pReqQueryAccount.RequestID
        ###交易ID
        pyReqQueryAccount.TID = pReqQueryAccount.TID
    
        attr_decode(pyReqQueryAccount)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnErrRtnQueryBankBalanceByFuture(pyReqQueryAccount, pyRspInfo)

# 期货发起冲正银行转期货请求，银行处理完毕后报盘发回的通知
cdef extern void OnStaticRtnRepealFromBankToFutureByFuture(CThostFtdcRspRepealField *pRspRepeal):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspRepeal = None
    if pRspRepeal:
        pyRspRepeal = pyThostFtdcRspRepealField()
    
        ###冲正时间间隔
        pyRspRepeal.RepealTimeInterval = pRspRepeal.RepealTimeInterval
        ###已经冲正次数
        pyRspRepeal.RepealedTimes = pRspRepeal.RepealedTimes
        ###银行冲正标志
        pyRspRepeal.BankRepealFlag = pRspRepeal.BankRepealFlag
        ###期商冲正标志
        pyRspRepeal.BrokerRepealFlag = pRspRepeal.BrokerRepealFlag
        ###被冲正平台流水号
        pyRspRepeal.PlateRepealSerial = pRspRepeal.PlateRepealSerial
        ###被冲正银行流水号
        pyRspRepeal.BankRepealSerial = pRspRepeal.BankRepealSerial
        ###被冲正期货流水号
        pyRspRepeal.FutureRepealSerial = pRspRepeal.FutureRepealSerial
        ###业务功能码
        pyRspRepeal.TradeCode = pRspRepeal.TradeCode
        ###银行代码
        pyRspRepeal.BankID = pRspRepeal.BankID
        ###银行分支机构代码
        pyRspRepeal.BankBranchID = pRspRepeal.BankBranchID
        ###期商代码
        pyRspRepeal.BrokerID = pRspRepeal.BrokerID
        ###期商分支机构代码
        pyRspRepeal.BrokerBranchID = pRspRepeal.BrokerBranchID
        ###交易日期
        pyRspRepeal.TradeDate = pRspRepeal.TradeDate
        ###交易时间
        pyRspRepeal.TradeTime = pRspRepeal.TradeTime
        ###银行流水号
        pyRspRepeal.BankSerial = pRspRepeal.BankSerial
        ###交易系统日期 
        pyRspRepeal.TradingDay = pRspRepeal.TradingDay
        ###银期平台消息流水号
        pyRspRepeal.PlateSerial = pRspRepeal.PlateSerial
        ###最后分片标志
        pyRspRepeal.LastFragment = pRspRepeal.LastFragment
        ###会话号
        pyRspRepeal.SessionID = pRspRepeal.SessionID
        ###客户姓名
        pyRspRepeal.CustomerName = pRspRepeal.CustomerName
        ###证件类型
        pyRspRepeal.IdCardType = pRspRepeal.IdCardType
        ###证件号码
        pyRspRepeal.IdentifiedCardNo = pRspRepeal.IdentifiedCardNo
        ###客户类型
        pyRspRepeal.CustType = pRspRepeal.CustType
        ###银行帐号
        pyRspRepeal.BankAccount = pRspRepeal.BankAccount
        ###银行密码
        pyRspRepeal.BankPassWord = pRspRepeal.BankPassWord
        ###投资者帐号
        pyRspRepeal.AccountID = pRspRepeal.AccountID
        ###期货密码
        pyRspRepeal.Password = pRspRepeal.Password
        ###安装编号
        pyRspRepeal.InstallID = pRspRepeal.InstallID
        ###期货公司流水号
        pyRspRepeal.FutureSerial = pRspRepeal.FutureSerial
        ###用户标识
        pyRspRepeal.UserID = pRspRepeal.UserID
        ###验证客户证件号码标志
        pyRspRepeal.VerifyCertNoFlag = pRspRepeal.VerifyCertNoFlag
        ###币种代码
        pyRspRepeal.CurrencyID = pRspRepeal.CurrencyID
        ###转帐金额
        pyRspRepeal.TradeAmount = pRspRepeal.TradeAmount
        ###期货可取金额
        pyRspRepeal.FutureFetchAmount = pRspRepeal.FutureFetchAmount
        ###费用支付标志
        pyRspRepeal.FeePayFlag = pRspRepeal.FeePayFlag
        ###应收客户费用
        pyRspRepeal.CustFee = pRspRepeal.CustFee
        ###应收期货公司费用
        pyRspRepeal.BrokerFee = pRspRepeal.BrokerFee
        ###发送方给接收方的消息
        pyRspRepeal.Message = pRspRepeal.Message
        ###摘要
        pyRspRepeal.Digest = pRspRepeal.Digest
        ###银行帐号类型
        pyRspRepeal.BankAccType = pRspRepeal.BankAccType
        ###渠道标志
        pyRspRepeal.DeviceID = pRspRepeal.DeviceID
        ###期货单位帐号类型
        pyRspRepeal.BankSecuAccType = pRspRepeal.BankSecuAccType
        ###期货公司银行编码
        pyRspRepeal.BrokerIDByBank = pRspRepeal.BrokerIDByBank
        ###期货单位帐号
        pyRspRepeal.BankSecuAcc = pRspRepeal.BankSecuAcc
        ###银行密码标志
        pyRspRepeal.BankPwdFlag = pRspRepeal.BankPwdFlag
        ###期货资金密码核对标志
        pyRspRepeal.SecuPwdFlag = pRspRepeal.SecuPwdFlag
        ###交易柜员
        pyRspRepeal.OperNo = pRspRepeal.OperNo
        ###请求编号
        pyRspRepeal.RequestID = pRspRepeal.RequestID
        ###交易ID
        pyRspRepeal.TID = pRspRepeal.TID
        ###转账交易状态
        pyRspRepeal.TransferStatus = pRspRepeal.TransferStatus
        ###错误代码
        pyRspRepeal.ErrorID = pRspRepeal.ErrorID
        ###错误信息
        pyRspRepeal.ErrorMsg = pRspRepeal.ErrorMsg
    
        attr_decode(pyRspRepeal)
    
    clsTdSpiResponse.OnRtnRepealFromBankToFutureByFuture(pyRspRepeal)

# 期货发起冲正期货转银行请求，银行处理完毕后报盘发回的通知
cdef extern void OnStaticRtnRepealFromFutureToBankByFuture(CThostFtdcRspRepealField *pRspRepeal):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyRspRepeal = None
    if pRspRepeal:
        pyRspRepeal = pyThostFtdcRspRepealField()
    
        ###冲正时间间隔
        pyRspRepeal.RepealTimeInterval = pRspRepeal.RepealTimeInterval
        ###已经冲正次数
        pyRspRepeal.RepealedTimes = pRspRepeal.RepealedTimes
        ###银行冲正标志
        pyRspRepeal.BankRepealFlag = pRspRepeal.BankRepealFlag
        ###期商冲正标志
        pyRspRepeal.BrokerRepealFlag = pRspRepeal.BrokerRepealFlag
        ###被冲正平台流水号
        pyRspRepeal.PlateRepealSerial = pRspRepeal.PlateRepealSerial
        ###被冲正银行流水号
        pyRspRepeal.BankRepealSerial = pRspRepeal.BankRepealSerial
        ###被冲正期货流水号
        pyRspRepeal.FutureRepealSerial = pRspRepeal.FutureRepealSerial
        ###业务功能码
        pyRspRepeal.TradeCode = pRspRepeal.TradeCode
        ###银行代码
        pyRspRepeal.BankID = pRspRepeal.BankID
        ###银行分支机构代码
        pyRspRepeal.BankBranchID = pRspRepeal.BankBranchID
        ###期商代码
        pyRspRepeal.BrokerID = pRspRepeal.BrokerID
        ###期商分支机构代码
        pyRspRepeal.BrokerBranchID = pRspRepeal.BrokerBranchID
        ###交易日期
        pyRspRepeal.TradeDate = pRspRepeal.TradeDate
        ###交易时间
        pyRspRepeal.TradeTime = pRspRepeal.TradeTime
        ###银行流水号
        pyRspRepeal.BankSerial = pRspRepeal.BankSerial
        ###交易系统日期 
        pyRspRepeal.TradingDay = pRspRepeal.TradingDay
        ###银期平台消息流水号
        pyRspRepeal.PlateSerial = pRspRepeal.PlateSerial
        ###最后分片标志
        pyRspRepeal.LastFragment = pRspRepeal.LastFragment
        ###会话号
        pyRspRepeal.SessionID = pRspRepeal.SessionID
        ###客户姓名
        pyRspRepeal.CustomerName = pRspRepeal.CustomerName
        ###证件类型
        pyRspRepeal.IdCardType = pRspRepeal.IdCardType
        ###证件号码
        pyRspRepeal.IdentifiedCardNo = pRspRepeal.IdentifiedCardNo
        ###客户类型
        pyRspRepeal.CustType = pRspRepeal.CustType
        ###银行帐号
        pyRspRepeal.BankAccount = pRspRepeal.BankAccount
        ###银行密码
        pyRspRepeal.BankPassWord = pRspRepeal.BankPassWord
        ###投资者帐号
        pyRspRepeal.AccountID = pRspRepeal.AccountID
        ###期货密码
        pyRspRepeal.Password = pRspRepeal.Password
        ###安装编号
        pyRspRepeal.InstallID = pRspRepeal.InstallID
        ###期货公司流水号
        pyRspRepeal.FutureSerial = pRspRepeal.FutureSerial
        ###用户标识
        pyRspRepeal.UserID = pRspRepeal.UserID
        ###验证客户证件号码标志
        pyRspRepeal.VerifyCertNoFlag = pRspRepeal.VerifyCertNoFlag
        ###币种代码
        pyRspRepeal.CurrencyID = pRspRepeal.CurrencyID
        ###转帐金额
        pyRspRepeal.TradeAmount = pRspRepeal.TradeAmount
        ###期货可取金额
        pyRspRepeal.FutureFetchAmount = pRspRepeal.FutureFetchAmount
        ###费用支付标志
        pyRspRepeal.FeePayFlag = pRspRepeal.FeePayFlag
        ###应收客户费用
        pyRspRepeal.CustFee = pRspRepeal.CustFee
        ###应收期货公司费用
        pyRspRepeal.BrokerFee = pRspRepeal.BrokerFee
        ###发送方给接收方的消息
        pyRspRepeal.Message = pRspRepeal.Message
        ###摘要
        pyRspRepeal.Digest = pRspRepeal.Digest
        ###银行帐号类型
        pyRspRepeal.BankAccType = pRspRepeal.BankAccType
        ###渠道标志
        pyRspRepeal.DeviceID = pRspRepeal.DeviceID
        ###期货单位帐号类型
        pyRspRepeal.BankSecuAccType = pRspRepeal.BankSecuAccType
        ###期货公司银行编码
        pyRspRepeal.BrokerIDByBank = pRspRepeal.BrokerIDByBank
        ###期货单位帐号
        pyRspRepeal.BankSecuAcc = pRspRepeal.BankSecuAcc
        ###银行密码标志
        pyRspRepeal.BankPwdFlag = pRspRepeal.BankPwdFlag
        ###期货资金密码核对标志
        pyRspRepeal.SecuPwdFlag = pRspRepeal.SecuPwdFlag
        ###交易柜员
        pyRspRepeal.OperNo = pRspRepeal.OperNo
        ###请求编号
        pyRspRepeal.RequestID = pRspRepeal.RequestID
        ###交易ID
        pyRspRepeal.TID = pRspRepeal.TID
        ###转账交易状态
        pyRspRepeal.TransferStatus = pRspRepeal.TransferStatus
        ###错误代码
        pyRspRepeal.ErrorID = pRspRepeal.ErrorID
        ###错误信息
        pyRspRepeal.ErrorMsg = pRspRepeal.ErrorMsg
    
        attr_decode(pyRspRepeal)
    
    clsTdSpiResponse.OnRtnRepealFromFutureToBankByFuture(pyRspRepeal)

# 期货发起银行资金转期货应答
cdef extern void OnStaticRspFromBankToFutureByFuture(CThostFtdcReqTransferField *pReqTransfer, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyReqTransfer = None
    if pReqTransfer:
        pyReqTransfer = pyThostFtdcReqTransferField()
    
        ###业务功能码
        pyReqTransfer.TradeCode = pReqTransfer.TradeCode
        ###银行代码
        pyReqTransfer.BankID = pReqTransfer.BankID
        ###银行分支机构代码
        pyReqTransfer.BankBranchID = pReqTransfer.BankBranchID
        ###期商代码
        pyReqTransfer.BrokerID = pReqTransfer.BrokerID
        ###期商分支机构代码
        pyReqTransfer.BrokerBranchID = pReqTransfer.BrokerBranchID
        ###交易日期
        pyReqTransfer.TradeDate = pReqTransfer.TradeDate
        ###交易时间
        pyReqTransfer.TradeTime = pReqTransfer.TradeTime
        ###银行流水号
        pyReqTransfer.BankSerial = pReqTransfer.BankSerial
        ###交易系统日期 
        pyReqTransfer.TradingDay = pReqTransfer.TradingDay
        ###银期平台消息流水号
        pyReqTransfer.PlateSerial = pReqTransfer.PlateSerial
        ###最后分片标志
        pyReqTransfer.LastFragment = pReqTransfer.LastFragment
        ###会话号
        pyReqTransfer.SessionID = pReqTransfer.SessionID
        ###客户姓名
        pyReqTransfer.CustomerName = pReqTransfer.CustomerName
        ###证件类型
        pyReqTransfer.IdCardType = pReqTransfer.IdCardType
        ###证件号码
        pyReqTransfer.IdentifiedCardNo = pReqTransfer.IdentifiedCardNo
        ###客户类型
        pyReqTransfer.CustType = pReqTransfer.CustType
        ###银行帐号
        pyReqTransfer.BankAccount = pReqTransfer.BankAccount
        ###银行密码
        pyReqTransfer.BankPassWord = pReqTransfer.BankPassWord
        ###投资者帐号
        pyReqTransfer.AccountID = pReqTransfer.AccountID
        ###期货密码
        pyReqTransfer.Password = pReqTransfer.Password
        ###安装编号
        pyReqTransfer.InstallID = pReqTransfer.InstallID
        ###期货公司流水号
        pyReqTransfer.FutureSerial = pReqTransfer.FutureSerial
        ###用户标识
        pyReqTransfer.UserID = pReqTransfer.UserID
        ###验证客户证件号码标志
        pyReqTransfer.VerifyCertNoFlag = pReqTransfer.VerifyCertNoFlag
        ###币种代码
        pyReqTransfer.CurrencyID = pReqTransfer.CurrencyID
        ###转帐金额
        pyReqTransfer.TradeAmount = pReqTransfer.TradeAmount
        ###期货可取金额
        pyReqTransfer.FutureFetchAmount = pReqTransfer.FutureFetchAmount
        ###费用支付标志
        pyReqTransfer.FeePayFlag = pReqTransfer.FeePayFlag
        ###应收客户费用
        pyReqTransfer.CustFee = pReqTransfer.CustFee
        ###应收期货公司费用
        pyReqTransfer.BrokerFee = pReqTransfer.BrokerFee
        ###发送方给接收方的消息
        pyReqTransfer.Message = pReqTransfer.Message
        ###摘要
        pyReqTransfer.Digest = pReqTransfer.Digest
        ###银行帐号类型
        pyReqTransfer.BankAccType = pReqTransfer.BankAccType
        ###渠道标志
        pyReqTransfer.DeviceID = pReqTransfer.DeviceID
        ###期货单位帐号类型
        pyReqTransfer.BankSecuAccType = pReqTransfer.BankSecuAccType
        ###期货公司银行编码
        pyReqTransfer.BrokerIDByBank = pReqTransfer.BrokerIDByBank
        ###期货单位帐号
        pyReqTransfer.BankSecuAcc = pReqTransfer.BankSecuAcc
        ###银行密码标志
        pyReqTransfer.BankPwdFlag = pReqTransfer.BankPwdFlag
        ###期货资金密码核对标志
        pyReqTransfer.SecuPwdFlag = pReqTransfer.SecuPwdFlag
        ###交易柜员
        pyReqTransfer.OperNo = pReqTransfer.OperNo
        ###请求编号
        pyReqTransfer.RequestID = pReqTransfer.RequestID
        ###交易ID
        pyReqTransfer.TID = pReqTransfer.TID
        ###转账交易状态
        pyReqTransfer.TransferStatus = pReqTransfer.TransferStatus
    
        attr_decode(pyReqTransfer)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspFromBankToFutureByFuture(pyReqTransfer, pyRspInfo, nRequestID, bIsLast)

# 期货发起期货资金转银行应答
cdef extern void OnStaticRspFromFutureToBankByFuture(CThostFtdcReqTransferField *pReqTransfer, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyReqTransfer = None
    if pReqTransfer:
        pyReqTransfer = pyThostFtdcReqTransferField()
    
        ###业务功能码
        pyReqTransfer.TradeCode = pReqTransfer.TradeCode
        ###银行代码
        pyReqTransfer.BankID = pReqTransfer.BankID
        ###银行分支机构代码
        pyReqTransfer.BankBranchID = pReqTransfer.BankBranchID
        ###期商代码
        pyReqTransfer.BrokerID = pReqTransfer.BrokerID
        ###期商分支机构代码
        pyReqTransfer.BrokerBranchID = pReqTransfer.BrokerBranchID
        ###交易日期
        pyReqTransfer.TradeDate = pReqTransfer.TradeDate
        ###交易时间
        pyReqTransfer.TradeTime = pReqTransfer.TradeTime
        ###银行流水号
        pyReqTransfer.BankSerial = pReqTransfer.BankSerial
        ###交易系统日期 
        pyReqTransfer.TradingDay = pReqTransfer.TradingDay
        ###银期平台消息流水号
        pyReqTransfer.PlateSerial = pReqTransfer.PlateSerial
        ###最后分片标志
        pyReqTransfer.LastFragment = pReqTransfer.LastFragment
        ###会话号
        pyReqTransfer.SessionID = pReqTransfer.SessionID
        ###客户姓名
        pyReqTransfer.CustomerName = pReqTransfer.CustomerName
        ###证件类型
        pyReqTransfer.IdCardType = pReqTransfer.IdCardType
        ###证件号码
        pyReqTransfer.IdentifiedCardNo = pReqTransfer.IdentifiedCardNo
        ###客户类型
        pyReqTransfer.CustType = pReqTransfer.CustType
        ###银行帐号
        pyReqTransfer.BankAccount = pReqTransfer.BankAccount
        ###银行密码
        pyReqTransfer.BankPassWord = pReqTransfer.BankPassWord
        ###投资者帐号
        pyReqTransfer.AccountID = pReqTransfer.AccountID
        ###期货密码
        pyReqTransfer.Password = pReqTransfer.Password
        ###安装编号
        pyReqTransfer.InstallID = pReqTransfer.InstallID
        ###期货公司流水号
        pyReqTransfer.FutureSerial = pReqTransfer.FutureSerial
        ###用户标识
        pyReqTransfer.UserID = pReqTransfer.UserID
        ###验证客户证件号码标志
        pyReqTransfer.VerifyCertNoFlag = pReqTransfer.VerifyCertNoFlag
        ###币种代码
        pyReqTransfer.CurrencyID = pReqTransfer.CurrencyID
        ###转帐金额
        pyReqTransfer.TradeAmount = pReqTransfer.TradeAmount
        ###期货可取金额
        pyReqTransfer.FutureFetchAmount = pReqTransfer.FutureFetchAmount
        ###费用支付标志
        pyReqTransfer.FeePayFlag = pReqTransfer.FeePayFlag
        ###应收客户费用
        pyReqTransfer.CustFee = pReqTransfer.CustFee
        ###应收期货公司费用
        pyReqTransfer.BrokerFee = pReqTransfer.BrokerFee
        ###发送方给接收方的消息
        pyReqTransfer.Message = pReqTransfer.Message
        ###摘要
        pyReqTransfer.Digest = pReqTransfer.Digest
        ###银行帐号类型
        pyReqTransfer.BankAccType = pReqTransfer.BankAccType
        ###渠道标志
        pyReqTransfer.DeviceID = pReqTransfer.DeviceID
        ###期货单位帐号类型
        pyReqTransfer.BankSecuAccType = pReqTransfer.BankSecuAccType
        ###期货公司银行编码
        pyReqTransfer.BrokerIDByBank = pReqTransfer.BrokerIDByBank
        ###期货单位帐号
        pyReqTransfer.BankSecuAcc = pReqTransfer.BankSecuAcc
        ###银行密码标志
        pyReqTransfer.BankPwdFlag = pReqTransfer.BankPwdFlag
        ###期货资金密码核对标志
        pyReqTransfer.SecuPwdFlag = pReqTransfer.SecuPwdFlag
        ###交易柜员
        pyReqTransfer.OperNo = pReqTransfer.OperNo
        ###请求编号
        pyReqTransfer.RequestID = pReqTransfer.RequestID
        ###交易ID
        pyReqTransfer.TID = pReqTransfer.TID
        ###转账交易状态
        pyReqTransfer.TransferStatus = pReqTransfer.TransferStatus
    
        attr_decode(pyReqTransfer)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspFromFutureToBankByFuture(pyReqTransfer, pyRspInfo, nRequestID, bIsLast)

# 期货发起查询银行余额应答
cdef extern void OnStaticRspQueryBankAccountMoneyByFuture(CThostFtdcReqQueryAccountField *pReqQueryAccount, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyReqQueryAccount = None
    if pReqQueryAccount:
        pyReqQueryAccount = pyThostFtdcReqQueryAccountField()
    
        ###业务功能码
        pyReqQueryAccount.TradeCode = pReqQueryAccount.TradeCode
        ###银行代码
        pyReqQueryAccount.BankID = pReqQueryAccount.BankID
        ###银行分支机构代码
        pyReqQueryAccount.BankBranchID = pReqQueryAccount.BankBranchID
        ###期商代码
        pyReqQueryAccount.BrokerID = pReqQueryAccount.BrokerID
        ###期商分支机构代码
        pyReqQueryAccount.BrokerBranchID = pReqQueryAccount.BrokerBranchID
        ###交易日期
        pyReqQueryAccount.TradeDate = pReqQueryAccount.TradeDate
        ###交易时间
        pyReqQueryAccount.TradeTime = pReqQueryAccount.TradeTime
        ###银行流水号
        pyReqQueryAccount.BankSerial = pReqQueryAccount.BankSerial
        ###交易系统日期 
        pyReqQueryAccount.TradingDay = pReqQueryAccount.TradingDay
        ###银期平台消息流水号
        pyReqQueryAccount.PlateSerial = pReqQueryAccount.PlateSerial
        ###最后分片标志
        pyReqQueryAccount.LastFragment = pReqQueryAccount.LastFragment
        ###会话号
        pyReqQueryAccount.SessionID = pReqQueryAccount.SessionID
        ###客户姓名
        pyReqQueryAccount.CustomerName = pReqQueryAccount.CustomerName
        ###证件类型
        pyReqQueryAccount.IdCardType = pReqQueryAccount.IdCardType
        ###证件号码
        pyReqQueryAccount.IdentifiedCardNo = pReqQueryAccount.IdentifiedCardNo
        ###客户类型
        pyReqQueryAccount.CustType = pReqQueryAccount.CustType
        ###银行帐号
        pyReqQueryAccount.BankAccount = pReqQueryAccount.BankAccount
        ###银行密码
        pyReqQueryAccount.BankPassWord = pReqQueryAccount.BankPassWord
        ###投资者帐号
        pyReqQueryAccount.AccountID = pReqQueryAccount.AccountID
        ###期货密码
        pyReqQueryAccount.Password = pReqQueryAccount.Password
        ###期货公司流水号
        pyReqQueryAccount.FutureSerial = pReqQueryAccount.FutureSerial
        ###安装编号
        pyReqQueryAccount.InstallID = pReqQueryAccount.InstallID
        ###用户标识
        pyReqQueryAccount.UserID = pReqQueryAccount.UserID
        ###验证客户证件号码标志
        pyReqQueryAccount.VerifyCertNoFlag = pReqQueryAccount.VerifyCertNoFlag
        ###币种代码
        pyReqQueryAccount.CurrencyID = pReqQueryAccount.CurrencyID
        ###摘要
        pyReqQueryAccount.Digest = pReqQueryAccount.Digest
        ###银行帐号类型
        pyReqQueryAccount.BankAccType = pReqQueryAccount.BankAccType
        ###渠道标志
        pyReqQueryAccount.DeviceID = pReqQueryAccount.DeviceID
        ###期货单位帐号类型
        pyReqQueryAccount.BankSecuAccType = pReqQueryAccount.BankSecuAccType
        ###期货公司银行编码
        pyReqQueryAccount.BrokerIDByBank = pReqQueryAccount.BrokerIDByBank
        ###期货单位帐号
        pyReqQueryAccount.BankSecuAcc = pReqQueryAccount.BankSecuAcc
        ###银行密码标志
        pyReqQueryAccount.BankPwdFlag = pReqQueryAccount.BankPwdFlag
        ###期货资金密码核对标志
        pyReqQueryAccount.SecuPwdFlag = pReqQueryAccount.SecuPwdFlag
        ###交易柜员
        pyReqQueryAccount.OperNo = pReqQueryAccount.OperNo
        ###请求编号
        pyReqQueryAccount.RequestID = pReqQueryAccount.RequestID
        ###交易ID
        pyReqQueryAccount.TID = pReqQueryAccount.TID
    
        attr_decode(pyReqQueryAccount)
    
    pyRspInfo = None
    if pRspInfo:
        pyRspInfo = pyThostFtdcRspInfoField()
    
        ###错误代码
        pyRspInfo.ErrorID = pRspInfo.ErrorID #int
        ###错误信息
        pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]
    
        attr_decode(pyRspInfo)
    
    clsTdSpiResponse.OnRspQueryBankAccountMoneyByFuture(pyReqQueryAccount, pyRspInfo, nRequestID, bIsLast)

# 银行发起银期开户通知
cdef extern void OnStaticRtnOpenAccountByBank(CThostFtdcOpenAccountField *pOpenAccount):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyOpenAccount = None
    if pOpenAccount:
        pyOpenAccount = pyThostFtdcOpenAccountField()
    
        ###业务功能码
        pyOpenAccount.TradeCode = pOpenAccount.TradeCode
        ###银行代码
        pyOpenAccount.BankID = pOpenAccount.BankID
        ###银行分支机构代码
        pyOpenAccount.BankBranchID = pOpenAccount.BankBranchID
        ###期商代码
        pyOpenAccount.BrokerID = pOpenAccount.BrokerID
        ###期商分支机构代码
        pyOpenAccount.BrokerBranchID = pOpenAccount.BrokerBranchID
        ###交易日期
        pyOpenAccount.TradeDate = pOpenAccount.TradeDate
        ###交易时间
        pyOpenAccount.TradeTime = pOpenAccount.TradeTime
        ###银行流水号
        pyOpenAccount.BankSerial = pOpenAccount.BankSerial
        ###交易系统日期 
        pyOpenAccount.TradingDay = pOpenAccount.TradingDay
        ###银期平台消息流水号
        pyOpenAccount.PlateSerial = pOpenAccount.PlateSerial
        ###最后分片标志
        pyOpenAccount.LastFragment = pOpenAccount.LastFragment
        ###会话号
        pyOpenAccount.SessionID = pOpenAccount.SessionID
        ###客户姓名
        pyOpenAccount.CustomerName = pOpenAccount.CustomerName
        ###证件类型
        pyOpenAccount.IdCardType = pOpenAccount.IdCardType
        ###证件号码
        pyOpenAccount.IdentifiedCardNo = pOpenAccount.IdentifiedCardNo
        ###性别
        pyOpenAccount.Gender = pOpenAccount.Gender
        ###国家代码
        pyOpenAccount.CountryCode = pOpenAccount.CountryCode
        ###客户类型
        pyOpenAccount.CustType = pOpenAccount.CustType
        ###地址
        pyOpenAccount.Address = pOpenAccount.Address
        ###邮编
        pyOpenAccount.ZipCode = pOpenAccount.ZipCode
        ###电话号码
        pyOpenAccount.Telephone = pOpenAccount.Telephone
        ###手机
        pyOpenAccount.MobilePhone = pOpenAccount.MobilePhone
        ###传真
        pyOpenAccount.Fax = pOpenAccount.Fax
        ###电子邮件
        pyOpenAccount.EMail = pOpenAccount.EMail
        ###资金账户状态
        pyOpenAccount.MoneyAccountStatus = pOpenAccount.MoneyAccountStatus
        ###银行帐号
        pyOpenAccount.BankAccount = pOpenAccount.BankAccount
        ###银行密码
        pyOpenAccount.BankPassWord = pOpenAccount.BankPassWord
        ###投资者帐号
        pyOpenAccount.AccountID = pOpenAccount.AccountID
        ###期货密码
        pyOpenAccount.Password = pOpenAccount.Password
        ###安装编号
        pyOpenAccount.InstallID = pOpenAccount.InstallID
        ###验证客户证件号码标志
        pyOpenAccount.VerifyCertNoFlag = pOpenAccount.VerifyCertNoFlag
        ###币种代码
        pyOpenAccount.CurrencyID = pOpenAccount.CurrencyID
        ###汇钞标志
        pyOpenAccount.CashExchangeCode = pOpenAccount.CashExchangeCode
        ###摘要
        pyOpenAccount.Digest = pOpenAccount.Digest
        ###银行帐号类型
        pyOpenAccount.BankAccType = pOpenAccount.BankAccType
        ###渠道标志
        pyOpenAccount.DeviceID = pOpenAccount.DeviceID
        ###期货单位帐号类型
        pyOpenAccount.BankSecuAccType = pOpenAccount.BankSecuAccType
        ###期货公司银行编码
        pyOpenAccount.BrokerIDByBank = pOpenAccount.BrokerIDByBank
        ###期货单位帐号
        pyOpenAccount.BankSecuAcc = pOpenAccount.BankSecuAcc
        ###银行密码标志
        pyOpenAccount.BankPwdFlag = pOpenAccount.BankPwdFlag
        ###期货资金密码核对标志
        pyOpenAccount.SecuPwdFlag = pOpenAccount.SecuPwdFlag
        ###交易柜员
        pyOpenAccount.OperNo = pOpenAccount.OperNo
        ###交易ID
        pyOpenAccount.TID = pOpenAccount.TID
        ###用户标识
        pyOpenAccount.UserID = pOpenAccount.UserID
        ###错误代码
        pyOpenAccount.ErrorID = pOpenAccount.ErrorID
        ###错误信息
        pyOpenAccount.ErrorMsg = pOpenAccount.ErrorMsg
    
        attr_decode(pyOpenAccount)
    
    clsTdSpiResponse.OnRtnOpenAccountByBank(pyOpenAccount)

# 银行发起银期销户通知
cdef extern void OnStaticRtnCancelAccountByBank(CThostFtdcCancelAccountField *pCancelAccount):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyCancelAccount = None
    if pCancelAccount:
        pyCancelAccount = pyThostFtdcCancelAccountField()
    
        ###业务功能码
        pyCancelAccount.TradeCode = pCancelAccount.TradeCode
        ###银行代码
        pyCancelAccount.BankID = pCancelAccount.BankID
        ###银行分支机构代码
        pyCancelAccount.BankBranchID = pCancelAccount.BankBranchID
        ###期商代码
        pyCancelAccount.BrokerID = pCancelAccount.BrokerID
        ###期商分支机构代码
        pyCancelAccount.BrokerBranchID = pCancelAccount.BrokerBranchID
        ###交易日期
        pyCancelAccount.TradeDate = pCancelAccount.TradeDate
        ###交易时间
        pyCancelAccount.TradeTime = pCancelAccount.TradeTime
        ###银行流水号
        pyCancelAccount.BankSerial = pCancelAccount.BankSerial
        ###交易系统日期 
        pyCancelAccount.TradingDay = pCancelAccount.TradingDay
        ###银期平台消息流水号
        pyCancelAccount.PlateSerial = pCancelAccount.PlateSerial
        ###最后分片标志
        pyCancelAccount.LastFragment = pCancelAccount.LastFragment
        ###会话号
        pyCancelAccount.SessionID = pCancelAccount.SessionID
        ###客户姓名
        pyCancelAccount.CustomerName = pCancelAccount.CustomerName
        ###证件类型
        pyCancelAccount.IdCardType = pCancelAccount.IdCardType
        ###证件号码
        pyCancelAccount.IdentifiedCardNo = pCancelAccount.IdentifiedCardNo
        ###性别
        pyCancelAccount.Gender = pCancelAccount.Gender
        ###国家代码
        pyCancelAccount.CountryCode = pCancelAccount.CountryCode
        ###客户类型
        pyCancelAccount.CustType = pCancelAccount.CustType
        ###地址
        pyCancelAccount.Address = pCancelAccount.Address
        ###邮编
        pyCancelAccount.ZipCode = pCancelAccount.ZipCode
        ###电话号码
        pyCancelAccount.Telephone = pCancelAccount.Telephone
        ###手机
        pyCancelAccount.MobilePhone = pCancelAccount.MobilePhone
        ###传真
        pyCancelAccount.Fax = pCancelAccount.Fax
        ###电子邮件
        pyCancelAccount.EMail = pCancelAccount.EMail
        ###资金账户状态
        pyCancelAccount.MoneyAccountStatus = pCancelAccount.MoneyAccountStatus
        ###银行帐号
        pyCancelAccount.BankAccount = pCancelAccount.BankAccount
        ###银行密码
        pyCancelAccount.BankPassWord = pCancelAccount.BankPassWord
        ###投资者帐号
        pyCancelAccount.AccountID = pCancelAccount.AccountID
        ###期货密码
        pyCancelAccount.Password = pCancelAccount.Password
        ###安装编号
        pyCancelAccount.InstallID = pCancelAccount.InstallID
        ###验证客户证件号码标志
        pyCancelAccount.VerifyCertNoFlag = pCancelAccount.VerifyCertNoFlag
        ###币种代码
        pyCancelAccount.CurrencyID = pCancelAccount.CurrencyID
        ###汇钞标志
        pyCancelAccount.CashExchangeCode = pCancelAccount.CashExchangeCode
        ###摘要
        pyCancelAccount.Digest = pCancelAccount.Digest
        ###银行帐号类型
        pyCancelAccount.BankAccType = pCancelAccount.BankAccType
        ###渠道标志
        pyCancelAccount.DeviceID = pCancelAccount.DeviceID
        ###期货单位帐号类型
        pyCancelAccount.BankSecuAccType = pCancelAccount.BankSecuAccType
        ###期货公司银行编码
        pyCancelAccount.BrokerIDByBank = pCancelAccount.BrokerIDByBank
        ###期货单位帐号
        pyCancelAccount.BankSecuAcc = pCancelAccount.BankSecuAcc
        ###银行密码标志
        pyCancelAccount.BankPwdFlag = pCancelAccount.BankPwdFlag
        ###期货资金密码核对标志
        pyCancelAccount.SecuPwdFlag = pCancelAccount.SecuPwdFlag
        ###交易柜员
        pyCancelAccount.OperNo = pCancelAccount.OperNo
        ###交易ID
        pyCancelAccount.TID = pCancelAccount.TID
        ###用户标识
        pyCancelAccount.UserID = pCancelAccount.UserID
        ###错误代码
        pyCancelAccount.ErrorID = pCancelAccount.ErrorID
        ###错误信息
        pyCancelAccount.ErrorMsg = pCancelAccount.ErrorMsg
    
        attr_decode(pyCancelAccount)
    
    clsTdSpiResponse.OnRtnCancelAccountByBank(pyCancelAccount)

# 银行发起变更银行账号通知
cdef extern void OnStaticRtnChangeAccountByBank(CThostFtdcChangeAccountField *pChangeAccount):
    if not clsTdSpiResponse:
        return

    if not isinstance(clsTdSpiResponse, TdSpiResponse):
        raise TypeError

    pyChangeAccount = None
    if pChangeAccount:
        pyChangeAccount = pyThostFtdcChangeAccountField()
    
        ###业务功能码
        pyChangeAccount.TradeCode = pChangeAccount.TradeCode
        ###银行代码
        pyChangeAccount.BankID = pChangeAccount.BankID
        ###银行分支机构代码
        pyChangeAccount.BankBranchID = pChangeAccount.BankBranchID
        ###期商代码
        pyChangeAccount.BrokerID = pChangeAccount.BrokerID
        ###期商分支机构代码
        pyChangeAccount.BrokerBranchID = pChangeAccount.BrokerBranchID
        ###交易日期
        pyChangeAccount.TradeDate = pChangeAccount.TradeDate
        ###交易时间
        pyChangeAccount.TradeTime = pChangeAccount.TradeTime
        ###银行流水号
        pyChangeAccount.BankSerial = pChangeAccount.BankSerial
        ###交易系统日期 
        pyChangeAccount.TradingDay = pChangeAccount.TradingDay
        ###银期平台消息流水号
        pyChangeAccount.PlateSerial = pChangeAccount.PlateSerial
        ###最后分片标志
        pyChangeAccount.LastFragment = pChangeAccount.LastFragment
        ###会话号
        pyChangeAccount.SessionID = pChangeAccount.SessionID
        ###客户姓名
        pyChangeAccount.CustomerName = pChangeAccount.CustomerName
        ###证件类型
        pyChangeAccount.IdCardType = pChangeAccount.IdCardType
        ###证件号码
        pyChangeAccount.IdentifiedCardNo = pChangeAccount.IdentifiedCardNo
        ###性别
        pyChangeAccount.Gender = pChangeAccount.Gender
        ###国家代码
        pyChangeAccount.CountryCode = pChangeAccount.CountryCode
        ###客户类型
        pyChangeAccount.CustType = pChangeAccount.CustType
        ###地址
        pyChangeAccount.Address = pChangeAccount.Address
        ###邮编
        pyChangeAccount.ZipCode = pChangeAccount.ZipCode
        ###电话号码
        pyChangeAccount.Telephone = pChangeAccount.Telephone
        ###手机
        pyChangeAccount.MobilePhone = pChangeAccount.MobilePhone
        ###传真
        pyChangeAccount.Fax = pChangeAccount.Fax
        ###电子邮件
        pyChangeAccount.EMail = pChangeAccount.EMail
        ###资金账户状态
        pyChangeAccount.MoneyAccountStatus = pChangeAccount.MoneyAccountStatus
        ###银行帐号
        pyChangeAccount.BankAccount = pChangeAccount.BankAccount
        ###银行密码
        pyChangeAccount.BankPassWord = pChangeAccount.BankPassWord
        ###新银行帐号
        pyChangeAccount.NewBankAccount = pChangeAccount.NewBankAccount
        ###新银行密码
        pyChangeAccount.NewBankPassWord = pChangeAccount.NewBankPassWord
        ###投资者帐号
        pyChangeAccount.AccountID = pChangeAccount.AccountID
        ###期货密码
        pyChangeAccount.Password = pChangeAccount.Password
        ###银行帐号类型
        pyChangeAccount.BankAccType = pChangeAccount.BankAccType
        ###安装编号
        pyChangeAccount.InstallID = pChangeAccount.InstallID
        ###验证客户证件号码标志
        pyChangeAccount.VerifyCertNoFlag = pChangeAccount.VerifyCertNoFlag
        ###币种代码
        pyChangeAccount.CurrencyID = pChangeAccount.CurrencyID
        ###期货公司银行编码
        pyChangeAccount.BrokerIDByBank = pChangeAccount.BrokerIDByBank
        ###银行密码标志
        pyChangeAccount.BankPwdFlag = pChangeAccount.BankPwdFlag
        ###期货资金密码核对标志
        pyChangeAccount.SecuPwdFlag = pChangeAccount.SecuPwdFlag
        ###交易ID
        pyChangeAccount.TID = pChangeAccount.TID
        ###摘要
        pyChangeAccount.Digest = pChangeAccount.Digest
        ###错误代码
        pyChangeAccount.ErrorID = pChangeAccount.ErrorID
        ###错误信息
        pyChangeAccount.ErrorMsg = pChangeAccount.ErrorMsg
    
        attr_decode(pyChangeAccount)
    
    clsTdSpiResponse.OnRtnChangeAccountByBank(pyChangeAccount)

cdef class PyTdApi:
    cdef TdApi * c_TdApi

    # 创建TdApi
    # @param pszFlowPath 存贮订阅信息文件的目录，默认为当前目录
    # @return 创建出的UserApi
    def __cinit__(self, pszFlowPath):
        self.c_TdApi = new TdApi(pszFlowPath.encode('gb2312'))

    def __dealloc__(self):
        del self.c_TdApi

    # 删除接口对象本身
    # @remark 不再使用本接口对象时,调用该函数删除接口对象
    def Release(self):
        self.c_TdApi.Release()

    # 初始化
    # @remark 初始化运行环境,只有调用后,接口才开始工作
    def Init(self):
        self.c_TdApi.Init()

    # 等待接口线程结束运行
    # @return 线程退出代码
    def Join(self):
        self.c_TdApi.Join()

    # 获取当前交易日
    # @retrun 获取到的交易日
    # @remark 只有登录成功后,才能得到正确的交易日
    def GetTradingDay(self):
        self.c_TdApi.GetTradingDay()

    # 注册前置机网络地址
    # @param pszFrontAddress：前置机网络地址。
    # @remark 网络地址的格式为：“protocol://ipaddress:port”，如：”tcp://127.0.0.1:17001”。 
    # @remark “tcp”代表传输协议，“127.0.0.1”代表服务器地址。”17001”代表服务器端口号。
    def RegisterFront(self, pszFrontAddress):
        self.c_TdApi.RegisterFront(pszFrontAddress.encode('gb2312'))

    # 注册名字服务器网络地址
    # @param pszNsAddress：名字服务器网络地址。
    # @remark 网络地址的格式为：“protocol://ipaddress:port”，如：”tcp://127.0.0.1:12001”。 
    # @remark “tcp”代表传输协议，“127.0.0.1”代表服务器地址。”12001”代表服务器端口号。
    # @remark RegisterNameServer优先于RegisterFront
    def RegisterNameServer(self, pszNsAddress):
        self.c_TdApi.RegisterNameServer(pszNsAddress.encode('gb2312'))

    # 注册名字服务器用户信息
    # @param pFensUserInfo：用户信息。
    def RegisterFensUserInfo(self, pyFensUserInfo):
        cdef CThostFtdcFensUserInfoField FensUserInfo

        pyFensUserInfo.encode()

        ###经纪公司代码
        FensUserInfo.BrokerID = pyFensUserInfo.BrokerID
        ###用户代码
        FensUserInfo.UserID = pyFensUserInfo.UserID
        ###登录模式
        FensUserInfo.LoginMode = pyFensUserInfo.LoginMode
        
        self.c_TdApi.RegisterFensUserInfo(&FensUserInfo)

    # 注册回调接口
    def RegisterSpi(self):
        self.c_TdApi.RegisterSpi()

    # 订阅私有流。
    # @param nResumeType 私有流重传方式  
    #         THOST_TERT_RESTART:从本交易日开始重传
    #         THOST_TERT_RESUME:从上次收到的续传
    #         THOST_TERT_QUICK:只传送登录后私有流的内容
    # @remark 该方法要在Init方法前调用。若不调用则不会收到私有流的数据。
    def SubscribePrivateTopic(self, nResumeType):
        self.c_TdApi.SubscribePrivateTopic(nResumeType)

    # 订阅公共流。
    # @param nResumeType 公共流重传方式  
    #         THOST_TERT_RESTART:从本交易日开始重传
    #         THOST_TERT_RESUME:从上次收到的续传
    #         THOST_TERT_QUICK:只传送登录后公共流的内容
    # @remark 该方法要在Init方法前调用。若不调用则不会收到公共流的数据。
    def SubscribePublicTopic(self, nResumeType):
        self.c_TdApi.SubscribePublicTopic(nResumeType)

    # 客户端认证请求
    def ReqAuthenticate(self, pyReqAuthenticateField, nRequestID):
        cdef CThostFtdcReqAuthenticateField ReqAuthenticateField

        pyReqAuthenticateField.encode()

        ###经纪公司代码
        ReqAuthenticateField.BrokerID = pyReqAuthenticateField.BrokerID
        ###用户代码
        ReqAuthenticateField.UserID = pyReqAuthenticateField.UserID
        ###用户端产品信息
        ReqAuthenticateField.UserProductInfo = pyReqAuthenticateField.UserProductInfo
        ###认证码
        ReqAuthenticateField.AuthCode = pyReqAuthenticateField.AuthCode
        
        self.c_TdApi.ReqAuthenticate(&ReqAuthenticateField, nRequestID)

    # 用户登录请求
    def ReqUserLogin(self, pyReqUserLoginField, nRequestID):
        cdef CThostFtdcReqUserLoginField ReqUserLoginField

        pyReqUserLoginField.encode()

        ###交易日
        ReqUserLoginField.TradingDay = pyReqUserLoginField.TradingDay
        ###经纪公司代码
        ReqUserLoginField.BrokerID = pyReqUserLoginField.BrokerID
        ###用户代码
        ReqUserLoginField.UserID = pyReqUserLoginField.UserID
        ###密码
        ReqUserLoginField.Password = pyReqUserLoginField.Password
        ###用户端产品信息
        ReqUserLoginField.UserProductInfo = pyReqUserLoginField.UserProductInfo
        ###接口端产品信息
        ReqUserLoginField.InterfaceProductInfo = pyReqUserLoginField.InterfaceProductInfo
        ###协议信息
        ReqUserLoginField.ProtocolInfo = pyReqUserLoginField.ProtocolInfo
        ###Mac地址
        ReqUserLoginField.MacAddress = pyReqUserLoginField.MacAddress
        ###动态密码
        ReqUserLoginField.OneTimePassword = pyReqUserLoginField.OneTimePassword
        ###终端IP地址
        ReqUserLoginField.ClientIPAddress = pyReqUserLoginField.ClientIPAddress
        
        self.c_TdApi.ReqUserLogin(&ReqUserLoginField, nRequestID)


    # 登出请求
    def ReqUserLogout(self, pyUserLogout, nRequestID):
        cdef CThostFtdcUserLogoutField UserLogout

        pyUserLogout.encode()

        ###经纪公司代码
        UserLogout.BrokerID = pyUserLogout.BrokerID
        ###用户代码
        UserLogout.UserID = pyUserLogout.UserID
        
        self.c_TdApi.ReqUserLogout(&UserLogout, nRequestID)

    # 用户口令更新请求
    def ReqUserPasswordUpdate(self, pyUserPasswordUpdate, nRequestID):
        cdef CThostFtdcUserPasswordUpdateField UserPasswordUpdate

        pyUserPasswordUpdate.encode()

        ###经纪公司代码
        UserPasswordUpdate.BrokerID = pyUserPasswordUpdate.BrokerID
        ###用户代码
        UserPasswordUpdate.UserID = pyUserPasswordUpdate.UserID
        ###原来的口令
        UserPasswordUpdate.OldPassword = pyUserPasswordUpdate.OldPassword
        ###新的口令
        UserPasswordUpdate.NewPassword = pyUserPasswordUpdate.NewPassword
        
        self.c_TdApi.ReqUserPasswordUpdate(&UserPasswordUpdate, nRequestID)

    # 资金账户口令更新请求
    def ReqTradingAccountPasswordUpdate(self, pyTradingAccountPasswordUpdate, nRequestID):
        cdef CThostFtdcTradingAccountPasswordUpdateField TradingAccountPasswordUpdate

        pyTradingAccountPasswordUpdate.encode()

        ###经纪公司代码
        TradingAccountPasswordUpdate.BrokerID = pyTradingAccountPasswordUpdate.BrokerID
        ###投资者帐号
        TradingAccountPasswordUpdate.AccountID = pyTradingAccountPasswordUpdate.AccountID
        ###原来的口令
        TradingAccountPasswordUpdate.OldPassword = pyTradingAccountPasswordUpdate.OldPassword
        ###新的口令
        TradingAccountPasswordUpdate.NewPassword = pyTradingAccountPasswordUpdate.NewPassword
        ###币种代码
        TradingAccountPasswordUpdate.CurrencyID = pyTradingAccountPasswordUpdate.CurrencyID
        
        self.c_TdApi.ReqTradingAccountPasswordUpdate(&TradingAccountPasswordUpdate, nRequestID)

    # 报单录入请求
    def ReqOrderInsert(self, pyInputOrder, nRequestID):
        cdef CThostFtdcInputOrderField InputOrder
        
        pyInputOrder.encode()

        ###经纪公司代码
        InputOrder.BrokerID = pyInputOrder.BrokerID
        ###投资者代码
        InputOrder.InvestorID = pyInputOrder.InvestorID
        ###合约代码
        InputOrder.InstrumentID = pyInputOrder.InstrumentID
        ###报单引用
        InputOrder.OrderRef = pyInputOrder.OrderRef
        ###用户代码
        InputOrder.UserID = pyInputOrder.UserID
        ###报单价格条件
        InputOrder.OrderPriceType = pyInputOrder.OrderPriceType
        ###买卖方向
        InputOrder.Direction = pyInputOrder.Direction
        ###组合开平标志
        InputOrder.CombOffsetFlag = pyInputOrder.CombOffsetFlag
        ###组合投机套保标志
        InputOrder.CombHedgeFlag = pyInputOrder.CombHedgeFlag
        ###价格
        InputOrder.LimitPrice = pyInputOrder.LimitPrice
        ###数量
        InputOrder.VolumeTotalOriginal = pyInputOrder.VolumeTotalOriginal
        ###有效期类型
        InputOrder.TimeCondition = pyInputOrder.TimeCondition
        ###GTD日期
        InputOrder.GTDDate = pyInputOrder.GTDDate
        ###成交量类型
        InputOrder.VolumeCondition = pyInputOrder.VolumeCondition
        ###最小成交量
        InputOrder.MinVolume = pyInputOrder.MinVolume
        ###触发条件
        InputOrder.ContingentCondition = pyInputOrder.ContingentCondition
        ###止损价
        InputOrder.StopPrice = pyInputOrder.StopPrice
        ###强平原因
        InputOrder.ForceCloseReason = pyInputOrder.ForceCloseReason
        ###自动挂起标志
        InputOrder.IsAutoSuspend = pyInputOrder.IsAutoSuspend
        ###业务单元
        InputOrder.BusinessUnit = pyInputOrder.BusinessUnit
        ###请求编号
        InputOrder.RequestID = pyInputOrder.RequestID
        ###用户强评标志
        InputOrder.UserForceClose = pyInputOrder.UserForceClose
        ###互换单标志
        InputOrder.IsSwapOrder = pyInputOrder.IsSwapOrder
        
        self.c_TdApi.ReqOrderInsert(&InputOrder, nRequestID)

    # 预埋单录入请求
    def ReqParkedOrderInsert(self, pyParkedOrder, nRequestID):
        cdef CThostFtdcParkedOrderField ParkedOrder

        pyParkedOrder.encode()

        ###经纪公司代码
        ParkedOrder.BrokerID = pyParkedOrder.BrokerID
        ###投资者代码
        ParkedOrder.InvestorID = pyParkedOrder.InvestorID
        ###合约代码
        ParkedOrder.InstrumentID = pyParkedOrder.InstrumentID
        ###报单引用
        ParkedOrder.OrderRef = pyParkedOrder.OrderRef
        ###用户代码
        ParkedOrder.UserID = pyParkedOrder.UserID
        ###报单价格条件
        ParkedOrder.OrderPriceType = pyParkedOrder.OrderPriceType
        ###买卖方向
        ParkedOrder.Direction = pyParkedOrder.Direction
        ###组合开平标志
        ParkedOrder.CombOffsetFlag = pyParkedOrder.CombOffsetFlag
        ###组合投机套保标志
        ParkedOrder.CombHedgeFlag = pyParkedOrder.CombHedgeFlag
        ###价格
        ParkedOrder.LimitPrice = pyParkedOrder.LimitPrice
        ###数量
        ParkedOrder.VolumeTotalOriginal = pyParkedOrder.VolumeTotalOriginal
        ###有效期类型
        ParkedOrder.TimeCondition = pyParkedOrder.TimeCondition
        ###GTD日期
        ParkedOrder.GTDDate = pyParkedOrder.GTDDate
        ###成交量类型
        ParkedOrder.VolumeCondition = pyParkedOrder.VolumeCondition
        ###最小成交量
        ParkedOrder.MinVolume = pyParkedOrder.MinVolume
        ###触发条件
        ParkedOrder.ContingentCondition = pyParkedOrder.ContingentCondition
        ###止损价
        ParkedOrder.StopPrice = pyParkedOrder.StopPrice
        ###强平原因
        ParkedOrder.ForceCloseReason = pyParkedOrder.ForceCloseReason
        ###自动挂起标志
        ParkedOrder.IsAutoSuspend = pyParkedOrder.IsAutoSuspend
        ###业务单元
        ParkedOrder.BusinessUnit = pyParkedOrder.BusinessUnit
        ###请求编号
        ParkedOrder.RequestID = pyParkedOrder.RequestID
        ###用户强评标志
        ParkedOrder.UserForceClose = pyParkedOrder.UserForceClose
        ###交易所代码
        ParkedOrder.ExchangeID = pyParkedOrder.ExchangeID
        ###预埋报单编号
        ParkedOrder.ParkedOrderID = pyParkedOrder.ParkedOrderID
        ###用户类型
        ParkedOrder.UserType = pyParkedOrder.UserType
        ###预埋单状态
        ParkedOrder.Status = pyParkedOrder.Status
        ###错误代码
        ParkedOrder.ErrorID = pyParkedOrder.ErrorID
        ###错误信息
        ParkedOrder.ErrorMsg = pyParkedOrder.ErrorMsg
        ###互换单标志
        ParkedOrder.IsSwapOrder = pyParkedOrder.IsSwapOrder
        
        self.c_TdApi.ReqParkedOrderInsert(&ParkedOrder, nRequestID)

    # 预埋撤单录入请求
    def ReqParkedOrderAction(self, pyParkedOrderAction, nRequestID):
        cdef CThostFtdcParkedOrderActionField ParkedOrderAction
        self.c_TdApi.ReqParkedOrderAction(&ParkedOrderAction, nRequestID)

    # 报单操作请求
    def ReqOrderAction(self, pyInputOrderAction, nRequestID):
        cdef CThostFtdcInputOrderActionField InputOrderAction
        self.c_TdApi.ReqOrderAction(&InputOrderAction, nRequestID)

    # 查询最大报单数量请求
    def ReqQueryMaxOrderVolume(self, pyQueryMaxOrderVolume, nRequestID):
        cdef CThostFtdcQueryMaxOrderVolumeField QueryMaxOrderVolume

        pyQueryMaxOrderVolume.encode()

        ###经纪公司代码
        QueryMaxOrderVolume.BrokerID = pyQueryMaxOrderVolume.BrokerID
        ###投资者代码
        QueryMaxOrderVolume.InvestorID = pyQueryMaxOrderVolume.InvestorID
        ###报单操作引用
        QueryMaxOrderVolume.OrderActionRef = pyQueryMaxOrderVolume.OrderActionRef
        ###报单引用
        QueryMaxOrderVolume.OrderRef = pyQueryMaxOrderVolume.OrderRef
        ###请求编号
        QueryMaxOrderVolume.RequestID = pyQueryMaxOrderVolume.RequestID
        ###前置编号
        QueryMaxOrderVolume.FrontID = pyQueryMaxOrderVolume.FrontID
        ###会话编号
        QueryMaxOrderVolume.SessionID = pyQueryMaxOrderVolume.SessionID
        ###交易所代码
        QueryMaxOrderVolume.ExchangeID = pyQueryMaxOrderVolume.ExchangeID
        ###报单编号
        QueryMaxOrderVolume.OrderSysID = pyQueryMaxOrderVolume.OrderSysID
        ###操作标志
        QueryMaxOrderVolume.ActionFlag = pyQueryMaxOrderVolume.ActionFlag
        ###价格
        QueryMaxOrderVolume.LimitPrice = pyQueryMaxOrderVolume.LimitPrice
        ###数量变化
        QueryMaxOrderVolume.VolumeChange = pyQueryMaxOrderVolume.VolumeChange
        ###用户代码
        QueryMaxOrderVolume.UserID = pyQueryMaxOrderVolume.UserID
        ###合约代码
        QueryMaxOrderVolume.InstrumentID = pyQueryMaxOrderVolume.InstrumentID
        ###预埋撤单单编号
        QueryMaxOrderVolume.ParkedOrderActionID = pyQueryMaxOrderVolume.ParkedOrderActionID
        ###用户类型
        QueryMaxOrderVolume.UserType = pyQueryMaxOrderVolume.UserType
        ###预埋撤单状态
        QueryMaxOrderVolume.Status = pyQueryMaxOrderVolume.Status
        ###错误代码
        QueryMaxOrderVolume.ErrorID = pyQueryMaxOrderVolume.ErrorID
        ###错误信息
        QueryMaxOrderVolume.ErrorMsg = pyQueryMaxOrderVolume.ErrorMsg
        
        self.c_TdApi.ReqQueryMaxOrderVolume(&QueryMaxOrderVolume, nRequestID)

    # 投资者结算结果确认
    def ReqSettlementInfoConfirm(self, pySettlementInfoConfirm, nRequestID):
        cdef CThostFtdcSettlementInfoConfirmField SettlementInfoConfirm

        pySettlementInfoConfirm.encode()

        ###经纪公司代码
        SettlementInfoConfirm.BrokerID = pySettlementInfoConfirm.BrokerID
        ###投资者代码
        SettlementInfoConfirm.InvestorID = pySettlementInfoConfirm.InvestorID
        ###确认日期
        SettlementInfoConfirm.ConfirmDate = pySettlementInfoConfirm.ConfirmDate
        ###确认时间
        SettlementInfoConfirm.ConfirmTime = pySettlementInfoConfirm.ConfirmTime
        
        self.c_TdApi.ReqSettlementInfoConfirm(&SettlementInfoConfirm, nRequestID)

    # 请求删除预埋单
    def ReqRemoveParkedOrder(self, pyRemoveParkedOrder, nRequestID):
        cdef CThostFtdcRemoveParkedOrderField RemoveParkedOrder

        pyRemoveParkedOrder.encode()

        ###经纪公司代码
        RemoveParkedOrder.BrokerID = pyRemoveParkedOrder.BrokerID
        ###投资者代码
        RemoveParkedOrder.InvestorID = pyRemoveParkedOrder.InvestorID
        ###预埋报单编号
        RemoveParkedOrder.ParkedOrderID = pyRemoveParkedOrder.ParkedOrderID
        
        self.c_TdApi.ReqRemoveParkedOrder(&RemoveParkedOrder, nRequestID)

    # 请求删除预埋撤单
    def ReqRemoveParkedOrderAction(self, pyRemoveParkedOrderAction, nRequestID):
        cdef CThostFtdcRemoveParkedOrderActionField RemoveParkedOrderAction

        pyRemoveParkedOrderAction.encode()

        ###经纪公司代码
        RemoveParkedOrderAction.BrokerID = pyRemoveParkedOrderAction.BrokerID
        ###投资者代码
        RemoveParkedOrderAction.InvestorID = pyRemoveParkedOrderAction.InvestorID
        ###预埋撤单编号
        RemoveParkedOrderAction.ParkedOrderActionID = pyRemoveParkedOrderAction.ParkedOrderActionID
        
        self.c_TdApi.ReqRemoveParkedOrderAction(&RemoveParkedOrderAction, nRequestID)

    # 执行宣告录入请求
    def ReqExecOrderInsert(self, pyInputExecOrder, nRequestID):
        cdef CThostFtdcInputExecOrderField InputExecOrder

        pyInputExecOrder.encode()

        ###经纪公司代码
        InputExecOrder.BrokerID = pyInputExecOrder.BrokerID
        ###投资者代码
        InputExecOrder.InvestorID = pyInputExecOrder.InvestorID
        ###合约代码
        InputExecOrder.InstrumentID = pyInputExecOrder.InstrumentID
        ###执行宣告引用
        InputExecOrder.ExecOrderRef = pyInputExecOrder.ExecOrderRef
        ###用户代码
        InputExecOrder.UserID = pyInputExecOrder.UserID
        ###数量
        InputExecOrder.Volume = pyInputExecOrder.Volume
        ###请求编号
        InputExecOrder.RequestID = pyInputExecOrder.RequestID
        ###业务单元
        InputExecOrder.BusinessUnit = pyInputExecOrder.BusinessUnit
        ###开平标志
        InputExecOrder.OffsetFlag = pyInputExecOrder.OffsetFlag
        ###投机套保标志
        InputExecOrder.HedgeFlag = pyInputExecOrder.HedgeFlag
        ###执行类型
        InputExecOrder.ActionType = pyInputExecOrder.ActionType
        ###保留头寸申请的持仓方向
        InputExecOrder.PosiDirection = pyInputExecOrder.PosiDirection
        ###期权行权后是否保留期货头寸的标记
        InputExecOrder.ReservePositionFlag = pyInputExecOrder.ReservePositionFlag
        ###期权行权后生成的头寸是否自动平仓
        InputExecOrder.CloseFlag = pyInputExecOrder.CloseFlag
        
        self.c_TdApi.ReqExecOrderInsert(&InputExecOrder, nRequestID)

    # 执行宣告操作请求
    def ReqExecOrderAction(self, pyInputExecOrderAction, nRequestID):
        cdef CThostFtdcInputExecOrderActionField InputExecOrderAction

        pyInputExecOrderAction.encode()

        ###经纪公司代码
        InputExecOrderAction.BrokerID = pyInputExecOrderAction.BrokerID
        ###投资者代码
        InputExecOrderAction.InvestorID = pyInputExecOrderAction.InvestorID
        ###执行宣告操作引用
        InputExecOrderAction.ExecOrderActionRef = pyInputExecOrderAction.ExecOrderActionRef
        ###执行宣告引用
        InputExecOrderAction.ExecOrderRef = pyInputExecOrderAction.ExecOrderRef
        ###请求编号
        InputExecOrderAction.RequestID = pyInputExecOrderAction.RequestID
        ###前置编号
        InputExecOrderAction.FrontID = pyInputExecOrderAction.FrontID
        ###会话编号
        InputExecOrderAction.SessionID = pyInputExecOrderAction.SessionID
        ###交易所代码
        InputExecOrderAction.ExchangeID = pyInputExecOrderAction.ExchangeID
        ###执行宣告操作编号
        InputExecOrderAction.ExecOrderSysID = pyInputExecOrderAction.ExecOrderSysID
        ###操作标志
        InputExecOrderAction.ActionFlag = pyInputExecOrderAction.ActionFlag
        ###用户代码
        InputExecOrderAction.UserID = pyInputExecOrderAction.UserID
        ###合约代码
        InputExecOrderAction.InstrumentID = pyInputExecOrderAction.InstrumentID
        
        self.c_TdApi.ReqExecOrderAction(&InputExecOrderAction, nRequestID)

    # 询价录入请求
    def ReqForQuoteInsert(self, pyInputForQuote, nRequestID):
        cdef CThostFtdcInputForQuoteField InputForQuote

        pyInputForQuote.encode()

        ###经纪公司代码
        InputForQuote.BrokerID = pyInputForQuote.BrokerID
        ###投资者代码
        InputForQuote.InvestorID = pyInputForQuote.InvestorID
        ###合约代码
        InputForQuote.InstrumentID = pyInputForQuote.InstrumentID
        ###询价引用
        InputForQuote.ForQuoteRef = pyInputForQuote.ForQuoteRef
        ###用户代码
        InputForQuote.UserID = pyInputForQuote.UserID
        
        self.c_TdApi.ReqForQuoteInsert(&InputForQuote, nRequestID)

    # 报价录入请求
    def ReqQuoteInsert(self, pyInputQuote, nRequestID):
        cdef CThostFtdcInputQuoteField InputQuote

        pyInputQuote.encode()

        ###经纪公司代码
        InputQuote.BrokerID = pyInputQuote.BrokerID
        ###投资者代码
        InputQuote.InvestorID = pyInputQuote.InvestorID
        ###合约代码
        InputQuote.InstrumentID = pyInputQuote.InstrumentID
        ###报价引用
        InputQuote.QuoteRef = pyInputQuote.QuoteRef
        ###用户代码
        InputQuote.UserID = pyInputQuote.UserID
        ###卖价格
        InputQuote.AskPrice = pyInputQuote.AskPrice
        ###买价格
        InputQuote.BidPrice = pyInputQuote.BidPrice
        ###卖数量
        InputQuote.AskVolume = pyInputQuote.AskVolume
        ###买数量
        InputQuote.BidVolume = pyInputQuote.BidVolume
        ###请求编号
        InputQuote.RequestID = pyInputQuote.RequestID
        ###业务单元
        InputQuote.BusinessUnit = pyInputQuote.BusinessUnit
        ###卖开平标志
        InputQuote.AskOffsetFlag = pyInputQuote.AskOffsetFlag
        ###买开平标志
        InputQuote.BidOffsetFlag = pyInputQuote.BidOffsetFlag
        ###卖投机套保标志
        InputQuote.AskHedgeFlag = pyInputQuote.AskHedgeFlag
        ###买投机套保标志
        InputQuote.BidHedgeFlag = pyInputQuote.BidHedgeFlag
        ###衍生卖报单引用
        InputQuote.AskOrderRef = pyInputQuote.AskOrderRef
        ###衍生买报单引用
        InputQuote.BidOrderRef = pyInputQuote.BidOrderRef
        ###应价编号
        InputQuote.ForQuoteSysID = pyInputQuote.ForQuoteSysID

        self.c_TdApi.ReqQuoteInsert(&InputQuote, nRequestID)

    # 报价操作请求
    def ReqQuoteAction(self, pyInputQuoteAction, nRequestID):
        cdef CThostFtdcInputQuoteActionField InputQuoteAction

        pyInputQuoteAction.encode()

        ###经纪公司代码
        InputQuoteAction.BrokerID = pyInputQuoteAction.BrokerID
        ###投资者代码
        InputQuoteAction.InvestorID = pyInputQuoteAction.InvestorID
        ###报价操作引用
        InputQuoteAction.QuoteActionRef = pyInputQuoteAction.QuoteActionRef
        ###报价引用
        InputQuoteAction.QuoteRef = pyInputQuoteAction.QuoteRef
        ###请求编号
        InputQuoteAction.RequestID = pyInputQuoteAction.RequestID
        ###前置编号
        InputQuoteAction.FrontID = pyInputQuoteAction.FrontID
        ###会话编号
        InputQuoteAction.SessionID = pyInputQuoteAction.SessionID
        ###交易所代码
        InputQuoteAction.ExchangeID = pyInputQuoteAction.ExchangeID
        ###报价操作编号
        InputQuoteAction.QuoteSysID = pyInputQuoteAction.QuoteSysID
        ###操作标志
        InputQuoteAction.ActionFlag = pyInputQuoteAction.ActionFlag
        ###用户代码
        InputQuoteAction.UserID = pyInputQuoteAction.UserID
        ###合约代码
        InputQuoteAction.InstrumentID = pyInputQuoteAction.InstrumentID
        
        self.c_TdApi.ReqQuoteAction(&InputQuoteAction, nRequestID)

    # 申请组合录入请求
    def ReqCombActionInsert(self, pyInputCombAction, nRequestID):
        cdef CThostFtdcInputCombActionField InputCombAction

        pyInputCombAction.encode()

        ###经纪公司代码
        InputCombAction.BrokerID = pyInputCombAction.BrokerID
        ###投资者代码
        InputCombAction.InvestorID = pyInputCombAction.InvestorID
        ###合约代码
        InputCombAction.InstrumentID = pyInputCombAction.InstrumentID
        ###组合引用
        InputCombAction.CombActionRef = pyInputCombAction.CombActionRef
        ###用户代码
        InputCombAction.UserID = pyInputCombAction.UserID
        ###买卖方向
        InputCombAction.Direction = pyInputCombAction.Direction
        ###数量
        InputCombAction.Volume = pyInputCombAction.Volume
        ###组合指令方向
        InputCombAction.CombDirection = pyInputCombAction.CombDirection
        ###投机套保标志
        InputCombAction.HedgeFlag = pyInputCombAction.HedgeFlag
        
        self.c_TdApi.ReqCombActionInsert(&InputCombAction, nRequestID)

    # 请求查询报单
    def ReqQryOrder(self, pyQryOrder, nRequestID):
        cdef CThostFtdcQryOrderField QryOrder

        pyQryOrder.encode()

        ###经纪公司代码
        QryOrder.BrokerID = pyQryOrder.BrokerID
        ###投资者代码
        QryOrder.InvestorID = pyQryOrder.InvestorID
        ###合约代码
        QryOrder.InstrumentID = pyQryOrder.InstrumentID
        ###交易所代码
        QryOrder.ExchangeID = pyQryOrder.ExchangeID
        ###报单编号
        QryOrder.OrderSysID = pyQryOrder.OrderSysID
        ###开始时间
        QryOrder.InsertTimeStart = pyQryOrder.InsertTimeStart
        ###结束时间
        QryOrder.InsertTimeEnd = pyQryOrder.InsertTimeEnd
        
        self.c_TdApi.ReqQryOrder(&QryOrder, nRequestID)

    # 请求查询成交
    def ReqQryTrade(self, pyQryTrade, nRequestID):
        cdef CThostFtdcQryTradeField QryTrade
        
        pyQryTrade.encode()

        ###经纪公司代码
        QryTrade.BrokerID = pyQryTrade.BrokerID
        ###投资者代码
        QryTrade.InvestorID = pyQryTrade.InvestorID
        ###合约代码
        QryTrade.InstrumentID = pyQryTrade.InstrumentID
        ###交易所代码
        QryTrade.ExchangeID = pyQryTrade.ExchangeID
        ###成交编号
        QryTrade.TradeID = pyQryTrade.TradeID
        ###开始时间
        QryTrade.TradeTimeStart = pyQryTrade.TradeTimeStart
        ###结束时间
        QryTrade.TradeTimeEnd = pyQryTrade.TradeTimeEnd
        
        self.c_TdApi.ReqQryTrade(&QryTrade, nRequestID)

    # 请求查询投资者持仓
    def ReqQryInvestorPosition(self, pyQryInvestorPosition, nRequestID):
        cdef CThostFtdcQryInvestorPositionField QryInvestorPosition

        pyQryInvestorPosition.encode()

        ###经纪公司代码
        QryInvestorPosition.BrokerID = pyQryInvestorPosition.BrokerID
        ###投资者代码
        QryInvestorPosition.InvestorID = pyQryInvestorPosition.InvestorID
        ###合约代码
        QryInvestorPosition.InstrumentID = pyQryInvestorPosition.InstrumentID
        
        self.c_TdApi.ReqQryInvestorPosition(&QryInvestorPosition, nRequestID)

    # 请求查询资金账户
    def ReqQryTradingAccount(self, pyQryTradingAccount, nRequestID):
        cdef CThostFtdcQryTradingAccountField QryTradingAccount

        pyQryTradingAccount.encode()

        ###经纪公司代码
        QryTradingAccount.BrokerID = pyQryTradingAccount.BrokerID
        ###投资者代码
        QryTradingAccount.InvestorID = pyQryTradingAccount.InvestorID
        ###币种代码
        QryTradingAccount.CurrencyID = pyQryTradingAccount.CurrencyID
        
        self.c_TdApi.ReqQryTradingAccount(&QryTradingAccount, nRequestID)

    # 请求查询投资者
    def ReqQryInvestor(self, pyQryInvestor, nRequestID):
        cdef CThostFtdcQryInvestorField QryInvestor

        pyQryInvestor.encode()

        ###经纪公司代码
        QryInvestor.BrokerID = pyQryInvestor.BrokerID
        ###投资者代码
        QryInvestor.InvestorID = pyQryInvestor.InvestorID
        
        self.c_TdApi.ReqQryInvestor(&QryInvestor, nRequestID)

    # 请求查询交易编码
    def ReqQryTradingCode(self, pyQryTradingCode, nRequestID):
        cdef CThostFtdcQryTradingCodeField QryTradingCode

        pyQryTradingCode.encode()

        ###经纪公司代码
        QryTradingCode.BrokerID = pyQryTradingCode.BrokerID
        ###投资者代码
        QryTradingCode.InvestorID = pyQryTradingCode.InvestorID
        ###交易所代码
        QryTradingCode.ExchangeID = pyQryTradingCode.ExchangeID
        ###客户代码
        QryTradingCode.ClientID = pyQryTradingCode.ClientID
        ###交易编码类型
        QryTradingCode.ClientIDType = pyQryTradingCode.ClientIDType
        
        self.c_TdApi.ReqQryTradingCode(&QryTradingCode, nRequestID)

    # 请求查询合约保证金率
    def ReqQryInstrumentMarginRate(self, pyQryInstrumentMarginRate, nRequestID):
        cdef CThostFtdcQryInstrumentMarginRateField QryInstrumentMarginRate

        pyQryInstrumentMarginRate.encode()

        ###经纪公司代码
        QryInstrumentMarginRate.BrokerID = pyQryInstrumentMarginRate.BrokerID
        ###投资者代码
        QryInstrumentMarginRate.InvestorID = pyQryInstrumentMarginRate.InvestorID
        ###合约代码
        QryInstrumentMarginRate.InstrumentID = pyQryInstrumentMarginRate.InstrumentID
        ###投机套保标志
        QryInstrumentMarginRate.HedgeFlag = pyQryInstrumentMarginRate.HedgeFlag
        
        self.c_TdApi.ReqQryInstrumentMarginRate(&QryInstrumentMarginRate, nRequestID)

    # 请求查询合约手续费率
    def ReqQryInstrumentCommissionRate(self, pyQryInstrumentCommissionRate, nRequestID):
        cdef CThostFtdcQryInstrumentCommissionRateField QryInstrumentCommissionRate

        pyQryInstrumentCommissionRate.encode()

        ###经纪公司代码
        QryInstrumentCommissionRate.BrokerID = pyQryInstrumentCommissionRate.BrokerID
        ###投资者代码
        QryInstrumentCommissionRate.InvestorID = pyQryInstrumentCommissionRate.InvestorID
        ###合约代码
        QryInstrumentCommissionRate.InstrumentID = pyQryInstrumentCommissionRate.InstrumentID
        
        self.c_TdApi.ReqQryInstrumentCommissionRate(&QryInstrumentCommissionRate, nRequestID)

    # 请求查询交易所
    def ReqQryExchange(self, pyQryExchange, nRequestID):
        cdef CThostFtdcQryExchangeField QryExchange

        pyQryExchange.encode()

        ###交易所代码
        QryExchange.ExchangeID = pyQryExchange.ExchangeID
        
        self.c_TdApi.ReqQryExchange(&QryExchange, nRequestID)

    # 请求查询产品
    def ReqQryProduct(self, pyQryProduct, nRequestID):
        cdef CThostFtdcQryProductField QryProduct

        pyQryProduct.encode()

        ###产品代码
        QryProduct.ProductID = pyQryProduct.ProductID
        ###产品类型
        QryProduct.ProductClass = pyQryProduct.ProductClass
        
        self.c_TdApi.ReqQryProduct(&QryProduct, nRequestID)

    # 请求查询合约
    def ReqQryInstrument(self, pyQryInstrument, nRequestID):
        cdef CThostFtdcQryInstrumentField QryInstrument

        pyQryInstrument.encode()

        ###合约代码
        QryInstrument.InstrumentID = pyQryInstrument.InstrumentID
        ###交易所代码
        QryInstrument.ExchangeID = pyQryInstrument.ExchangeID
        ###合约在交易所的代码
        QryInstrument.ExchangeInstID = pyQryInstrument.ExchangeInstID
        ###产品代码
        QryInstrument.ProductID = pyQryInstrument.ProductID
        
        self.c_TdApi.ReqQryInstrument(&QryInstrument, nRequestID)

    # 请求查询行情
    def ReqQryDepthMarketData(self, pyQryDepthMarketData, nRequestID):
        cdef CThostFtdcQryDepthMarketDataField QryDepthMarketData

        pyQryDepthMarketData.encode()

        ###合约代码
        QryDepthMarketData.InstrumentID = pyQryDepthMarketData.InstrumentID
        
        self.c_TdApi.ReqQryDepthMarketData(&QryDepthMarketData, nRequestID)

    # 请求查询投资者结算结果
    def ReqQrySettlementInfo(self, pyQrySettlementInfo, nRequestID):
        cdef CThostFtdcQrySettlementInfoField QrySettlementInfo

        pyQrySettlementInfo.encode()

        ###经纪公司代码
        QrySettlementInfo.BrokerID = pyQrySettlementInfo.BrokerID
        ###投资者代码
        QrySettlementInfo.InvestorID = pyQrySettlementInfo.InvestorID
        ###交易日
        QrySettlementInfo.TradingDay = pyQrySettlementInfo.TradingDay
        
        self.c_TdApi.ReqQrySettlementInfo(&QrySettlementInfo, nRequestID)

    # 请求查询转帐银行
    def ReqQryTransferBank(self, pyQryTransferBank, nRequestID):
        cdef CThostFtdcQryTransferBankField QryTransferBank

        pyQryTransferBank.encode()

        ###银行代码
        QryTransferBank.BankID = pyQryTransferBank.BankID
        ###银行分中心代码
        QryTransferBank.BankBrchID = pyQryTransferBank.BankBrchID
        
        self.c_TdApi.ReqQryTransferBank(&QryTransferBank, nRequestID)

    # 请求查询投资者持仓明细
    def ReqQryInvestorPositionDetail(self, pyQryInvestorPositionDetail, nRequestID):
        cdef CThostFtdcQryInvestorPositionDetailField QryInvestorPositionDetail

        pyQryInvestorPositionDetail.encode()

        ###经纪公司代码
        QryInvestorPositionDetail.BrokerID = pyQryInvestorPositionDetail.BrokerID
        ###投资者代码
        QryInvestorPositionDetail.InvestorID = pyQryInvestorPositionDetail.InvestorID
        ###合约代码
        QryInvestorPositionDetail.InstrumentID = pyQryInvestorPositionDetail.InstrumentID
        
        self.c_TdApi.ReqQryInvestorPositionDetail(&QryInvestorPositionDetail, nRequestID)

    # 请求查询客户通知
    def ReqQryNotice(self, pyQryNotice, nRequestID):
        cdef CThostFtdcQryNoticeField QryNotice

        pyQryNotice.encode()

        ###经纪公司代码
        QryNotice.BrokerID = pyQryNotice.BrokerID
        
        self.c_TdApi.ReqQryNotice(&QryNotice, nRequestID)

    # 请求查询结算信息确认
    def ReqQrySettlementInfoConfirm(self, pyQrySettlementInfoConfirm, nRequestID):
        cdef CThostFtdcQrySettlementInfoConfirmField QrySettlementInfoConfirm

        pyQrySettlementInfoConfirm.encode()

        ###经纪公司代码
        QrySettlementInfoConfirm.BrokerID = pyQrySettlementInfoConfirm.BrokerID
        ###投资者代码
        QrySettlementInfoConfirm.InvestorID = pyQrySettlementInfoConfirm.InvestorID
        
        self.c_TdApi.ReqQrySettlementInfoConfirm(&QrySettlementInfoConfirm, nRequestID)

    # 请求查询投资者持仓明细
    def ReqQryInvestorPositionCombineDetail(self, pyQryInvestorPositionCombineDetail, nRequestID):
        cdef CThostFtdcQryInvestorPositionCombineDetailField QryInvestorPositionCombineDetail

        pyQryInvestorPositionCombineDetail.encode()

        ###经纪公司代码
        QryInvestorPositionCombineDetail.BrokerID = pyQryInvestorPositionCombineDetail.BrokerID
        ###投资者代码
        QryInvestorPositionCombineDetail.InvestorID = pyQryInvestorPositionCombineDetail.InvestorID
        ###组合持仓合约编码
        QryInvestorPositionCombineDetail.CombInstrumentID = pyQryInvestorPositionCombineDetail.CombInstrumentID
        
        self.c_TdApi.ReqQryInvestorPositionCombineDetail(&QryInvestorPositionCombineDetail, nRequestID)

    # 请求查询保证金监管系统经纪公司资金账户密钥
    def ReqQryCFMMCTradingAccountKey(self, pyQryCFMMCTradingAccountKey, nRequestID):
        cdef CThostFtdcQryCFMMCTradingAccountKeyField QryCFMMCTradingAccountKey

        pyQryCFMMCTradingAccountKey.encode()

        ###经纪公司代码
        QryCFMMCTradingAccountKey.BrokerID = pyQryCFMMCTradingAccountKey.BrokerID
        ###投资者代码
        QryCFMMCTradingAccountKey.InvestorID = pyQryCFMMCTradingAccountKey.InvestorID
        
        self.c_TdApi.ReqQryCFMMCTradingAccountKey(&QryCFMMCTradingAccountKey, nRequestID)

    # 请求查询仓单折抵信息
    def ReqQryEWarrantOffset(self, pyQryEWarrantOffset, nRequestID):
        cdef CThostFtdcQryEWarrantOffsetField QryEWarrantOffset

        pyQryEWarrantOffset.encode()

        ###经纪公司代码
        QryEWarrantOffset.BrokerID = pyQryEWarrantOffset.BrokerID
        ###投资者代码
        QryEWarrantOffset.InvestorID = pyQryEWarrantOffset.InvestorID
        ###交易所代码
        QryEWarrantOffset.ExchangeID = pyQryEWarrantOffset.ExchangeID
        ###合约代码
        QryEWarrantOffset.InstrumentID = pyQryEWarrantOffset.InstrumentID
        
        self.c_TdApi.ReqQryEWarrantOffset(&QryEWarrantOffset, nRequestID)

    # 请求查询投资者品种/跨品种保证金
    def ReqQryInvestorProductGroupMargin(self, pyQryInvestorProductGroupMargin, nRequestID):
        cdef CThostFtdcQryInvestorProductGroupMarginField QryInvestorProductGroupMargin

        pyQryInvestorProductGroupMargin.encode()

        ###经纪公司代码
        QryInvestorProductGroupMargin.BrokerID = pyQryInvestorProductGroupMargin.BrokerID
        ###投资者代码
        QryInvestorProductGroupMargin.InvestorID = pyQryInvestorProductGroupMargin.InvestorID
        ###品种#跨品种标示
        QryInvestorProductGroupMargin.ProductGroupID = pyQryInvestorProductGroupMargin.ProductGroupID
        ###投机套保标志
        QryInvestorProductGroupMargin.HedgeFlag = pyQryInvestorProductGroupMargin.HedgeFlag
        
        self.c_TdApi.ReqQryInvestorProductGroupMargin(&QryInvestorProductGroupMargin, nRequestID)

    # 请求查询交易所保证金率
    def ReqQryExchangeMarginRate(self, pyQryExchangeMarginRate, nRequestID):
        cdef CThostFtdcQryExchangeMarginRateField QryExchangeMarginRate

        pyQryExchangeMarginRate.encode()

        ###经纪公司代码
        QryExchangeMarginRate.BrokerID = pyQryExchangeMarginRate.BrokerID
        ###合约代码
        QryExchangeMarginRate.InstrumentID = pyQryExchangeMarginRate.InstrumentID
        ###投机套保标志
        QryExchangeMarginRate.HedgeFlag = pyQryExchangeMarginRate.HedgeFlag
        
        self.c_TdApi.ReqQryExchangeMarginRate(&QryExchangeMarginRate, nRequestID)

    # 请求查询交易所调整保证金率
    def ReqQryExchangeMarginRateAdjust(self, pyQryExchangeMarginRateAdjust, nRequestID):
        cdef CThostFtdcQryExchangeMarginRateAdjustField QryExchangeMarginRateAdjust

        pyQryExchangeMarginRateAdjust.encode()

        ###经纪公司代码
        QryExchangeMarginRateAdjust.BrokerID = pyQryExchangeMarginRateAdjust.BrokerID
        ###合约代码
        QryExchangeMarginRateAdjust.InstrumentID = pyQryExchangeMarginRateAdjust.InstrumentID
        ###投机套保标志
        QryExchangeMarginRateAdjust.HedgeFlag = pyQryExchangeMarginRateAdjust.HedgeFlag
        
        self.c_TdApi.ReqQryExchangeMarginRateAdjust(&QryExchangeMarginRateAdjust, nRequestID)

    # 请求查询汇率
    def ReqQryExchangeRate(self, pyQryExchangeRate, nRequestID):
        cdef CThostFtdcQryExchangeRateField QryExchangeRate

        pyQryExchangeRate.encode()

        ###经纪公司代码
        QryExchangeRate.BrokerID = pyQryExchangeRate.BrokerID
        ###源币种
        QryExchangeRate.FromCurrencyID = pyQryExchangeRate.FromCurrencyID
        ###目标币种
        QryExchangeRate.ToCurrencyID = pyQryExchangeRate.ToCurrencyID
        
        self.c_TdApi.ReqQryExchangeRate(&QryExchangeRate, nRequestID)

    # 请求查询二级代理操作员银期权限
    def ReqQrySecAgentACIDMap(self, pyQrySecAgentACIDMap, nRequestID):
        cdef CThostFtdcQrySecAgentACIDMapField QrySecAgentACIDMap

        pyQrySecAgentACIDMap.encode()

        ###经纪公司代码
        QrySecAgentACIDMap.BrokerID = pyQrySecAgentACIDMap.BrokerID
        ###用户代码
        QrySecAgentACIDMap.UserID = pyQrySecAgentACIDMap.UserID
        ###资金账户
        QrySecAgentACIDMap.AccountID = pyQrySecAgentACIDMap.AccountID
        ###币种
        QrySecAgentACIDMap.CurrencyID = pyQrySecAgentACIDMap.CurrencyID
        
        self.c_TdApi.ReqQrySecAgentACIDMap(&QrySecAgentACIDMap, nRequestID)

    # 请求查询产品组
    def ReqQryProductGroup(self, pyQryProductGroup, nRequestID):
        cdef CThostFtdcQryProductGroupField QryProductGroup

        pyQryProductGroup.encode()

        ###产品代码
        QryProductGroup.ProductID = pyQryProductGroup.ProductID
        ###交易所代码
        QryProductGroup.ExchangeID = pyQryProductGroup.ExchangeID
        
        self.c_TdApi.ReqQryProductGroup(&QryProductGroup, nRequestID)

    # 请求查询报单手续费
    def ReqQryInstrumentOrderCommRate(self, pyQryInstrumentOrderCommRate, nRequestID):
        cdef CThostFtdcQryInstrumentOrderCommRateField QryInstrumentOrderCommRate

        pyQryInstrumentOrderCommRate.encode()

        ###经纪公司代码
        QryInstrumentOrderCommRate.BrokerID = pyQryInstrumentOrderCommRate.BrokerID
        ###投资者代码
        QryInstrumentOrderCommRate.InvestorID = pyQryInstrumentOrderCommRate.InvestorID
        ###合约代码
        QryInstrumentOrderCommRate.InstrumentID = pyQryInstrumentOrderCommRate.InstrumentID
        
        self.c_TdApi.ReqQryInstrumentOrderCommRate(&QryInstrumentOrderCommRate, nRequestID)

    # 请求查询期权交易成本
    def ReqQryOptionInstrTradeCost(self, pyQryOptionInstrTradeCost, nRequestID):
        cdef CThostFtdcQryOptionInstrTradeCostField QryOptionInstrTradeCost

        pyQryOptionInstrTradeCost.encode()

        ###经纪公司代码
        QryOptionInstrTradeCost.BrokerID = pyQryOptionInstrTradeCost.BrokerID
        ###投资者代码
        QryOptionInstrTradeCost.InvestorID = pyQryOptionInstrTradeCost.InvestorID
        ###合约代码
        QryOptionInstrTradeCost.InstrumentID = pyQryOptionInstrTradeCost.InstrumentID
        ###投机套保标志
        QryOptionInstrTradeCost.HedgeFlag = pyQryOptionInstrTradeCost.HedgeFlag
        ###期权合约报价
        QryOptionInstrTradeCost.InputPrice = pyQryOptionInstrTradeCost.InputPrice
        ###标的价格,填0则用昨结算价
        QryOptionInstrTradeCost.UnderlyingPrice = pyQryOptionInstrTradeCost.UnderlyingPrice
        
        self.c_TdApi.ReqQryOptionInstrTradeCost(&QryOptionInstrTradeCost, nRequestID)

    # 请求查询期权合约手续费
    def ReqQryOptionInstrCommRate(self, pyQryOptionInstrCommRate, nRequestID):
        cdef CThostFtdcQryOptionInstrCommRateField QryOptionInstrCommRate

        pyQryOptionInstrCommRate.encode()

        ###经纪公司代码
        QryOptionInstrCommRate.BrokerID = pyQryOptionInstrCommRate.BrokerID
        ###投资者代码
        QryOptionInstrCommRate.InvestorID = pyQryOptionInstrCommRate.InvestorID
        ###合约代码
        QryOptionInstrCommRate.InstrumentID = pyQryOptionInstrCommRate.InstrumentID
        
        self.c_TdApi.ReqQryOptionInstrCommRate(&QryOptionInstrCommRate, nRequestID)

    # 请求查询执行宣告
    def ReqQryExecOrder(self, pyQryExecOrder, nRequestID):
        cdef CThostFtdcQryExecOrderField QryExecOrder

        pyQryExecOrder.encode()

        ###经纪公司代码
        QryExecOrder.BrokerID = pyQryExecOrder.BrokerID
        ###投资者代码
        QryExecOrder.InvestorID = pyQryExecOrder.InvestorID
        ###合约代码
        QryExecOrder.InstrumentID = pyQryExecOrder.InstrumentID
        ###交易所代码
        QryExecOrder.ExchangeID = pyQryExecOrder.ExchangeID
        ###执行宣告编号
        QryExecOrder.ExecOrderSysID = pyQryExecOrder.ExecOrderSysID
        ###开始时间
        QryExecOrder.InsertTimeStart = pyQryExecOrder.InsertTimeStart
        ###结束时间
        QryExecOrder.InsertTimeEnd = pyQryExecOrder.InsertTimeEnd
        
        self.c_TdApi.ReqQryExecOrder(&QryExecOrder, nRequestID)

    # 请求查询询价
    def ReqQryForQuote(self, pyQryForQuote, nRequestID):
        cdef CThostFtdcQryForQuoteField QryForQuote

        pyQryForQuote.encode()

        ###经纪公司代码
        QryForQuote.BrokerID = pyQryForQuote.BrokerID
        ###投资者代码
        QryForQuote.InvestorID = pyQryForQuote.InvestorID
        ###合约代码
        QryForQuote.InstrumentID = pyQryForQuote.InstrumentID
        ###交易所代码
        QryForQuote.ExchangeID = pyQryForQuote.ExchangeID
        ###开始时间
        QryForQuote.InsertTimeStart = pyQryForQuote.InsertTimeStart
        ###结束时间
        QryForQuote.InsertTimeEnd = pyQryForQuote.InsertTimeEnd
        
        self.c_TdApi.ReqQryForQuote(&QryForQuote, nRequestID)

    # 请求查询报价
    def ReqQryQuote(self, pyQryQuote, nRequestID):
        cdef CThostFtdcQryQuoteField QryQuote
        
        pyQryQuote.encode()

        ###经纪公司代码
        QryQuote.BrokerID = pyQryQuote.BrokerID
        ###投资者代码
        QryQuote.InvestorID = pyQryQuote.InvestorID
        ###合约代码
        QryQuote.InstrumentID = pyQryQuote.InstrumentID
        ###交易所代码
        QryQuote.ExchangeID = pyQryQuote.ExchangeID
        ###报价编号
        QryQuote.QuoteSysID = pyQryQuote.QuoteSysID
        ###开始时间
        QryQuote.InsertTimeStart = pyQryQuote.InsertTimeStart
        ###结束时间
        QryQuote.InsertTimeEnd = pyQryQuote.InsertTimeEnd
        
        self.c_TdApi.ReqQryQuote(&QryQuote, nRequestID)

    # 请求查询组合合约安全系数
    def ReqQryCombInstrumentGuard(self, pyQryCombInstrumentGuard, nRequestID):
        cdef CThostFtdcQryCombInstrumentGuardField QryCombInstrumentGuard

        pyQryCombInstrumentGuard.encode()

        ###经纪公司代码
        QryCombInstrumentGuard.BrokerID = pyQryCombInstrumentGuard.BrokerID
        ###合约代码
        QryCombInstrumentGuard.InstrumentID = pyQryCombInstrumentGuard.InstrumentID
        
        self.c_TdApi.ReqQryCombInstrumentGuard(&QryCombInstrumentGuard, nRequestID)

    # 请求查询申请组合
    def ReqQryCombAction(self, pyQryCombAction, nRequestID):
        cdef CThostFtdcQryCombActionField QryCombAction

        pyQryCombAction.encode()

        ###经纪公司代码
        QryCombAction.BrokerID = pyQryCombAction.BrokerID
        ###投资者代码
        QryCombAction.InvestorID = pyQryCombAction.InvestorID
        ###合约代码
        QryCombAction.InstrumentID = pyQryCombAction.InstrumentID
        ###交易所代码
        QryCombAction.ExchangeID = pyQryCombAction.ExchangeID
        
        self.c_TdApi.ReqQryCombAction(&QryCombAction, nRequestID)

    # 请求查询转帐流水
    def ReqQryTransferSerial(self, pyQryTransferSerial, nRequestID):
        cdef CThostFtdcQryTransferSerialField QryTransferSerial

        pyQryTransferSerial.encode()

        ###经纪公司代码
        QryTransferSerial.BrokerID = pyQryTransferSerial.BrokerID
        ###投资者帐号
        QryTransferSerial.AccountID = pyQryTransferSerial.AccountID
        ###银行编码
        QryTransferSerial.BankID = pyQryTransferSerial.BankID
        ###币种代码
        QryTransferSerial.CurrencyID = pyQryTransferSerial.CurrencyID
        
        self.c_TdApi.ReqQryTransferSerial(&QryTransferSerial, nRequestID)

    # 请求查询银期签约关系
    def ReqQryAccountregister(self, pyQryAccountregister, nRequestID):
        cdef CThostFtdcQryAccountregisterField QryAccountregister

        pyQryAccountregister.encode()

        ###经纪公司代码
        QryAccountregister.BrokerID = pyQryAccountregister.BrokerID
        ###投资者帐号
        QryAccountregister.AccountID = pyQryAccountregister.AccountID
        ###银行编码
        QryAccountregister.BankID = pyQryAccountregister.BankID
        ###银行分支机构编码
        QryAccountregister.BankBranchID = pyQryAccountregister.BankBranchID
        ###币种代码
        QryAccountregister.CurrencyID = pyQryAccountregister.CurrencyID
        
        self.c_TdApi.ReqQryAccountregister(&QryAccountregister, nRequestID)

    # 请求查询签约银行
    def ReqQryContractBank(self, pyQryContractBank, nRequestID):
        cdef CThostFtdcQryContractBankField QryContractBank

        pyQryContractBank.encode()

        ###经纪公司代码
        QryContractBank.BrokerID = pyQryContractBank.BrokerID
        ###银行代码
        QryContractBank.BankID = pyQryContractBank.BankID
        ###银行分中心代码
        QryContractBank.BankBrchID = pyQryContractBank.BankBrchID
        
        self.c_TdApi.ReqQryContractBank(&QryContractBank, nRequestID)

    # 请求查询预埋单
    def ReqQryParkedOrder(self, pyQryParkedOrder, nRequestID):
        cdef CThostFtdcQryParkedOrderField QryParkedOrder

        pyQryParkedOrder.encode()

        ###经纪公司代码
        QryParkedOrder.BrokerID = pyQryParkedOrder.BrokerID
        ###投资者代码
        QryParkedOrder.InvestorID = pyQryParkedOrder.InvestorID
        ###合约代码
        QryParkedOrder.InstrumentID = pyQryParkedOrder.InstrumentID
        ###交易所代码
        QryParkedOrder.ExchangeID = pyQryParkedOrder.ExchangeID
        
        self.c_TdApi.ReqQryParkedOrder(&QryParkedOrder, nRequestID)

    # 请求查询预埋撤单
    def ReqQryParkedOrderAction(self, pyQryParkedOrderAction, nRequestID):
        cdef CThostFtdcQryParkedOrderActionField QryParkedOrderAction

        pyQryParkedOrderAction.encode()

        ###经纪公司代码
        QryParkedOrderAction.BrokerID = pyQryParkedOrderAction.BrokerID
        ###投资者代码
        QryParkedOrderAction.InvestorID = pyQryParkedOrderAction.InvestorID
        ###合约代码
        QryParkedOrderAction.InstrumentID = pyQryParkedOrderAction.InstrumentID
        ###交易所代码
        QryParkedOrderAction.ExchangeID = pyQryParkedOrderAction.ExchangeID
        
        self.c_TdApi.ReqQryParkedOrderAction(&QryParkedOrderAction, nRequestID)

    # 请求查询交易通知
    def ReqQryTradingNotice(self, pyQryTradingNotice, nRequestID):
        cdef CThostFtdcQryTradingNoticeField QryTradingNotice

        pyQryTradingNotice.encode()

        ###经纪公司代码
        QryTradingNotice.BrokerID = pyQryTradingNotice.BrokerID
        ###投资者代码
        QryTradingNotice.InvestorID = pyQryTradingNotice.InvestorID
        
        self.c_TdApi.ReqQryTradingNotice(&QryTradingNotice, nRequestID)

    # 请求查询经纪公司交易参数
    def ReqQryBrokerTradingParams(self, pyQryBrokerTradingParams, nRequestID):
        cdef CThostFtdcQryBrokerTradingParamsField QryBrokerTradingParams

        pyQryBrokerTradingParams.encode()

        ###经纪公司代码
        QryBrokerTradingParams.BrokerID = pyQryBrokerTradingParams.BrokerID
        ###投资者代码
        QryBrokerTradingParams.InvestorID = pyQryBrokerTradingParams.InvestorID
        ###币种代码
        QryBrokerTradingParams.CurrencyID = pyQryBrokerTradingParams.CurrencyID
        
        self.c_TdApi.ReqQryBrokerTradingParams(&QryBrokerTradingParams, nRequestID)

    # 请求查询经纪公司交易算法
    def ReqQryBrokerTradingAlgos(self, pyQryBrokerTradingAlgos, nRequestID):
        cdef CThostFtdcQryBrokerTradingAlgosField QryBrokerTradingAlgos

        pyQryBrokerTradingAlgos.encode()

        ###经纪公司代码
        QryBrokerTradingAlgos.BrokerID = pyQryBrokerTradingAlgos.BrokerID
        ###交易所代码
        QryBrokerTradingAlgos.ExchangeID = pyQryBrokerTradingAlgos.ExchangeID
        ###合约代码
        QryBrokerTradingAlgos.InstrumentID = pyQryBrokerTradingAlgos.InstrumentID
        
        self.c_TdApi.ReqQryBrokerTradingAlgos(&QryBrokerTradingAlgos, nRequestID)

    # 请求查询监控中心用户令牌
    def ReqQueryCFMMCTradingAccountToken(self, pyQueryCFMMCTradingAccountToken, nRequestID):
        cdef CThostFtdcQueryCFMMCTradingAccountTokenField QueryCFMMCTradingAccountToken

        pyQueryCFMMCTradingAccountToken.encode()

        ###经纪公司代码
        QueryCFMMCTradingAccountToken.BrokerID = pyQueryCFMMCTradingAccountToken.BrokerID
        ###投资者代码
        QueryCFMMCTradingAccountToken.InvestorID = pyQueryCFMMCTradingAccountToken.InvestorID
        
        self.c_TdApi.ReqQueryCFMMCTradingAccountToken(&QueryCFMMCTradingAccountToken, nRequestID)

    # 期货发起银行资金转期货请求
    def ReqFromBankToFutureByFuture(self, pyReqTransfer, nRequestID):
        cdef CThostFtdcReqTransferField ReqTransfer

        pyReqTransfer.encode()

        ###业务功能码
        ReqTransfer.TradeCode = pyReqTransfer.TradeCode
        ###银行代码
        ReqTransfer.BankID = pyReqTransfer.BankID
        ###银行分支机构代码
        ReqTransfer.BankBranchID = pyReqTransfer.BankBranchID
        ###期商代码
        ReqTransfer.BrokerID = pyReqTransfer.BrokerID
        ###期商分支机构代码
        ReqTransfer.BrokerBranchID = pyReqTransfer.BrokerBranchID
        ###交易日期
        ReqTransfer.TradeDate = pyReqTransfer.TradeDate
        ###交易时间
        ReqTransfer.TradeTime = pyReqTransfer.TradeTime
        ###银行流水号
        ReqTransfer.BankSerial = pyReqTransfer.BankSerial
        ###交易系统日期 
        ReqTransfer.TradingDay = pyReqTransfer.TradingDay
        ###银期平台消息流水号
        ReqTransfer.PlateSerial = pyReqTransfer.PlateSerial
        ###最后分片标志
        ReqTransfer.LastFragment = pyReqTransfer.LastFragment
        ###会话号
        ReqTransfer.SessionID = pyReqTransfer.SessionID
        ###客户姓名
        ReqTransfer.CustomerName = pyReqTransfer.CustomerName
        ###证件类型
        ReqTransfer.IdCardType = pyReqTransfer.IdCardType
        ###证件号码
        ReqTransfer.IdentifiedCardNo = pyReqTransfer.IdentifiedCardNo
        ###客户类型
        ReqTransfer.CustType = pyReqTransfer.CustType
        ###银行帐号
        ReqTransfer.BankAccount = pyReqTransfer.BankAccount
        ###银行密码
        ReqTransfer.BankPassWord = pyReqTransfer.BankPassWord
        ###投资者帐号
        ReqTransfer.AccountID = pyReqTransfer.AccountID
        ###期货密码
        ReqTransfer.Password = pyReqTransfer.Password
        ###安装编号
        ReqTransfer.InstallID = pyReqTransfer.InstallID
        ###期货公司流水号
        ReqTransfer.FutureSerial = pyReqTransfer.FutureSerial
        ###用户标识
        ReqTransfer.UserID = pyReqTransfer.UserID
        ###验证客户证件号码标志
        ReqTransfer.VerifyCertNoFlag = pyReqTransfer.VerifyCertNoFlag
        ###币种代码
        ReqTransfer.CurrencyID = pyReqTransfer.CurrencyID
        ###转帐金额
        ReqTransfer.TradeAmount = pyReqTransfer.TradeAmount
        ###期货可取金额
        ReqTransfer.FutureFetchAmount = pyReqTransfer.FutureFetchAmount
        ###费用支付标志
        ReqTransfer.FeePayFlag = pyReqTransfer.FeePayFlag
        ###应收客户费用
        ReqTransfer.CustFee = pyReqTransfer.CustFee
        ###应收期货公司费用
        ReqTransfer.BrokerFee = pyReqTransfer.BrokerFee
        ###发送方给接收方的消息
        ReqTransfer.Message = pyReqTransfer.Message
        ###摘要
        ReqTransfer.Digest = pyReqTransfer.Digest
        ###银行帐号类型
        ReqTransfer.BankAccType = pyReqTransfer.BankAccType
        ###渠道标志
        ReqTransfer.DeviceID = pyReqTransfer.DeviceID
        ###期货单位帐号类型
        ReqTransfer.BankSecuAccType = pyReqTransfer.BankSecuAccType
        ###期货公司银行编码
        ReqTransfer.BrokerIDByBank = pyReqTransfer.BrokerIDByBank
        ###期货单位帐号
        ReqTransfer.BankSecuAcc = pyReqTransfer.BankSecuAcc
        ###银行密码标志
        ReqTransfer.BankPwdFlag = pyReqTransfer.BankPwdFlag
        ###期货资金密码核对标志
        ReqTransfer.SecuPwdFlag = pyReqTransfer.SecuPwdFlag
        ###交易柜员
        ReqTransfer.OperNo = pyReqTransfer.OperNo
        ###请求编号
        ReqTransfer.RequestID = pyReqTransfer.RequestID
        ###交易ID
        ReqTransfer.TID = pyReqTransfer.TID
        ###转账交易状态
        ReqTransfer.TransferStatus = pyReqTransfer.TransferStatus

        self.c_TdApi.ReqFromBankToFutureByFuture(&ReqTransfer, nRequestID)

    # 期货发起期货资金转银行请求
    def ReqFromFutureToBankByFuture(self, pyReqTransfer, nRequestID):
        cdef CThostFtdcReqTransferField ReqTransfer

        pyReqTransfer.encode()

        ###业务功能码
        ReqTransfer.TradeCode = pyReqTransfer.TradeCode
        ###银行代码
        ReqTransfer.BankID = pyReqTransfer.BankID
        ###银行分支机构代码
        ReqTransfer.BankBranchID = pyReqTransfer.BankBranchID
        ###期商代码
        ReqTransfer.BrokerID = pyReqTransfer.BrokerID
        ###期商分支机构代码
        ReqTransfer.BrokerBranchID = pyReqTransfer.BrokerBranchID
        ###交易日期
        ReqTransfer.TradeDate = pyReqTransfer.TradeDate
        ###交易时间
        ReqTransfer.TradeTime = pyReqTransfer.TradeTime
        ###银行流水号
        ReqTransfer.BankSerial = pyReqTransfer.BankSerial
        ###交易系统日期 
        ReqTransfer.TradingDay = pyReqTransfer.TradingDay
        ###银期平台消息流水号
        ReqTransfer.PlateSerial = pyReqTransfer.PlateSerial
        ###最后分片标志
        ReqTransfer.LastFragment = pyReqTransfer.LastFragment
        ###会话号
        ReqTransfer.SessionID = pyReqTransfer.SessionID
        ###客户姓名
        ReqTransfer.CustomerName = pyReqTransfer.CustomerName
        ###证件类型
        ReqTransfer.IdCardType = pyReqTransfer.IdCardType
        ###证件号码
        ReqTransfer.IdentifiedCardNo = pyReqTransfer.IdentifiedCardNo
        ###客户类型
        ReqTransfer.CustType = pyReqTransfer.CustType
        ###银行帐号
        ReqTransfer.BankAccount = pyReqTransfer.BankAccount
        ###银行密码
        ReqTransfer.BankPassWord = pyReqTransfer.BankPassWord
        ###投资者帐号
        ReqTransfer.AccountID = pyReqTransfer.AccountID
        ###期货密码
        ReqTransfer.Password = pyReqTransfer.Password
        ###安装编号
        ReqTransfer.InstallID = pyReqTransfer.InstallID
        ###期货公司流水号
        ReqTransfer.FutureSerial = pyReqTransfer.FutureSerial
        ###用户标识
        ReqTransfer.UserID = pyReqTransfer.UserID
        ###验证客户证件号码标志
        ReqTransfer.VerifyCertNoFlag = pyReqTransfer.VerifyCertNoFlag
        ###币种代码
        ReqTransfer.CurrencyID = pyReqTransfer.CurrencyID
        ###转帐金额
        ReqTransfer.TradeAmount = pyReqTransfer.TradeAmount
        ###期货可取金额
        ReqTransfer.FutureFetchAmount = pyReqTransfer.FutureFetchAmount
        ###费用支付标志
        ReqTransfer.FeePayFlag = pyReqTransfer.FeePayFlag
        ###应收客户费用
        ReqTransfer.CustFee = pyReqTransfer.CustFee
        ###应收期货公司费用
        ReqTransfer.BrokerFee = pyReqTransfer.BrokerFee
        ###发送方给接收方的消息
        ReqTransfer.Message = pyReqTransfer.Message
        ###摘要
        ReqTransfer.Digest = pyReqTransfer.Digest
        ###银行帐号类型
        ReqTransfer.BankAccType = pyReqTransfer.BankAccType
        ###渠道标志
        ReqTransfer.DeviceID = pyReqTransfer.DeviceID
        ###期货单位帐号类型
        ReqTransfer.BankSecuAccType = pyReqTransfer.BankSecuAccType
        ###期货公司银行编码
        ReqTransfer.BrokerIDByBank = pyReqTransfer.BrokerIDByBank
        ###期货单位帐号
        ReqTransfer.BankSecuAcc = pyReqTransfer.BankSecuAcc
        ###银行密码标志
        ReqTransfer.BankPwdFlag = pyReqTransfer.BankPwdFlag
        ###期货资金密码核对标志
        ReqTransfer.SecuPwdFlag = pyReqTransfer.SecuPwdFlag
        ###交易柜员
        ReqTransfer.OperNo = pyReqTransfer.OperNo
        ###请求编号
        ReqTransfer.RequestID = pyReqTransfer.RequestID
        ###交易ID
        ReqTransfer.TID = pyReqTransfer.TID
        ###转账交易状态
        ReqTransfer.TransferStatus = pyReqTransfer.TransferStatus

        self.c_TdApi.ReqFromFutureToBankByFuture(&ReqTransfer, nRequestID)

    # 期货发起查询银行余额请求
    def ReqQueryBankAccountMoneyByFuture(self, pyReqQueryAccount, nRequestID):
        cdef CThostFtdcReqQueryAccountField ReqQueryAccount

        pyReqQueryAccount.encode()

        ###业务功能码
        ReqQueryAccount.TradeCode = pyReqQueryAccount.TradeCode
        ###银行代码
        ReqQueryAccount.BankID = pyReqQueryAccount.BankID
        ###银行分支机构代码
        ReqQueryAccount.BankBranchID = pyReqQueryAccount.BankBranchID
        ###期商代码
        ReqQueryAccount.BrokerID = pyReqQueryAccount.BrokerID
        ###期商分支机构代码
        ReqQueryAccount.BrokerBranchID = pyReqQueryAccount.BrokerBranchID
        ###交易日期
        ReqQueryAccount.TradeDate = pyReqQueryAccount.TradeDate
        ###交易时间
        ReqQueryAccount.TradeTime = pyReqQueryAccount.TradeTime
        ###银行流水号
        ReqQueryAccount.BankSerial = pyReqQueryAccount.BankSerial
        ###交易系统日期 
        ReqQueryAccount.TradingDay = pyReqQueryAccount.TradingDay
        ###银期平台消息流水号
        ReqQueryAccount.PlateSerial = pyReqQueryAccount.PlateSerial
        ###最后分片标志
        ReqQueryAccount.LastFragment = pyReqQueryAccount.LastFragment
        ###会话号
        ReqQueryAccount.SessionID = pyReqQueryAccount.SessionID
        ###客户姓名
        ReqQueryAccount.CustomerName = pyReqQueryAccount.CustomerName
        ###证件类型
        ReqQueryAccount.IdCardType = pyReqQueryAccount.IdCardType
        ###证件号码
        ReqQueryAccount.IdentifiedCardNo = pyReqQueryAccount.IdentifiedCardNo
        ###客户类型
        ReqQueryAccount.CustType = pyReqQueryAccount.CustType
        ###银行帐号
        ReqQueryAccount.BankAccount = pyReqQueryAccount.BankAccount
        ###银行密码
        ReqQueryAccount.BankPassWord = pyReqQueryAccount.BankPassWord
        ###投资者帐号
        ReqQueryAccount.AccountID = pyReqQueryAccount.AccountID
        ###期货密码
        ReqQueryAccount.Password = pyReqQueryAccount.Password
        ###期货公司流水号
        ReqQueryAccount.FutureSerial = pyReqQueryAccount.FutureSerial
        ###安装编号
        ReqQueryAccount.InstallID = pyReqQueryAccount.InstallID
        ###用户标识
        ReqQueryAccount.UserID = pyReqQueryAccount.UserID
        ###验证客户证件号码标志
        ReqQueryAccount.VerifyCertNoFlag = pyReqQueryAccount.VerifyCertNoFlag
        ###币种代码
        ReqQueryAccount.CurrencyID = pyReqQueryAccount.CurrencyID
        ###摘要
        ReqQueryAccount.Digest = pyReqQueryAccount.Digest
        ###银行帐号类型
        ReqQueryAccount.BankAccType = pyReqQueryAccount.BankAccType
        ###渠道标志
        ReqQueryAccount.DeviceID = pyReqQueryAccount.DeviceID
        ###期货单位帐号类型
        ReqQueryAccount.BankSecuAccType = pyReqQueryAccount.BankSecuAccType
        ###期货公司银行编码
        ReqQueryAccount.BrokerIDByBank = pyReqQueryAccount.BrokerIDByBank
        ###期货单位帐号
        ReqQueryAccount.BankSecuAcc = pyReqQueryAccount.BankSecuAcc
        ###银行密码标志
        ReqQueryAccount.BankPwdFlag = pyReqQueryAccount.BankPwdFlag
        ###期货资金密码核对标志
        ReqQueryAccount.SecuPwdFlag = pyReqQueryAccount.SecuPwdFlag
        ###交易柜员
        ReqQueryAccount.OperNo = pyReqQueryAccount.OperNo
        ###请求编号
        ReqQueryAccount.RequestID = pyReqQueryAccount.RequestID
        ###交易ID
        ReqQueryAccount.TID = pyReqQueryAccount.TID
        
        self.c_TdApi.ReqQueryBankAccountMoneyByFuture(&ReqQueryAccount, nRequestID)