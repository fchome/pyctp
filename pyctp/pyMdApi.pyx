# encoding: UTF-8

from libc.stdlib cimport malloc, free

from ctpMdSpiResponse import *

from ctpStruct import pyThostFtdcForQuoteRspField, pyThostFtdcDepthMarketDataField, pyThostFtdcSpecificInstrumentField,\
        pyThostFtdcUserLogoutField, pyThostFtdcRspInfoField, pyThostFtdcRspUserLoginField, pyThostFtdcReqUserLoginField

cimport ctpCStruct
from ctpCStruct cimport CThostFtdcForQuoteRspField, CThostFtdcDepthMarketDataField, CThostFtdcSpecificInstrumentField,\
        CThostFtdcUserLogoutField, CThostFtdcRspInfoField, CThostFtdcRspUserLoginField


clsMdSpiResponse = None

def attr_decode(clsv):
    for name, value in vars(clsv).items():
        if isinstance(getattr(clsv, name), bytes):
            setattr(clsv, name, value.decode('gb2312').encode('utf-8').decode('utf-8'))

# 当客户端与交易后台建立起通信连接时（还未登录前），该方法被调用。
cdef extern void OnStaticFrontConnected():
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    clsMdSpiResponse.OnFrontConnected()
    
# 当客户端与交易后台通信连接断开时，该方法被调用。当发生这个情况后，API会自动重新连接，客户端可不做处理。
# @param nReason 错误原因
#         0x1001 网络读失败
#         0x1002 网络写失败
#         0x2001 接收心跳超时
#         0x2002 发送心跳失败
#         0x2003 收到错误报文
cdef extern void OnStaticFrontDisconnected(int nReason):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    clsMdSpiResponse.OnFrontDisconnected(nReason)

# 心跳超时警告。当长时间未收到报文时，该方法被调用。
# @param nTimeLapse 距离上次接收报文的时间
cdef extern void OnStaticHeartBeatWarning(int nTimeLapse):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    clsMdSpiResponse.OnHeartBeatWarning(nTimeLapse)

# 登录请求响应
cdef extern void OnStaticRspUserLogin(CThostFtdcRspUserLoginField *pRspUserLogin, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    pyRspUserLogin = pyThostFtdcRspUserLoginField()

    ###交易日
    pyRspUserLogin.TradingDay = pRspUserLogin.TradingDay #str [9]
    ###登录成功时间
    pyRspUserLogin.LoginTime = pRspUserLogin.LoginTime #str [9]
    ###经纪公司代码
    pyRspUserLogin.BrokerID = pRspUserLogin.BrokerID #str [11]
    ###用户代码
    pyRspUserLogin.UserID = pRspUserLogin.UserID #str [16]
    ###交易系统名称
    pyRspUserLogin.SystemName = pRspUserLogin.SystemName #str [41]
    ###前置编号
    pyRspUserLogin.FrontID = pRspUserLogin.FrontID #int
    ###会话编号
    pyRspUserLogin.SessionID = pRspUserLogin.SessionID #int
    ###最大报单引用
    pyRspUserLogin.MaxOrderRef = pRspUserLogin.MaxOrderRef #str [13]
    ###上期所时间
    pyRspUserLogin.SHFETime = pRspUserLogin.SHFETime #str [9]
    ###大商所时间
    pyRspUserLogin.DCETime = pRspUserLogin.DCETime #str [9]
    ###郑商所时间
    pyRspUserLogin.CZCETime = pRspUserLogin.CZCETime #str [9]
    ###中金所时间
    pyRspUserLogin.FFEXTime = pRspUserLogin.FFEXTime #str [9]
    ###能源中心时间
    pyRspUserLogin.INETime = pRspUserLogin.INETime #str [9]

    attr_decode(pyRspUserLogin)
    #for name, value in vars(pyRspUserLogin).items():
    #    if isinstance(getattr(pyRspUserLogin, name), bytes):
    #        setattr(pyRspUserLogin, name, value.decode('utf-8'))

    pyRspInfo = pyThostFtdcRspInfoField()

    ###错误代码
    pyRspInfo.ErrorID = pRspInfo.ErrorID #int
	###错误信息
    pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]

    attr_decode(pyRspInfo)

    clsMdSpiResponse.OnRspUserLogin(pyRspUserLogin, pyRspInfo, nRequestID, bIsLast)

# 登出请求响应
cdef extern void OnStaticRspUserLogout(CThostFtdcUserLogoutField *pUserLogout, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    pyUserLogout = pyThostFtdcUserLogoutField()

    ###经纪公司代码
    pyUserLogout.BrokerID = pUserLogout.BrokerID #str [11]
	###用户代码
    pyUserLogout.UserID = pUserLogout.UserID #str [16]

    attr_decode(pyUserLogout)

    pyRspInfo = pyThostFtdcRspInfoField()

    ###错误代码
    pyRspInfo.ErrorID = pRspInfo.ErrorID #int
	###错误信息
    pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]

    attr_decode(pyRspInfo)

    clsMdSpiResponse.OnRspUserLogout(pyUserLogout, pyRspInfo, nRequestID, bIsLast)

# 错误应答
cdef extern void OnStaticRspError(CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    pyRspInfo = pyThostFtdcRspInfoField()

    ###错误代码
    pyRspInfo.ErrorID = pRspInfo.ErrorID #int
	###错误信息
    pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]

    attr_decode(pyRspInfo)

    clsMdSpiResponse.OnRspError(pyRspInfo, nRequestID, bIsLast)

# 订阅行情应答
cdef extern void OnStaticRspSubMarketData(CThostFtdcSpecificInstrumentField *pSpecificInstrument, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    pySpecificInstrument = pyThostFtdcSpecificInstrumentField()

    ###合约代码
    pySpecificInstrument.InstrumentID = pSpecificInstrument.InstrumentID #str [31]

    attr_decode(pySpecificInstrument)

    pyRspInfo = pyThostFtdcRspInfoField()

    ###错误代码
    pyRspInfo.ErrorID = pRspInfo.ErrorID #int
	###错误信息
    pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]

    attr_decode(pyRspInfo)

    clsMdSpiResponse.OnRspSubMarketData(pySpecificInstrument, pyRspInfo, nRequestID, bIsLast)

# 取消订阅行情应答
cdef extern void OnStaticRspUnSubMarketData(CThostFtdcSpecificInstrumentField *pSpecificInstrument, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    pySpecificInstrument = pyThostFtdcSpecificInstrumentField()

    ###合约代码
    pySpecificInstrument.InstrumentID = pSpecificInstrument.InstrumentID #str [31]

    attr_decode(pySpecificInstrument)
    
    pyRspInfo = pyThostFtdcRspInfoField()

    ###错误代码
    pyRspInfo.ErrorID = pRspInfo.ErrorID #int
	###错误信息
    pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]

    attr_decode(pyRspInfo)

    clsMdSpiResponse.OnRspUnSubMarketData(pySpecificInstrument, pyRspInfo, nRequestID, bIsLast)

# 订阅询价应答
cdef extern void OnStaticRspSubForQuoteRsp(CThostFtdcSpecificInstrumentField *pSpecificInstrument, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    pySpecificInstrument = pyThostFtdcSpecificInstrumentField()

    ###合约代码
    pySpecificInstrument.InstrumentID = pSpecificInstrument.InstrumentID #str [31]

    attr_decode(pySpecificInstrument)

    pyRspInfo = pyThostFtdcRspInfoField()

    ###错误代码
    pyRspInfo.ErrorID = pRspInfo.ErrorID #int
	###错误信息
    pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]

    attr_decode(pyRspInfo)

    clsMdSpiResponse.OnRspSubForQuoteRsp(pySpecificInstrument, pyRspInfo, nRequestID, bIsLast)

# 取消订阅询价应答
cdef extern void OnStaticRspUnSubForQuoteRsp(CThostFtdcSpecificInstrumentField *pSpecificInstrument, CThostFtdcRspInfoField *pRspInfo, int nRequestID, bint bIsLast):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    pySpecificInstrument = pyThostFtdcSpecificInstrumentField()

    ###合约代码
    pySpecificInstrument.InstrumentID = pSpecificInstrument.InstrumentID #str [31]

    attr_decode(pySpecificInstrument)

    pyRspInfo = pyThostFtdcRspInfoField()

    ###错误代码
    pyRspInfo.ErrorID = pRspInfo.ErrorID #int
	###错误信息
    pyRspInfo.ErrorMsg = pRspInfo.ErrorMsg #str [81]

    attr_decode(pyRspInfo)

    clsMdSpiResponse.OnRspUnSubForQuoteRsp(pySpecificInstrument, pyRspInfo, nRequestID, bIsLast)

# 深度行情通知
cdef extern void OnStaticRtnDepthMarketData(CThostFtdcDepthMarketDataField *pDepthMarketData):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    pyDepthMarketData = pyThostFtdcDepthMarketDataField()

    ###交易日 DepthMarketData
    pyDepthMarketData.TradingDay = pDepthMarketData.TradingDay #str [9]

    ###合约代码
    pyDepthMarketData.InstrumentID = pDepthMarketData.InstrumentID #str [31]

    ###交易所代码
    pyDepthMarketData.ExchangeID = pDepthMarketData.ExchangeID #str [9]

    ###合约在交易所的代码
    pyDepthMarketData.ExchangeInstID = pDepthMarketData.ExchangeInstID #str [31]

    ###最新价
    pyDepthMarketData.LastPrice = pDepthMarketData.LastPrice #double

    ###上次结算价
    pyDepthMarketData.PreSettlementPrice = pDepthMarketData.PreSettlementPrice #double

    ###昨收盘
    pyDepthMarketData.PreClosePrice = pDepthMarketData.PreClosePrice #double

    ###昨持仓量
    pyDepthMarketData.PreOpenInterest = pDepthMarketData.PreOpenInterest #double

    ###今开盘
    pyDepthMarketData.OpenPrice = pDepthMarketData.OpenPrice #double

    ###最高价
    pyDepthMarketData.HighestPrice = pDepthMarketData.HighestPrice #double

    ###最低价
    pyDepthMarketData.LowestPrice = pDepthMarketData.LowestPrice #double

    ###数量
    pyDepthMarketData.Volume = pDepthMarketData.Volume #int

    ###成交金额
    pyDepthMarketData.Turnover = pDepthMarketData.Turnover #double

    ###持仓量
    pyDepthMarketData.OpenInterest = pDepthMarketData.OpenInterest #double

    ###今收盘
    pyDepthMarketData.ClosePrice = pDepthMarketData.ClosePrice #double

    ###本次结算价
    pyDepthMarketData.SettlementPrice = pDepthMarketData.SettlementPrice #double

    ###涨停板价
    pyDepthMarketData.UpperLimitPrice = pDepthMarketData.UpperLimitPrice #double

    ###跌停板价
    pyDepthMarketData.LowerLimitPrice = pDepthMarketData.LowerLimitPrice #double

    ###昨虚实度
    pyDepthMarketData.PreDelta = pDepthMarketData.PreDelta #double

    ###今虚实度
    pyDepthMarketData.CurrDelta = pDepthMarketData.CurrDelta #double

    ###最后修改时间
    pyDepthMarketData.UpdateTime = pDepthMarketData.UpdateTime #str [9]

    ###最后修改毫秒
    pyDepthMarketData.UpdateMillisec = pDepthMarketData.UpdateMillisec #int

    ###申买价一
    pyDepthMarketData.BidPrice1 = pDepthMarketData.BidPrice1 #double

    ###申买量一
    pyDepthMarketData.BidVolume1 = pDepthMarketData.BidVolume1 #int

    ###申卖价一
    pyDepthMarketData.AskPrice1 = pDepthMarketData.AskPrice1 #double

    ###申卖量一
    pyDepthMarketData.AskVolume1 = pDepthMarketData.AskVolume1 #int

    ###申买价二
    pyDepthMarketData.BidPrice2 = pDepthMarketData.BidPrice2 #double

    ###申买量二
    pyDepthMarketData.BidVolume2 = pDepthMarketData.BidVolume2 #int

    ###申卖价二
    pyDepthMarketData.AskPrice2 = pDepthMarketData.AskPrice2 #double

    ###申卖量二
    pyDepthMarketData.AskVolume2 = pDepthMarketData.AskVolume2 #int

    ###申买价三
    pyDepthMarketData.BidPrice3 = pDepthMarketData.BidPrice3 #double

    ###申买量三
    pyDepthMarketData.BidVolume3 = pDepthMarketData.BidVolume3 #int

    ###申卖价三
    pyDepthMarketData.AskPrice3 = pDepthMarketData.AskPrice3 #double

    ###申卖量三
    pyDepthMarketData.AskVolume3 = pDepthMarketData.AskVolume3 #int

    ###申买价四
    pyDepthMarketData.BidPrice4 = pDepthMarketData.BidPrice4 #double

    ###申买量四
    pyDepthMarketData.BidVolume4 = pDepthMarketData.BidVolume4 #int

    ###申卖价四
    pyDepthMarketData.AskPrice4 = pDepthMarketData.AskPrice4 #double

    ###申卖量四
    pyDepthMarketData.AskVolume4 = pDepthMarketData.AskVolume4 #int

    ###申买价五
    pyDepthMarketData.BidPrice5 = pDepthMarketData.BidPrice5 #double

    ###申买量五
    pyDepthMarketData.BidVolume5 = pDepthMarketData.BidVolume5 #int

    ###申卖价五
    pyDepthMarketData.AskPrice5 = pDepthMarketData.AskPrice5 #double

    ###申卖量五
    pyDepthMarketData.AskVolume5 = pDepthMarketData.AskVolume5 #int

    ###当日均价
    pyDepthMarketData.AveragePrice = pDepthMarketData.AveragePrice #double

    ###业务日期
    pyDepthMarketData.ActionDay = pDepthMarketData.ActionDay #str [9]

    attr_decode(pyDepthMarketData)

    clsMdSpiResponse.OnRtnDepthMarketData(pyDepthMarketData)

# 询价通知
cdef extern void OnStaticRtnForQuoteRsp(CThostFtdcForQuoteRspField *pForQuoteRsp):
    if not clsMdSpiResponse:
        return

    if not isinstance(clsMdSpiResponse, MdSpiResponse):
        raise TypeError

    pyForQuoteRsp = pyThostFtdcForQuoteRspField()

    ###交易日
    pyForQuoteRsp.TradingDay = pForQuoteRsp.TradingDay #str [9]

    ###合约代码
    pyForQuoteRsp.InstrumentID = pForQuoteRsp.InstrumentID #str [31]

    ###询价编号
    pyForQuoteRsp.ForQuoteSysID = pForQuoteRsp.ForQuoteSysID #str [21]

    ###询价时间
    pyForQuoteRsp.ForQuoteTime = pForQuoteRsp.ForQuoteTime #str [9]

    ###业务日期
    pyForQuoteRsp.ActionDay = pForQuoteRsp.ActionDay #str [9]

    ###交易所代码
    pyForQuoteRsp.ExchangeID = pForQuoteRsp.ExchangeID #str [9]

    attr_decode(pyForQuoteRsp)

    clsMdSpiResponse.OnRtnForQuoteRsp(pyForQuoteRsp)

cdef class PyMdApi:
    cdef MdApi * c_MdApi

    # 创建MdApi
    # @param pszFlowPath 存贮订阅信息文件的目录，默认为当前目录
    # @return 创建出的UserApi
    # modify for udp marketdata
    def __cinit__(self, pszFlowPath, bIsUsingUdp, bIsMulticast):
        self.c_MdApi = new MdApi(pszFlowPath.encode('gb2312'), bIsUsingUdp, bIsMulticast)

    def __dealloc__(self):
        del self.c_MdApi

    # 删除接口对象本身
    # @remark 不再使用本接口对象时,调用该函数删除接口对象
    def Release(self):
        self.c_MdApi.Release()
    
    # 初始化
    # @remark 初始化运行环境,只有调用后,接口才开始工作
    def Init(self):
        self.c_MdApi.Init()
        
    # 等待接口线程结束运行
    # @return 线程退出代码
    def Join(self):
        return self.c_MdApi.Join()
        
    # 获取当前交易日
    # @retrun 获取到的交易日
    # @remark 只有登录成功后,才能得到正确的交易日
    def GetTradingDay(self):
        return self.c_MdApi.GetTradingDay()
        
    # 注册前置机网络地址
    # @param pszFrontAddress：前置机网络地址。bytes
    # @remark 网络地址的格式为：“protocol://ipaddress:port”，如：”tcp://127.0.0.1:17001”。 
    # @remark “tcp”代表传输协议，“127.0.0.1”代表服务器地址。”17001”代表服务器端口号。
    def RegisterFront(self, pszFrontAddress):
        self.c_MdApi.RegisterFront(pszFrontAddress.encode('gb2312'))
        
    # 注册名字服务器网络地址
    # @param pszNsAddress：名字服务器网络地址。bytes
    # @remark 网络地址的格式为：“protocol:##ipaddress:port”，如：”tcp:##127.0.0.1:12001”。 
    # @remark “tcp”代表传输协议，“127.0.0.1”代表服务器地址。”12001”代表服务器端口号。
    # @remark RegisterNameServer优先于RegisterFront
    def RegisterNameServer(self, pszNsAddress):
        self.c_MdApi.RegisterNameServer(pszNsAddress)
        
    # 注册名字服务器用户信息
    # @param pFensUserInfo：用户信息。 CThostFtdcFensUserInfoField * 
    def RegisterFensUserInfo(self, pFensUserInfo):
        self.c_MdApi.RegisterFront(pFensUserInfo)
        
    # 注册回调接口
    def RegisterSpi(self):
        self.c_MdApi.RegisterSpi()
        
    # 订阅行情。
    # @param listInstrumentID 合约ID list
    # @remark 
    def SubscribeMarketData(self, listInstrumentID):
        nCount = len(listInstrumentID)
        listInstrumentID = [item.encode('gb2312') for item in listInstrumentID]

        cdef char **ppInstrumentID = <char **>malloc(nCount * sizeof(char *))
        if not ppInstrumentID:
            raise MemoryError()
        try:
            for i in range(nCount):
                ppInstrumentID[i] = listInstrumentID[i]

            return self.c_MdApi.SubscribeMarketData(ppInstrumentID, nCount)
        finally:
            # return the previously allocated memory to the system
            free(ppInstrumentID)

    # 退订行情。
    # @param listInstrumentID 合约ID list
    # @remark 
    def UnSubscribeMarketData(self, listInstrumentID):
        nCount = len(listInstrumentID)
        listInstrumentID = [item.encode('gb2312') for item in listInstrumentID]

        cdef char **ppInstrumentID = <char **>malloc(nCount * sizeof(char *))
        if not ppInstrumentID:
            raise MemoryError()
        try:
            for i in range(nCount):
                ppInstrumentID[i] = listInstrumentID[i]

            return self.c_MdApi.UnSubscribeMarketData(ppInstrumentID, nCount)
        finally:
            # return the previously allocated memory to the system
            free(ppInstrumentID)
    
    # 订阅询价。
    # @param listInstrumentID 合约ID list
    # @remark 
    def SubscribeForQuoteRsp(self, listInstrumentID):
        nCount = len(listInstrumentID)
        listInstrumentID = [item.encode('gb2312') for item in listInstrumentID]

        cdef char **ppInstrumentID = <char **>malloc(nCount * sizeof(char *))
        if not ppInstrumentID:
            raise MemoryError()
        try:
            for i in range(nCount):
                ppInstrumentID[i] = listInstrumentID[i]

            return self.c_MdApi.SubscribeForQuoteRsp(ppInstrumentID, nCount)
        finally:
            # return the previously allocated memory to the system
            free(ppInstrumentID)

    # 退订询价。
    # @param listInstrumentID 合约ID list
    # @remark 
    def UnSubscribeForQuoteRsp(self, listInstrumentID, nCount):
        nCount = len(listInstrumentID)
        listInstrumentID = [item.encode('gb2312') for item in listInstrumentID]

        cdef char **ppInstrumentID = <char **>malloc(nCount * sizeof(char *))
        if not ppInstrumentID:
            raise MemoryError()
        try:
            for i in range(nCount):
                ppInstrumentID[i] = listInstrumentID[i]

            return self.c_MdApi.UnSubscribeMarketData(ppInstrumentID, nCount)
        finally:
            # return the previously allocated memory to the system
            free(ppInstrumentID)

    # 用户登录请求
    # @param dictUserLogin
    # @param nRequestID int
    def ReqUserLogin(self, pyUserLogin, nRequestID): #pyThostFtdcReqUserLoginField
        
        cdef CThostFtdcReqUserLoginField UserLogin

        pyUserLogin.encode()

        ###交易日
        UserLogin.TradingDay = pyUserLogin.TradingDay

        ###经纪公司代码
        UserLogin.BrokerID = pyUserLogin.BrokerID

        ###用户代码
        UserLogin.UserID = pyUserLogin.UserID

        ###密码
        UserLogin.Password = pyUserLogin.Password

        ###用户端产品信息
        UserLogin.UserProductInfo = pyUserLogin.UserProductInfo

        ###接口端产品信息
        UserLogin.InterfaceProductInfo = pyUserLogin.InterfaceProductInfo

        ###协议信息
        UserLogin.ProtocolInfo = pyUserLogin.ProtocolInfo

        ###Mac地址
        UserLogin.MacAddress = pyUserLogin.MacAddress

        ###动态密码
        UserLogin.OneTimePassword = pyUserLogin.OneTimePassword

        ###终端IP地址
        UserLogin.ClientIPAddress = pyUserLogin.ClientIPAddress

        return self.c_MdApi.ReqUserLogin(&UserLogin, nRequestID)

    # 登出请求
    # @param BrokerID 经纪公司代码
    # @param UserID 用户代码
    # @param nRequestID int
    def ReqUserLogout(self, pyUserLogout, nRequestID): #pyThostFtdcUserLogoutField
        cdef CThostFtdcUserLogoutField UserLogout

        pyUserLogout.encode()
        
        UserLogout.BrokerID = pyUserLogout.BrokerID
        UserLogout.UserID = pyUserLogout.UserID
        return self.c_MdApi.ReqUserLogout(&UserLogout, nRequestID)


