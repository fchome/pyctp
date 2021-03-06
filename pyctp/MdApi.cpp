#include "MdApi.h"

#include "ThostFtdcMdApi.h"

#include "Windows.h"

MdApi::MdApi(){
    this->m_pThostFtdcMdApi = NULL;
    this->m_pMdSpi = NULL;
}

MdApi::MdApi(char *pszFlowPath, bool bIsUsingUdp, bool bIsMulticast){
    this->m_pThostFtdcMdApi = CThostFtdcMdApi::CreateFtdcMdApi(pszFlowPath, bIsUsingUdp, bIsMulticast);
    if (this->m_pThostFtdcMdApi == NULL){
        throw -1;
    }
}

///删除接口对象本身
///@remark 不再使用本接口对象时,调用该函数删除接口对象
void MdApi::Release(){
    this->m_pThostFtdcMdApi->Release();
}

///初始化
///@remark 初始化运行环境,只有调用后,接口才开始工作
void MdApi::Init(){
    this->m_pThostFtdcMdApi->Init();
}

///等待接口线程结束运行
///@return 线程退出代码
int MdApi::Join(){
    return this->m_pThostFtdcMdApi->Join();
}

///获取当前交易日
///@retrun 获取到的交易日
///@remark 只有登录成功后,才能得到正确的交易日
char *MdApi::GetTradingDay(){
    return (char *)this->m_pThostFtdcMdApi->GetTradingDay();
}

///注册前置机网络地址
///@param pszFrontAddress：前置机网络地址。
///@remark 网络地址的格式为：“protocol://ipaddress:port”，如：”tcp://127.0.0.1:17001”。 
///@remark “tcp”代表传输协议，“127.0.0.1”代表服务器地址。”17001”代表服务器端口号。
void MdApi::RegisterFront(char *pszFrontAddress){
    this->m_pThostFtdcMdApi->RegisterFront(pszFrontAddress);
}

///注册名字服务器网络地址
///@param pszNsAddress：名字服务器网络地址。
///@remark 网络地址的格式为：“protocol://ipaddress:port”，如：”tcp://127.0.0.1:12001”。 
///@remark “tcp”代表传输协议，“127.0.0.1”代表服务器地址。”12001”代表服务器端口号。
///@remark RegisterNameServer优先于RegisterFront
void MdApi::RegisterNameServer(char *pszNsAddress){
    this->m_pThostFtdcMdApi->RegisterNameServer(pszNsAddress);
}

///注册名字服务器用户信息
///@param pFensUserInfo：用户信息。
void MdApi::RegisterFensUserInfo(CThostFtdcFensUserInfoField * pFensUserInfo){
    this->m_pThostFtdcMdApi->RegisterFensUserInfo(pFensUserInfo);
}

///注册回调接口
void MdApi::RegisterSpi(){
    this->m_pMdSpi = new MdSpi(); ///派生自回调接口类的实例
    if (this->m_pMdSpi == NULL){
        throw -1;
    }

    this->m_pThostFtdcMdApi->RegisterSpi(this->m_pMdSpi);
}

///订阅行情。
///@param ppInstrumentID 合约ID  
///@param nCount 要订阅/退订行情的合约个数
///@remark 
int MdApi::SubscribeMarketData(char *ppInstrumentID[], int nCount){
    return this->m_pThostFtdcMdApi->SubscribeMarketData(ppInstrumentID, nCount);
}

///退订行情。
///@param ppInstrumentID 合约ID  
///@param nCount 要订阅/退订行情的合约个数
///@remark 
int MdApi::UnSubscribeMarketData(char *ppInstrumentID[], int nCount){
    return this->m_pThostFtdcMdApi->UnSubscribeMarketData(ppInstrumentID, nCount);
}

///订阅询价。
///@param ppInstrumentID 合约ID  
///@param nCount 要订阅/退订行情的合约个数
///@remark 
int MdApi::SubscribeForQuoteRsp(char *ppInstrumentID[], int nCount){
    return this->m_pThostFtdcMdApi->SubscribeForQuoteRsp(ppInstrumentID, nCount);
}

///退订询价。
///@param ppInstrumentID 合约ID  
///@param nCount 要订阅/退订行情的合约个数
///@remark 
int MdApi::UnSubscribeForQuoteRsp(char *ppInstrumentID[], int nCount){
    return this->m_pThostFtdcMdApi->UnSubscribeForQuoteRsp(ppInstrumentID, nCount);
}

///用户登录请求
int MdApi::ReqUserLogin(CThostFtdcReqUserLoginField *pReqUserLoginField, int nRequestID){
    return this->m_pThostFtdcMdApi->ReqUserLogin(pReqUserLoginField, nRequestID);
}


///登出请求
int MdApi::ReqUserLogout(CThostFtdcUserLogoutField *pUserLogout, int nRequestID){
    return this->m_pThostFtdcMdApi->ReqUserLogout(pUserLogout, nRequestID);
}

MdApi::~MdApi(){
    if (this->m_pThostFtdcMdApi)
    {
        this->m_pThostFtdcMdApi->RegisterSpi(NULL);
        this->m_pThostFtdcMdApi->Release();
        this->m_pThostFtdcMdApi = NULL;
    }

    if (this->m_pMdSpi)
    {
        delete this->m_pMdSpi;
        this->m_pMdSpi = NULL;
    }
}
