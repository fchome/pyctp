# encoding: UTF-8

#########################################################################
### 对MdSpi响应接收类，实际应用时需要继承，并给pyMdApi.clsMdSpiResponse赋值
### 具体看 pyMdSpi.pyx
###
#########################################################################

class MdSpiResponse(object):
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
    def OnFrontDisconnected(self, nReason): #int
        raise NotImplementedError
        
    # 心跳超时警告。当长时间未收到报文时，该方法被调用。
    # @param nTimeLapse 距离上次接收报文的时间
    def OnHeartBeatWarning(self, nTimeLapse): #int
        raise NotImplementedError

    # 登录请求响应
    def OnRspUserLogin(self, pyRspUserLogin, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 登出请求响应
    def OnRspUserLogout(self, pyUserLogout, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 错误应答
    def OnRspError(self, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 订阅行情应答
    def OnRspSubMarketData(self, pySpecificInstrument, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 取消订阅行情应答
    def OnRspUnSubMarketData(self, pySpecificInstrument, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 订阅询价应答
    def OnRspSubForQuoteRsp(self, pySpecificInstrument, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 取消订阅询价应答
    def OnRspUnSubForQuoteRsp(self, pySpecificInstrument, pyRspInfo, nRequestID, bIsLast):
        raise NotImplementedError

    # 深度行情通知
    def OnRtnDepthMarketData(self, pyDepthMarketData):
        raise NotImplementedError

    # 询价通知
    def OnRtnForQuoteRsp(self, pyForQuoteRsp):
        raise NotImplementedError