# encoding: UTF-8

from pyctp import pyMdApi
from pyctp.pyMdApi import PyMdApi
from pyctp.ctpMdSpiResponse import MdSpiResponse
from pyctp.ctpStruct import pyThostFtdcReqUserLoginField, pyThostFtdcUserLogoutField

class myMdSpiResponse(MdSpiResponse):

    def __init__(self, pymadapi):
        self.pymadapi = pymadapi
        self.idRequest = 1

    # 当客户端与交易后台建立起通信连接时（还未登录前），该方法被调用。
    def OnFrontConnected(self):
        pyUserLogin = pyThostFtdcReqUserLoginField()
        pyUserLogin.BrokerID = '9999'
        pyUserLogin.UserID = '00000'
        pyUserLogin.Password = 'xxxxxx'

        self.idRequest += 1
        self.pymadapi.ReqUserLogin(pyUserLogin, self.idRequest)

    # 当客户端与交易后台通信连接断开时，该方法被调用。当发生这个情况后，API会自动重新连接，客户端可不做处理。
    # @param nReason 错误原因
    #         0x1001 网络读失败
    #         0x1002 网络写失败
    #         0x2001 接收心跳超时
    #         0x2002 发送心跳失败
    #         0x2003 收到错误报文
    def OnFrontDisconnected(self, nReason): #int
        print('OnFrontDisconnected / ', nReason)
        
    # 心跳超时警告。当长时间未收到报文时，该方法被调用。
    # @param nTimeLapse 距离上次接收报文的时间
    def OnHeartBeatWarning(self, nTimeLapse): #int
        print('OnHeartBeatWarning / ', nTimeLapse)

    # 登录请求响应
    def OnRspUserLogin(self, pyRspUserLogin, pyRspInfo, nRequestID, bIsLast):
        if pyRspInfo.ErrorID == 0:
            self.pymadapi.SubscribeMarketData(['rb1805'])
            print(pyRspUserLogin.TradingDay)
        else:
            print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)

    # 登出请求响应
    def OnRspUserLogout(self, pyUserLogout, pyRspInfo, nRequestID, bIsLast):
        if pyRspInfo.ErrorID == 0:
            print('OnRspUserLogout /', pyUserLogout.BrokerID, ':', pyUserLogout.UserID)
        else:
            print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)

    # 错误应答
    def OnRspError(self, pyRspInfo, nRequestID, bIsLast):
        print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)
        

    # 订阅行情应答
    def OnRspSubMarketData(self, pySpecificInstrument, pyRspInfo, nRequestID, bIsLast):
        if pyRspInfo.ErrorID == 0:
            print('OnRspSubMarketData /', pySpecificInstrument.InstrumentID)
        else:
            print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)

    # 取消订阅行情应答
    def OnRspUnSubMarketData(self, pySpecificInstrument, pyRspInfo, nRequestID, bIsLast):
        if pyRspInfo.ErrorID == 0:
            print('OnRspUnSubMarketData:', pySpecificInstrument.InstrumentID)
        else:
            print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)

    # 订阅询价应答
    def OnRspSubForQuoteRsp(self, pySpecificInstrument, pyRspInfo, nRequestID, bIsLast):
        if pyRspInfo.ErrorID == 0:
            print('OnRspSubForQuoteRsp:', pySpecificInstrument.InstrumentID)
        else:
            print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)

    # 取消订阅询价应答
    def OnRspUnSubForQuoteRsp(self, pySpecificInstrument, pyRspInfo, nRequestID, bIsLast):
        if pyRspInfo.ErrorID == 0:
            print('OnRspUnSubForQuoteRsp:', pySpecificInstrument.InstrumentID)
        else:
            print('ErrorID /', pyRspInfo.ErrorID, ', ErrorMsg /', pyRspInfo.ErrorMsg)

    # 深度行情通知
    def OnRtnDepthMarketData(self, pyDepthMarketData):
        print(pyDepthMarketData.UpdateTime, 'LastPrice=', pyDepthMarketData.LastPrice,\
              'bid=', pyDepthMarketData.BidPrice1, ':', pyDepthMarketData.BidVolume1,\
              'ask=', pyDepthMarketData.AskPrice1, ':', pyDepthMarketData.AskVolume1,\
              'open=', pyDepthMarketData.OpenInterest, 'volumn=', pyDepthMarketData.Volume)

    # 询价通知
    def OnRtnForQuoteRsp(self, pyForQuoteRsp):
        print('OnRtnForQuoteRsp / ', pyForQuoteRsp.InstrumentID, pyForQuoteRsp.ForQuoteSysID, pyForQuoteRsp.ForQuoteTime)

def main():

    pymadapi = PyMdApi('data/', False, False)
    
    pyMdApi.clsMdSpiResponse = myMdSpiResponse(pymadapi)
    
    pymadapi.RegisterSpi()
    
    pymadapi.RegisterFront('tcp://180.168.146.187:10010') 
    pymadapi.Init()
    pymadapi.Join()

if __name__ == '__main__':
    main()