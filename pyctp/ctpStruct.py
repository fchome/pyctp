# encoding: UTF-8

#########################################################################
###@system 新一代交易所系统
###@company 上海期货信息技术有限公司
###@file ThostFtdcUserApiStruct.h
###@brief 定义了客户端接口使用的业务数据结构
###@history 
###20060106	赵鸿昊		创建该文件
#########################################################################

###信息分发
class pyThostFtdcDisseminationField:
	###序列系列号
    SequenceSeries = 0 #short
	###序列号
    SequenceNo = 0 #int

###用户登录请求
class pyThostFtdcReqUserLoginField:
	###交易日
    TradingDay = '' #str [9]
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###密码
    Password = '' #str [41]
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###接口端产品信息
    InterfaceProductInfo = '' #str [11]
	###协议信息
    ProtocolInfo = '' #str [11]
	###Mac地址
    MacAddress = '' #str [21]
	###动态密码
    OneTimePassword = '' #str [41]
	###终端IP地址
    ClientIPAddress = '' #str [16]

    def encode(self):
        self.TradingDay = self.TradingDay.encode('gb2312') + bytearray(9 - len(self.TradingDay)) #str [9]
        self.BrokerID = self.BrokerID.encode('gb2312') + bytearray(11 - len(self.BrokerID)) #str [11]
        self.UserID = self.UserID.encode('gb2312') + bytearray(16 - len(self.UserID)) #str [16]
        self.Password = self.Password.encode('gb2312') + bytearray(41 - len(self.Password)) #str [41]
        self.UserProductInfo = self.UserProductInfo.encode('gb2312') + bytearray(11 - len(self.UserProductInfo)) #str [11]
        self.InterfaceProductInfo = self.InterfaceProductInfo.encode('gb2312') + bytearray(11 - len(self.InterfaceProductInfo)) #str [11]
        self.ProtocolInfo = self.ProtocolInfo.encode('gb2312') + bytearray(11 - len(self.ProtocolInfo)) #str [11]
        self.MacAddress = self.MacAddress.encode('gb2312') + bytearray(21 - len(self.MacAddress)) #str [21]
        self.OneTimePassword = self.OneTimePassword.encode('gb2312') + bytearray(41 - len(self.OneTimePassword)) #str [41]
        self.ClientIPAddress = self.ClientIPAddress.encode('gb2312') + bytearray(16 - len(self.ClientIPAddress)) #str [16]

###用户登录应答
class pyThostFtdcRspUserLoginField:
	###交易日
    TradingDay = '' #str [9]
	###登录成功时间
    LoginTime = '' #str [9]
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###交易系统名称
    SystemName = '' #str [41]
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###最大报单引用
    MaxOrderRef = '' #str [13]
	###上期所时间
    SHFETime = '' #str [9]
	###大商所时间
    DCETime = '' #str [9]
	###郑商所时间
    CZCETime = '' #str [9]
	###中金所时间
    FFEXTime = '' #str [9]
	###能源中心时间
    INETime = '' #str [9]

###用户登出请求
class pyThostFtdcUserLogoutField:
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]

    def encode(self):
        self.BrokerID = self.BrokerID.encode('gb2312') + bytearray(11 - len(self.BrokerID)) #str [11]
        self.UserID = self.UserID.encode('gb2312') + bytearray(16 - len(self.UserID)) #str [16]

###强制交易员退出
class pyThostFtdcForceUserLogoutField:
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]

###客户端认证请求
class pyThostFtdcReqAuthenticateField:
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###认证码
    AuthCode = '' #str [17]

###客户端认证响应
class pyThostFtdcRspAuthenticateField:
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###用户端产品信息
    UserProductInfo = '' #str [11]

###客户端认证信息
class pyThostFtdcAuthenticationInfoField:
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###认证信息
    AuthInfo = '' #str [129]
	###是否为认证结果
    IsResult = 0 #int

###银期转帐报文头
class pyThostFtdcTransferHeaderField:
	###版本号，常量，1.0
    Version = '' #str [4]
	###交易代码，必填
    TradeCode = '' #str [7]
	###交易日期，必填，格式：yyyymmdd
    TradeDate = '' #str [9]
	###交易时间，必填，格式：hhmmss
    TradeTime = '' #str [9]
	###发起方流水号，N#A
    TradeSerial = '' #str [9]
	###期货公司代码，必填
    FutureID = '' #str [11]
	###银行代码，根据查询银行得到，必填
    BankID = '' #str [4]
	###银行分中心代码，根据查询银行得到，必填
    BankBrchID = '' #str [5]
	###操作员，N#A
    OperNo = '' #str [17]
	###交易设备类型，N#A
    DeviceID = '' #str [3]
	###记录数，N#A
    RecordNum = '' #str [7]
	###会话编号，N#A
    SessionID = 0 #int
	###请求编号，N#A
    RequestID = 0 #int

###银行资金转期货请求，TradeCode=202001
class pyThostFtdcTransferBankToFutureReqField:
	###期货资金账户
    FutureAccount = '' #str [13]
	###密码标志
    FuturePwdFlag = None #bytes [1]
	###密码
    FutureAccPwd = '' #str [17]
	###转账金额
    TradeAmt = 0 #double
	###客户手续费
    CustFee = 0 #double
	###币种：RMB-人民币 USD-美圆 HKD-港元
    CurrencyCode = '' #str [4]

###银行资金转期货请求响应
class pyThostFtdcTransferBankToFutureRspField:
	###响应代码
    RetCode = '' #str [5]
	###响应信息
    RetInfo = '' #str [129]
	###资金账户
    FutureAccount = '' #str [13]
	###转帐金额
    TradeAmt = 0 #double
	###应收客户手续费
    CustFee = 0 #double
	###币种
    CurrencyCode = '' #str [4]

###期货资金转银行请求，TradeCode=202002
class pyThostFtdcTransferFutureToBankReqField:
	###期货资金账户
    FutureAccount = '' #str [13]
	###密码标志
    FuturePwdFlag = None #bytes [1]
	###密码
    FutureAccPwd = '' #str [17]
	###转账金额
    TradeAmt = 0 #double
	###客户手续费
    CustFee = 0 #double
	###币种：RMB-人民币 USD-美圆 HKD-港元
    CurrencyCode = '' #str [4]

###期货资金转银行请求响应
class pyThostFtdcTransferFutureToBankRspField:
	###响应代码
    RetCode = '' #str [5]
	###响应信息
    RetInfo = '' #str [129]
	###资金账户
    FutureAccount = '' #str [13]
	###转帐金额
    TradeAmt = 0 #double
	###应收客户手续费
    CustFee = 0 #double
	###币种
    CurrencyCode = '' #str [4]

###查询银行资金请求，TradeCode=204002
class pyThostFtdcTransferQryBankReqField:
	###期货资金账户
    FutureAccount = '' #str [13]
	###密码标志
    FuturePwdFlag = None #bytes [1]
	###密码
    FutureAccPwd = '' #str [17]
	###币种：RMB-人民币 USD-美圆 HKD-港元
    CurrencyCode = '' #str [4]

###查询银行资金请求响应
class pyThostFtdcTransferQryBankRspField:
	###响应代码
    RetCode = '' #str [5]
	###响应信息
    RetInfo = '' #str [129]
	###资金账户
    FutureAccount = '' #str [13]
	###银行余额
    TradeAmt = 0 #double
	###银行可用余额
    UseAmt = 0 #double
	###银行可取余额
    FetchAmt = 0 #double
	###币种
    CurrencyCode = '' #str [4]

###查询银行交易明细请求，TradeCode=204999
class pyThostFtdcTransferQryDetailReqField:
	###期货资金账户
    FutureAccount = '' #str [13]

###查询银行交易明细请求响应
class pyThostFtdcTransferQryDetailRspField:
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###交易代码
    TradeCode = '' #str [7]
	###期货流水号
    FutureSerial = 0 #int
	###期货公司代码
    FutureID = '' #str [11]
	###资金帐号
    FutureAccount = '' #str [22]
	###银行流水号
    BankSerial = 0 #int
	###银行代码
    BankID = '' #str [4]
	###银行分中心代码
    BankBrchID = '' #str [5]
	###银行账号
    BankAccount = '' #str [41]
	###证件号码
    CertCode = '' #str [21]
	###货币代码
    CurrencyCode = '' #str [4]
	###发生金额
    TxAmount = 0 #double
	###有效标志
    Flag = None #bytes [1]

###响应信息
class pyThostFtdcRspInfoField:
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]

###交易所
class pyThostFtdcExchangeField:
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所名称
    ExchangeName = '' #str [61]
	###交易所属性
    ExchangeProperty = None #bytes [1]

###产品
class pyThostFtdcProductField:
	###产品代码
    ProductID = '' #str [31]
	###产品名称
    ProductName = '' #str [21]
	###交易所代码
    ExchangeID = '' #str [9]
	###产品类型
    ProductClass = None #bytes [1]
	###合约数量乘数
    VolumeMultiple = 0 #int
	###最小变动价位
    PriceTick = 0 #double
	###市价单最大下单量
    MaxMarketOrderVolume = 0 #int
	###市价单最小下单量
    MinMarketOrderVolume = 0 #int
	###限价单最大下单量
    MaxLimitOrderVolume = 0 #int
	###限价单最小下单量
    MinLimitOrderVolume = 0 #int
	###持仓类型
    PositionType = None #bytes [1]
	###持仓日期类型
    PositionDateType = None #bytes [1]
	###平仓处理类型
    CloseDealType = None #bytes [1]
	###交易币种类型
    TradeCurrencyID = '' #str [4]
	###质押资金可用范围
    MortgageFundUseRange = None #bytes [1]
	###交易所产品代码
    ExchangeProductID = '' #str [31]
	###合约基础商品乘数
    UnderlyingMultiple = 0 #double

###合约
class pyThostFtdcInstrumentField:
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###合约名称
    InstrumentName = '' #str [21]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###产品代码
    ProductID = '' #str [31]
	###产品类型
    ProductClass = None #bytes [1]
	###交割年份
    DeliveryYear = 0 #int
	###交割月
    DeliveryMonth = 0 #int
	###市价单最大下单量
    MaxMarketOrderVolume = 0 #int
	###市价单最小下单量
    MinMarketOrderVolume = 0 #int
	###限价单最大下单量
    MaxLimitOrderVolume = 0 #int
	###限价单最小下单量
    MinLimitOrderVolume = 0 #int
	###合约数量乘数
    VolumeMultiple = 0 #int
	###最小变动价位
    PriceTick = 0 #double
	###创建日
    CreateDate = '' #str [9]
	###上市日
    OpenDate = '' #str [9]
	###到期日
    ExpireDate = '' #str [9]
	###开始交割日
    StartDelivDate = '' #str [9]
	###结束交割日
    EndDelivDate = '' #str [9]
	###合约生命周期状态
    InstLifePhase = None #bytes [1]
	###当前是否交易
    IsTrading = 0 #int
	###持仓类型
    PositionType = None #bytes [1]
	###持仓日期类型
    PositionDateType = None #bytes [1]
	###多头保证金率
    LongMarginRatio = 0 #double
	###空头保证金率
    ShortMarginRatio = 0 #double
	###是否使用大额单边保证金算法
    MaxMarginSideAlgorithm = None #bytes [1]
	###基础商品代码
    UnderlyingInstrID = '' #str [31]
	###执行价
    StrikePrice = 0 #double
	###期权类型
    OptionsType = None #bytes [1]
	###合约基础商品乘数
    UnderlyingMultiple = 0 #double
	###组合类型
    CombinationType = None #bytes [1]

###经纪公司
class pyThostFtdcBrokerField:
	###经纪公司代码
    BrokerID = '' #str [11]
	###经纪公司简称
    BrokerAbbr = '' #str [9]
	###经纪公司名称
    BrokerName = '' #str [81]
	###是否活跃
    IsActive = 0 #int

###交易所交易员
class pyThostFtdcTraderField:
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###会员代码
    ParticipantID = '' #str [11]
	###密码
    Password = '' #str [41]
	###安装数量
    InstallCount = 0 #int
	###经纪公司代码
    BrokerID = '' #str [11]

###投资者
class pyThostFtdcInvestorField:
	###投资者代码
    InvestorID = '' #str [13]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者分组代码
    InvestorGroupID = '' #str [13]
	###投资者名称
    InvestorName = '' #str [81]
	###证件类型
    IdentifiedCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###是否活跃
    IsActive = 0 #int
	###联系电话
    Telephone = '' #str [41]
	###通讯地址
    Address = '' #str [101]
	###开户日期
    OpenDate = '' #str [9]
	###手机
    Mobile = '' #str [41]
	###手续费率模板代码
    CommModelID = '' #str [13]
	###保证金率模板代码
    MarginModelID = '' #str [13]

###交易编码
class pyThostFtdcTradingCodeField:
	###投资者代码
    InvestorID = '' #str [13]
	###经纪公司代码
    BrokerID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]
	###客户代码
    ClientID = '' #str [11]
	###是否活跃
    IsActive = 0 #int
	###交易编码类型
    ClientIDType = None #bytes [1]

###会员编码和经纪公司编码对照表
class pyThostFtdcPartBrokerField:
	###经纪公司代码
    BrokerID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###是否活跃
    IsActive = 0 #int

###管理用户
class pyThostFtdcSuperUserField:
	###用户代码
    UserID = '' #str [16]
	###用户名称
    UserName = '' #str [81]
	###密码
    Password = '' #str [41]
	###是否活跃
    IsActive = 0 #int

###管理用户功能权限
class pyThostFtdcSuperUserFunctionField:
	###用户代码
    UserID = '' #str [16]
	###功能代码
    FunctionCode = None #bytes [1]


###投资者组
class pyThostFtdcInvestorGroupField:
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者分组代码
    InvestorGroupID = '' #str [13]
	###投资者分组名称
    InvestorGroupName = '' #str [41]

###资金账户
class pyThostFtdcTradingAccountField:
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###上次质押金额
    PreMortgage = 0 #double
	###上次信用额度
    PreCredit = 0 #double
	###上次存款额
    PreDeposit = 0 #double
	###上次结算准备金
    PreBalance = 0 #double
	###上次占用的保证金
    PreMargin = 0 #double
	###利息基数
    InterestBase = 0 #double
	###利息收入
    Interest = 0 #double
	###入金金额
    Deposit = 0 #double
	###出金金额
    Withdraw = 0 #double
	###冻结的保证金
    FrozenMargin = 0 #double
	###冻结的资金
    FrozenCash = 0 #double
	###冻结的手续费
    FrozenCommission = 0 #double
	###当前保证金总额
    CurrMargin = 0 #double
	###资金差额
    CashIn = 0 #double
	###手续费
    Commission = 0 #double
	###平仓盈亏
    CloseProfit = 0 #double
	###持仓盈亏
    PositionProfit = 0 #double
	###期货结算准备金
    Balance = 0 #double
	###可用资金
    Available = 0 #double
	###可取资金
    WithdrawQuota = 0 #double
	###基本准备金
    Reserve = 0 #double
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###信用额度
    Credit = 0 #double
	###质押金额
    Mortgage = 0 #double
	###交易所保证金
    ExchangeMargin = 0 #double
	###投资者交割保证金
    DeliveryMargin = 0 #double
	###交易所交割保证金
    ExchangeDeliveryMargin = 0 #double
	###保底期货结算准备金
    ReserveBalance = 0 #double
	###币种代码
    CurrencyID = '' #str [4]
	###上次货币质入金额
    PreFundMortgageIn = 0 #double
	###上次货币质出金额
    PreFundMortgageOut = 0 #double
	###货币质入金额
    FundMortgageIn = 0 #double
	###货币质出金额
    FundMortgageOut = 0 #double
	###货币质押余额
    FundMortgageAvailable = 0 #double
	###可质押货币金额
    MortgageableFund = 0 #double
	###特殊产品占用保证金
    SpecProductMargin = 0 #double
	###特殊产品冻结保证金
    SpecProductFrozenMargin = 0 #double
	###特殊产品手续费
    SpecProductCommission = 0 #double
	###特殊产品冻结手续费
    SpecProductFrozenCommission = 0 #double
	###特殊产品持仓盈亏
    SpecProductPositionProfit = 0 #double
	###特殊产品平仓盈亏
    SpecProductCloseProfit = 0 #double
	###根据持仓盈亏算法计算的特殊产品持仓盈亏
    SpecProductPositionProfitByAlg = 0 #double
	###特殊产品交易所保证金
    SpecProductExchangeMargin = 0 #double


###投资者持仓
class pyThostFtdcInvestorPositionField:
	###合约代码
    InstrumentID = '' #str [31]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###持仓多空方向
    PosiDirection = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###持仓日期
    PositionDate = None #bytes [1]
	###上日持仓
    YdPosition = 0 #int
	###今日持仓
    Position = 0 #int
	###多头冻结
    LongFrozen = 0 #int
	###空头冻结
    ShortFrozen = 0 #int
	###开仓冻结金额
    LongFrozenAmount = 0 #double
	###开仓冻结金额
    ShortFrozenAmount = 0 #double
	###开仓量
    OpenVolume = 0 #int
	###平仓量
    CloseVolume = 0 #int
	###开仓金额
    OpenAmount = 0 #double
	###平仓金额
    CloseAmount = 0 #double
	###持仓成本
    PositionCost = 0 #double
	###上次占用的保证金
    PreMargin = 0 #double
	###占用的保证金
    UseMargin = 0 #double
	###冻结的保证金
    FrozenMargin = 0 #double
	###冻结的资金
    FrozenCash = 0 #double
	###冻结的手续费
    FrozenCommission = 0 #double
	###资金差额
    CashIn = 0 #double
	###手续费
    Commission = 0 #double
	###平仓盈亏
    CloseProfit = 0 #double
	###持仓盈亏
    PositionProfit = 0 #double
	###上次结算价
    PreSettlementPrice = 0 #double
	###本次结算价
    SettlementPrice = 0 #double
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###开仓成本
    OpenCost = 0 #double
	###交易所保证金
    ExchangeMargin = 0 #double
	###组合成交形成的持仓
    CombPosition = 0 #int
	###组合多头冻结
    CombLongFrozen = 0 #int
	###组合空头冻结
    CombShortFrozen = 0 #int
	###逐日盯市平仓盈亏
    CloseProfitByDate = 0 #double
	###逐笔对冲平仓盈亏
    CloseProfitByTrade = 0 #double
	###今日持仓
    TodayPosition = 0 #int
	###保证金率
    MarginRateByMoney = 0 #double
	###保证金率(按手数)
    MarginRateByVolume = 0 #double
	###执行冻结
    StrikeFrozen = 0 #int
	###执行冻结金额
    StrikeFrozenAmount = 0 #double
	###放弃执行冻结
    AbandonFrozen = 0 #int


###合约保证金率
class pyThostFtdcInstrumentMarginRateField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###多头保证金率
    LongMarginRatioByMoney = 0 #double
	###多头保证金费
    LongMarginRatioByVolume = 0 #double
	###空头保证金率
    ShortMarginRatioByMoney = 0 #double
	###空头保证金费
    ShortMarginRatioByVolume = 0 #double
	###是否相对交易所收取
    IsRelative = 0 #int


###合约手续费率
class pyThostFtdcInstrumentCommissionRateField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###开仓手续费率
    OpenRatioByMoney = 0 #double
	###开仓手续费
    OpenRatioByVolume = 0 #double
	###平仓手续费率
    CloseRatioByMoney = 0 #double
	###平仓手续费
    CloseRatioByVolume = 0 #double
	###平今手续费率
    CloseTodayRatioByMoney = 0 #double
	###平今手续费
    CloseTodayRatioByVolume = 0 #double


###深度行情
class pyThostFtdcDepthMarketDataField:

	###交易日
    TradingDay = '' #str [9]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###最新价
    LastPrice = 0 #double
	###上次结算价
    PreSettlementPrice = 0 #double
	###昨收盘
    PreClosePrice = 0 #double
	###昨持仓量
    PreOpenInterest = 0 #double
	###今开盘
    OpenPrice = 0 #double
	###最高价
    HighestPrice = 0 #double
	###最低价
    LowestPrice = 0 #double
	###数量
    Volume = 0 #int
	###成交金额
    Turnover = 0 #double
	###持仓量
    OpenInterest = 0 #double
	###今收盘
    ClosePrice = 0 #double
	###本次结算价
    SettlementPrice = 0 #double
	###涨停板价
    UpperLimitPrice = 0 #double
	###跌停板价
    LowerLimitPrice = 0 #double
	###昨虚实度
    PreDelta = 0 #double
	###今虚实度
    CurrDelta = 0 #double
	###最后修改时间
    UpdateTime = '' #str [9]
	###最后修改毫秒
    UpdateMillisec = 0 #int
	###申买价一
    BidPrice1 = 0 #double
	###申买量一
    BidVolume1 = 0 #int
	###申卖价一
    AskPrice1 = 0 #double
	###申卖量一
    AskVolume1 = 0 #int
	###申买价二
    BidPrice2 = 0 #double
	###申买量二
    BidVolume2 = 0 #int
	###申卖价二
    AskPrice2 = 0 #double
	###申卖量二
    AskVolume2 = 0 #int
	###申买价三
    BidPrice3 = 0 #double
	###申买量三
    BidVolume3 = 0 #int
	###申卖价三
    AskPrice3 = 0 #double
	###申卖量三
    AskVolume3 = 0 #int
	###申买价四
    BidPrice4 = 0 #double
	###申买量四
    BidVolume4 = 0 #int
	###申卖价四
    AskPrice4 = 0 #double
	###申卖量四
    AskVolume4 = 0 #int
	###申买价五
    BidPrice5 = 0 #double
	###申买量五
    BidVolume5 = 0 #int
	###申卖价五
    AskPrice5 = 0 #double
	###申卖量五
    AskVolume5 = 0 #int
	###当日均价
    AveragePrice = 0 #double
	###业务日期
    ActionDay = '' #str [9]


###投资者合约交易权限
class pyThostFtdcInstrumentTradingRightField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易权限
    TradingRight = None #bytes [1]


###经纪公司用户
class pyThostFtdcBrokerUserField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###用户名称
    UserName = '' #str [81]
	###用户类型
    UserType = None #bytes [1]
	###是否活跃
    IsActive = 0 #int
	###是否使用令牌
    IsUsingOTP = 0 #int


###经纪公司用户口令
class pyThostFtdcBrokerUserPasswordField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###密码
    Password = '' #str [41]


###经纪公司用户功能权限
class pyThostFtdcBrokerUserFunctionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###经纪公司功能代码
    BrokerFunctionCode = None #bytes [1]


###交易所交易员报盘机
class pyThostFtdcTraderOfferField:

	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###会员代码
    ParticipantID = '' #str [11]
	###密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###交易所交易员连接状态
    TraderConnectStatus = None #bytes [1]
	###发出连接请求的日期
    ConnectRequestDate = '' #str [9]
	###发出连接请求的时间
    ConnectRequestTime = '' #str [9]
	###上次报告日期
    LastReportDate = '' #str [9]
	###上次报告时间
    LastReportTime = '' #str [9]
	###完成连接日期
    ConnectDate = '' #str [9]
	###完成连接时间
    ConnectTime = '' #str [9]
	###启动日期
    StartDate = '' #str [9]
	###启动时间
    StartTime = '' #str [9]
	###交易日
    TradingDay = '' #str [9]
	###经纪公司代码
    BrokerID = '' #str [11]
	###本席位最大成交编号
    MaxTradeID = '' #str [21]
	###本席位最大报单备拷
    MaxOrderMessageReference = '' #str [7]


###投资者结算结果
class pyThostFtdcSettlementInfoField:

	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###序号
    SequenceNo = 0 #int
	###消息正文
    Content = '' #str [501]


###合约保证金率调整
class pyThostFtdcInstrumentMarginRateAdjustField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###多头保证金率
    LongMarginRatioByMoney = 0 #double
	###多头保证金费
    LongMarginRatioByVolume = 0 #double
	###空头保证金率
    ShortMarginRatioByMoney = 0 #double
	###空头保证金费
    ShortMarginRatioByVolume = 0 #double
	###是否相对交易所收取
    IsRelative = 0 #int


###交易所保证金率
class pyThostFtdcExchangeMarginRateField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###合约代码
    InstrumentID = '' #str [31]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###多头保证金率
    LongMarginRatioByMoney = 0 #double
	###多头保证金费
    LongMarginRatioByVolume = 0 #double
	###空头保证金率
    ShortMarginRatioByMoney = 0 #double
	###空头保证金费
    ShortMarginRatioByVolume = 0 #double


###交易所保证金率调整
class pyThostFtdcExchangeMarginRateAdjustField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###合约代码
    InstrumentID = '' #str [31]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###跟随交易所投资者多头保证金率
    LongMarginRatioByMoney = 0 #double
	###跟随交易所投资者多头保证金费
    LongMarginRatioByVolume = 0 #double
	###跟随交易所投资者空头保证金率
    ShortMarginRatioByMoney = 0 #double
	###跟随交易所投资者空头保证金费
    ShortMarginRatioByVolume = 0 #double
	###交易所多头保证金率
    ExchLongMarginRatioByMoney = 0 #double
	###交易所多头保证金费
    ExchLongMarginRatioByVolume = 0 #double
	###交易所空头保证金率
    ExchShortMarginRatioByMoney = 0 #double
	###交易所空头保证金费
    ExchShortMarginRatioByVolume = 0 #double
	###不跟随交易所投资者多头保证金率
    NoLongMarginRatioByMoney = 0 #double
	###不跟随交易所投资者多头保证金费
    NoLongMarginRatioByVolume = 0 #double
	###不跟随交易所投资者空头保证金率
    NoShortMarginRatioByMoney = 0 #double
	###不跟随交易所投资者空头保证金费
    NoShortMarginRatioByVolume = 0 #double


###汇率
class pyThostFtdcExchangeRateField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###源币种
    FromCurrencyID = '' #str [4]
	###源币种单位数量
    FromCurrencyUnit = 0 #double
	###目标币种
    ToCurrencyID = '' #str [4]
	###汇率
    ExchangeRate = 0 #double


###结算引用
class pyThostFtdcSettlementRefField:

	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int


###当前时间
class pyThostFtdcCurrentTimeField:

	###当前日期
    CurrDate = '' #str [9]
	###当前时间
    CurrTime = '' #str [9]
	###当前时间（毫秒）
    CurrMillisec = 0 #int
	###业务日期
    ActionDay = '' #str [9]


###通讯阶段
class pyThostFtdcCommPhaseField:

	###交易日
    TradingDay = '' #str [9]
	###通讯时段编号
    CommPhaseNo = 0 #short
	###系统编号
    SystemID = '' #str [21]


###登录信息
class pyThostFtdcLoginInfoField:

	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###登录日期
    LoginDate = '' #str [9]
	###登录时间
    LoginTime = '' #str [9]
	###IP地址
    IPAddress = '' #str [16]
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###接口端产品信息
    InterfaceProductInfo = '' #str [11]
	###协议信息
    ProtocolInfo = '' #str [11]
	###系统名称
    SystemName = '' #str [41]
	###密码
    Password = '' #str [41]
	###最大报单引用
    MaxOrderRef = '' #str [13]
	###上期所时间
    SHFETime = '' #str [9]
	###大商所时间
    DCETime = '' #str [9]
	###郑商所时间
    CZCETime = '' #str [9]
	###中金所时间
    FFEXTime = '' #str [9]
	###Mac地址
    MacAddress = '' #str [21]
	###动态密码
    OneTimePassword = '' #str [41]
	###能源中心时间
    INETime = '' #str [9]


###登录信息
class pyThostFtdcLogoutAllField:

	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###系统名称
    SystemName = '' #str [41]


###前置状态
class pyThostFtdcFrontStatusField:

	###前置编号
    FrontID = 0 #int
	###上次报告日期
    LastReportDate = '' #str [9]
	###上次报告时间
    LastReportTime = '' #str [9]
	###是否活跃
    IsActive = 0 #int


###用户口令变更
class pyThostFtdcUserPasswordUpdateField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###原来的口令
    OldPassword = '' #str [41]
	###新的口令
    NewPassword = '' #str [41]


###输入报单
class pyThostFtdcInputOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###报单引用
    OrderRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###报单价格条件
    OrderPriceType = None #bytes [1]
	###买卖方向
    Direction = None #bytes [1]
	###组合开平标志
    CombOffsetFlag = '' #str [5]
	###组合投机套保标志
    CombHedgeFlag = '' #str [5]
	###价格
    LimitPrice = 0 #double
	###数量
    VolumeTotalOriginal = 0 #int
	###有效期类型
    TimeCondition = None #bytes [1]
	###GTD日期
    GTDDate = '' #str [9]
	###成交量类型
    VolumeCondition = None #bytes [1]
	###最小成交量
    MinVolume = 0 #int
	###触发条件
    ContingentCondition = None #bytes [1]
	###止损价
    StopPrice = 0 #double
	###强平原因
    ForceCloseReason = None #bytes [1]
	###自动挂起标志
    IsAutoSuspend = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###请求编号
    RequestID = 0 #int
	###用户强评标志
    UserForceClose = 0 #int
	###互换单标志
    IsSwapOrder = 0 #int


###报单
class pyThostFtdcOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###报单引用
    OrderRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###报单价格条件
    OrderPriceType = None #bytes [1]
	###买卖方向
    Direction = None #bytes [1]
	###组合开平标志
    CombOffsetFlag = '' #str [5]
	###组合投机套保标志
    CombHedgeFlag = '' #str [5]
	###价格
    LimitPrice = 0 #double
	###数量
    VolumeTotalOriginal = 0 #int
	###有效期类型
    TimeCondition = None #bytes [1]
	###GTD日期
    GTDDate = '' #str [9]
	###成交量类型
    VolumeCondition = None #bytes [1]
	###最小成交量
    MinVolume = 0 #int
	###触发条件
    ContingentCondition = None #bytes [1]
	###止损价
    StopPrice = 0 #double
	###强平原因
    ForceCloseReason = None #bytes [1]
	###自动挂起标志
    IsAutoSuspend = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###请求编号
    RequestID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###报单提交状态
    OrderSubmitStatus = None #bytes [1]
	###报单提示序号
    NotifySequence = 0 #int
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###报单编号
    OrderSysID = '' #str [21]
	###报单来源
    OrderSource = None #bytes [1]
	###报单状态
    OrderStatus = None #bytes [1]
	###报单类型
    OrderType = None #bytes [1]
	###今成交数量
    VolumeTraded = 0 #int
	###剩余数量
    VolumeTotal = 0 #int
	###报单日期
    InsertDate = '' #str [9]
	###委托时间
    InsertTime = '' #str [9]
	###激活时间
    ActiveTime = '' #str [9]
	###挂起时间
    SuspendTime = '' #str [9]
	###最后修改时间
    UpdateTime = '' #str [9]
	###撤销时间
    CancelTime = '' #str [9]
	###最后修改交易所交易员代码
    ActiveTraderID = '' #str [21]
	###结算会员编号
    ClearingPartID = '' #str [11]
	###序号
    SequenceNo = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###状态信息
    StatusMsg = '' #str [81]
	###用户强评标志
    UserForceClose = 0 #int
	###操作用户代码
    ActiveUserID = '' #str [16]
	###经纪公司报单编号
    BrokerOrderSeq = 0 #int
	###相关报单
    RelativeOrderSysID = '' #str [21]
	###郑商所成交数量
    ZCETotalTradedVolume = 0 #int
	###互换单标志
    IsSwapOrder = 0 #int


###交易所报单
class pyThostFtdcExchangeOrderField:

	###报单价格条件
    OrderPriceType = None #bytes [1]
	###买卖方向
    Direction = None #bytes [1]
	###组合开平标志
    CombOffsetFlag = '' #str [5]
	###组合投机套保标志
    CombHedgeFlag = '' #str [5]
	###价格
    LimitPrice = 0 #double
	###数量
    VolumeTotalOriginal = 0 #int
	###有效期类型
    TimeCondition = None #bytes [1]
	###GTD日期
    GTDDate = '' #str [9]
	###成交量类型
    VolumeCondition = None #bytes [1]
	###最小成交量
    MinVolume = 0 #int
	###触发条件
    ContingentCondition = None #bytes [1]
	###止损价
    StopPrice = 0 #double
	###强平原因
    ForceCloseReason = None #bytes [1]
	###自动挂起标志
    IsAutoSuspend = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###请求编号
    RequestID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###报单提交状态
    OrderSubmitStatus = None #bytes [1]
	###报单提示序号
    NotifySequence = 0 #int
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###报单编号
    OrderSysID = '' #str [21]
	###报单来源
    OrderSource = None #bytes [1]
	###报单状态
    OrderStatus = None #bytes [1]
	###报单类型
    OrderType = None #bytes [1]
	###今成交数量
    VolumeTraded = 0 #int
	###剩余数量
    VolumeTotal = 0 #int
	###报单日期
    InsertDate = '' #str [9]
	###委托时间
    InsertTime = '' #str [9]
	###激活时间
    ActiveTime = '' #str [9]
	###挂起时间
    SuspendTime = '' #str [9]
	###最后修改时间
    UpdateTime = '' #str [9]
	###撤销时间
    CancelTime = '' #str [9]
	###最后修改交易所交易员代码
    ActiveTraderID = '' #str [21]
	###结算会员编号
    ClearingPartID = '' #str [11]
	###序号
    SequenceNo = 0 #int


###交易所报单插入失败
class pyThostFtdcExchangeOrderInsertErrorField:

	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###输入报单操作
class pyThostFtdcInputOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###报单操作引用
    OrderActionRef = 0 #int
	###报单引用
    OrderRef = '' #str [13]
	###请求编号
    RequestID = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###报单编号
    OrderSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###价格
    LimitPrice = 0 #double
	###数量变化
    VolumeChange = 0 #int
	###用户代码
    UserID = '' #str [16]
	###合约代码
    InstrumentID = '' #str [31]


###报单操作
class pyThostFtdcOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###报单操作引用
    OrderActionRef = 0 #int
	###报单引用
    OrderRef = '' #str [13]
	###请求编号
    RequestID = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###报单编号
    OrderSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###价格
    LimitPrice = 0 #double
	###数量变化
    VolumeChange = 0 #int
	###操作日期
    ActionDate = '' #str [9]
	###操作时间
    ActionTime = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###操作本地编号
    ActionLocalID = '' #str [13]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###业务单元
    BusinessUnit = '' #str [21]
	###报单操作状态
    OrderActionStatus = None #bytes [1]
	###用户代码
    UserID = '' #str [16]
	###状态信息
    StatusMsg = '' #str [81]
	###合约代码
    InstrumentID = '' #str [31]


###交易所报单操作
class pyThostFtdcExchangeOrderActionField:

	###交易所代码
    ExchangeID = '' #str [9]
	###报单编号
    OrderSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###价格
    LimitPrice = 0 #double
	###数量变化
    VolumeChange = 0 #int
	###操作日期
    ActionDate = '' #str [9]
	###操作时间
    ActionTime = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###操作本地编号
    ActionLocalID = '' #str [13]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###业务单元
    BusinessUnit = '' #str [21]
	###报单操作状态
    OrderActionStatus = None #bytes [1]
	###用户代码
    UserID = '' #str [16]


###交易所报单操作失败
class pyThostFtdcExchangeOrderActionErrorField:

	###交易所代码
    ExchangeID = '' #str [9]
	###报单编号
    OrderSysID = '' #str [21]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###操作本地编号
    ActionLocalID = '' #str [13]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###交易所成交
class pyThostFtdcExchangeTradeField:

	###交易所代码
    ExchangeID = '' #str [9]
	###成交编号
    TradeID = '' #str [21]
	###买卖方向
    Direction = None #bytes [1]
	###报单编号
    OrderSysID = '' #str [21]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###交易角色
    TradingRole = None #bytes [1]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###开平标志
    OffsetFlag = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###价格
    Price = 0 #double
	###数量
    Volume = 0 #int
	###成交时期
    TradeDate = '' #str [9]
	###成交时间
    TradeTime = '' #str [9]
	###成交类型
    TradeType = None #bytes [1]
	###成交价来源
    PriceSource = None #bytes [1]
	###交易所交易员代码
    TraderID = '' #str [21]
	###本地报单编号
    OrderLocalID = '' #str [13]
	###结算会员编号
    ClearingPartID = '' #str [11]
	###业务单元
    BusinessUnit = '' #str [21]
	###序号
    SequenceNo = 0 #int
	###成交来源
    TradeSource = None #bytes [1]


###成交
class pyThostFtdcTradeField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###报单引用
    OrderRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###交易所代码
    ExchangeID = '' #str [9]
	###成交编号
    TradeID = '' #str [21]
	###买卖方向
    Direction = None #bytes [1]
	###报单编号
    OrderSysID = '' #str [21]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###交易角色
    TradingRole = None #bytes [1]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###开平标志
    OffsetFlag = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###价格
    Price = 0 #double
	###数量
    Volume = 0 #int
	###成交时期
    TradeDate = '' #str [9]
	###成交时间
    TradeTime = '' #str [9]
	###成交类型
    TradeType = None #bytes [1]
	###成交价来源
    PriceSource = None #bytes [1]
	###交易所交易员代码
    TraderID = '' #str [21]
	###本地报单编号
    OrderLocalID = '' #str [13]
	###结算会员编号
    ClearingPartID = '' #str [11]
	###业务单元
    BusinessUnit = '' #str [21]
	###序号
    SequenceNo = 0 #int
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###经纪公司报单编号
    BrokerOrderSeq = 0 #int
	###成交来源
    TradeSource = None #bytes [1]


###用户会话
class pyThostFtdcUserSessionField:

	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###登录日期
    LoginDate = '' #str [9]
	###登录时间
    LoginTime = '' #str [9]
	###IP地址
    IPAddress = '' #str [16]
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###接口端产品信息
    InterfaceProductInfo = '' #str [11]
	###协议信息
    ProtocolInfo = '' #str [11]
	###Mac地址
    MacAddress = '' #str [21]


###查询最大报单数量
class pyThostFtdcQueryMaxOrderVolumeField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###买卖方向
    Direction = None #bytes [1]
	###开平标志
    OffsetFlag = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###最大允许报单数量
    MaxVolume = 0 #int


###投资者结算结果确认信息
class pyThostFtdcSettlementInfoConfirmField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###确认日期
    ConfirmDate = '' #str [9]
	###确认时间
    ConfirmTime = '' #str [9]


###出入金同步
class pyThostFtdcSyncDepositField:

	###出入金流水号
    DepositSeqNo = '' #str [15]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###入金金额
    Deposit = 0 #double
	###是否强制进行
    IsForce = 0 #int
	###币种代码
    CurrencyID = '' #str [4]


###货币质押同步
class pyThostFtdcSyncFundMortgageField:

	###货币质押流水号
    MortgageSeqNo = '' #str [15]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###源币种
    FromCurrencyID = '' #str [4]
	###质押金额
    MortgageAmount = 0 #double
	###目标币种
    ToCurrencyID = '' #str [4]


###经纪公司同步
class pyThostFtdcBrokerSyncField:

	###经纪公司代码
    BrokerID = '' #str [11]


###正在同步中的投资者
class pyThostFtdcSyncingInvestorField:

	###投资者代码
    InvestorID = '' #str [13]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者分组代码
    InvestorGroupID = '' #str [13]
	###投资者名称
    InvestorName = '' #str [81]
	###证件类型
    IdentifiedCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###是否活跃
    IsActive = 0 #int
	###联系电话
    Telephone = '' #str [41]
	###通讯地址
    Address = '' #str [101]
	###开户日期
    OpenDate = '' #str [9]
	###手机
    Mobile = '' #str [41]
	###手续费率模板代码
    CommModelID = '' #str [13]
	###保证金率模板代码
    MarginModelID = '' #str [13]


###正在同步中的交易代码
class pyThostFtdcSyncingTradingCodeField:

	###投资者代码
    InvestorID = '' #str [13]
	###经纪公司代码
    BrokerID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]
	###客户代码
    ClientID = '' #str [11]
	###是否活跃
    IsActive = 0 #int
	###交易编码类型
    ClientIDType = None #bytes [1]


###正在同步中的投资者分组
class pyThostFtdcSyncingInvestorGroupField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者分组代码
    InvestorGroupID = '' #str [13]
	###投资者分组名称
    InvestorGroupName = '' #str [41]


###正在同步中的交易账号
class pyThostFtdcSyncingTradingAccountField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###上次质押金额
    PreMortgage = 0 #double
	###上次信用额度
    PreCredit = 0 #double
	###上次存款额
    PreDeposit = 0 #double
	###上次结算准备金
    PreBalance = 0 #double
	###上次占用的保证金
    PreMargin = 0 #double
	###利息基数
    InterestBase = 0 #double
	###利息收入
    Interest = 0 #double
	###入金金额
    Deposit = 0 #double
	###出金金额
    Withdraw = 0 #double
	###冻结的保证金
    FrozenMargin = 0 #double
	###冻结的资金
    FrozenCash = 0 #double
	###冻结的手续费
    FrozenCommission = 0 #double
	###当前保证金总额
    CurrMargin = 0 #double
	###资金差额
    CashIn = 0 #double
	###手续费
    Commission = 0 #double
	###平仓盈亏
    CloseProfit = 0 #double
	###持仓盈亏
    PositionProfit = 0 #double
	###期货结算准备金
    Balance = 0 #double
	###可用资金
    Available = 0 #double
	###可取资金
    WithdrawQuota = 0 #double
	###基本准备金
    Reserve = 0 #double
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###信用额度
    Credit = 0 #double
	###质押金额
    Mortgage = 0 #double
	###交易所保证金
    ExchangeMargin = 0 #double
	###投资者交割保证金
    DeliveryMargin = 0 #double
	###交易所交割保证金
    ExchangeDeliveryMargin = 0 #double
	###保底期货结算准备金
    ReserveBalance = 0 #double
	###币种代码
    CurrencyID = '' #str [4]
	###上次货币质入金额
    PreFundMortgageIn = 0 #double
	###上次货币质出金额
    PreFundMortgageOut = 0 #double
	###货币质入金额
    FundMortgageIn = 0 #double
	###货币质出金额
    FundMortgageOut = 0 #double
	###货币质押余额
    FundMortgageAvailable = 0 #double
	###可质押货币金额
    MortgageableFund = 0 #double
	###特殊产品占用保证金
    SpecProductMargin = 0 #double
	###特殊产品冻结保证金
    SpecProductFrozenMargin = 0 #double
	###特殊产品手续费
    SpecProductCommission = 0 #double
	###特殊产品冻结手续费
    SpecProductFrozenCommission = 0 #double
	###特殊产品持仓盈亏
    SpecProductPositionProfit = 0 #double
	###特殊产品平仓盈亏
    SpecProductCloseProfit = 0 #double
	###根据持仓盈亏算法计算的特殊产品持仓盈亏
    SpecProductPositionProfitByAlg = 0 #double
	###特殊产品交易所保证金
    SpecProductExchangeMargin = 0 #double


###正在同步中的投资者持仓
class pyThostFtdcSyncingInvestorPositionField:

	###合约代码
    InstrumentID = '' #str [31]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###持仓多空方向
    PosiDirection = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###持仓日期
    PositionDate = None #bytes [1]
	###上日持仓
    YdPosition = 0 #int
	###今日持仓
    Position = 0 #int
	###多头冻结
    LongFrozen = 0 #int
	###空头冻结
    ShortFrozen = 0 #int
	###开仓冻结金额
    LongFrozenAmount = 0 #double
	###开仓冻结金额
    ShortFrozenAmount = 0 #double
	###开仓量
    OpenVolume = 0 #int
	###平仓量
    CloseVolume = 0 #int
	###开仓金额
    OpenAmount = 0 #double
	###平仓金额
    CloseAmount = 0 #double
	###持仓成本
    PositionCost = 0 #double
	###上次占用的保证金
    PreMargin = 0 #double
	###占用的保证金
    UseMargin = 0 #double
	###冻结的保证金
    FrozenMargin = 0 #double
	###冻结的资金
    FrozenCash = 0 #double
	###冻结的手续费
    FrozenCommission = 0 #double
	###资金差额
    CashIn = 0 #double
	###手续费
    Commission = 0 #double
	###平仓盈亏
    CloseProfit = 0 #double
	###持仓盈亏
    PositionProfit = 0 #double
	###上次结算价
    PreSettlementPrice = 0 #double
	###本次结算价
    SettlementPrice = 0 #double
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###开仓成本
    OpenCost = 0 #double
	###交易所保证金
    ExchangeMargin = 0 #double
	###组合成交形成的持仓
    CombPosition = 0 #int
	###组合多头冻结
    CombLongFrozen = 0 #int
	###组合空头冻结
    CombShortFrozen = 0 #int
	###逐日盯市平仓盈亏
    CloseProfitByDate = 0 #double
	###逐笔对冲平仓盈亏
    CloseProfitByTrade = 0 #double
	###今日持仓
    TodayPosition = 0 #int
	###保证金率
    MarginRateByMoney = 0 #double
	###保证金率(按手数)
    MarginRateByVolume = 0 #double
	###执行冻结
    StrikeFrozen = 0 #int
	###执行冻结金额
    StrikeFrozenAmount = 0 #double
	###放弃执行冻结
    AbandonFrozen = 0 #int


###正在同步中的合约保证金率
class pyThostFtdcSyncingInstrumentMarginRateField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###多头保证金率
    LongMarginRatioByMoney = 0 #double
	###多头保证金费
    LongMarginRatioByVolume = 0 #double
	###空头保证金率
    ShortMarginRatioByMoney = 0 #double
	###空头保证金费
    ShortMarginRatioByVolume = 0 #double
	###是否相对交易所收取
    IsRelative = 0 #int


###正在同步中的合约手续费率
class pyThostFtdcSyncingInstrumentCommissionRateField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###开仓手续费率
    OpenRatioByMoney = 0 #double
	###开仓手续费
    OpenRatioByVolume = 0 #double
	###平仓手续费率
    CloseRatioByMoney = 0 #double
	###平仓手续费
    CloseRatioByVolume = 0 #double
	###平今手续费率
    CloseTodayRatioByMoney = 0 #double
	###平今手续费
    CloseTodayRatioByVolume = 0 #double


###正在同步中的合约交易权限
class pyThostFtdcSyncingInstrumentTradingRightField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易权限
    TradingRight = None #bytes [1]


###查询报单
class pyThostFtdcQryOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###报单编号
    OrderSysID = '' #str [21]
	###开始时间
    InsertTimeStart = '' #str [9]
	###结束时间
    InsertTimeEnd = '' #str [9]


###查询成交
class pyThostFtdcQryTradeField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###成交编号
    TradeID = '' #str [21]
	###开始时间
    TradeTimeStart = '' #str [9]
	###结束时间
    TradeTimeEnd = '' #str [9]


###查询投资者持仓
class pyThostFtdcQryInvestorPositionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]


###查询资金账户
class pyThostFtdcQryTradingAccountField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###币种代码
    CurrencyID = '' #str [4]


###查询投资者
class pyThostFtdcQryInvestorField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###查询交易编码
class pyThostFtdcQryTradingCodeField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###客户代码
    ClientID = '' #str [11]
	###交易编码类型
    ClientIDType = None #bytes [1]


###查询投资者组
class pyThostFtdcQryInvestorGroupField:

	###经纪公司代码
    BrokerID = '' #str [11]


###查询合约保证金率
class pyThostFtdcQryInstrumentMarginRateField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###投机套保标志
    HedgeFlag = None #bytes [1]


###查询手续费率
class pyThostFtdcQryInstrumentCommissionRateField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]


###查询合约交易权限
class pyThostFtdcQryInstrumentTradingRightField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]


###查询经纪公司
class pyThostFtdcQryBrokerField:

	###经纪公司代码
    BrokerID = '' #str [11]


###查询交易员
class pyThostFtdcQryTraderField:

	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###交易所交易员代码
    TraderID = '' #str [21]


###查询管理用户功能权限
class pyThostFtdcQrySuperUserFunctionField:

	###用户代码
    UserID = '' #str [16]


###查询用户会话
class pyThostFtdcQryUserSessionField:

	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]


###查询经纪公司会员代码
class pyThostFtdcQryPartBrokerField:

	###交易所代码
    ExchangeID = '' #str [9]
	###经纪公司代码
    BrokerID = '' #str [11]
	###会员代码
    ParticipantID = '' #str [11]


###查询前置状态
class pyThostFtdcQryFrontStatusField:

	###前置编号
    FrontID = 0 #int


###查询交易所报单
class pyThostFtdcQryExchangeOrderField:

	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]


###查询报单操作
class pyThostFtdcQryOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]


###查询交易所报单操作
class pyThostFtdcQryExchangeOrderActionField:

	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]


###查询管理用户
class pyThostFtdcQrySuperUserField:

	###用户代码
    UserID = '' #str [16]


###查询交易所
class pyThostFtdcQryExchangeField:

	###交易所代码
    ExchangeID = '' #str [9]


###查询产品
class pyThostFtdcQryProductField:

	###产品代码
    ProductID = '' #str [31]
	###产品类型
    ProductClass = None #bytes [1]


###查询合约
class pyThostFtdcQryInstrumentField:

	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###产品代码
    ProductID = '' #str [31]


###查询行情
class pyThostFtdcQryDepthMarketDataField:

	###合约代码
    InstrumentID = '' #str [31]


###查询经纪公司用户
class pyThostFtdcQryBrokerUserField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]


###查询经纪公司用户权限
class pyThostFtdcQryBrokerUserFunctionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]


###查询交易员报盘机
class pyThostFtdcQryTraderOfferField:

	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###交易所交易员代码
    TraderID = '' #str [21]


###查询出入金流水
class pyThostFtdcQrySyncDepositField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###出入金流水号
    DepositSeqNo = '' #str [15]


###查询投资者结算结果
class pyThostFtdcQrySettlementInfoField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易日
    TradingDay = '' #str [9]


###查询交易所保证金率
class pyThostFtdcQryExchangeMarginRateField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###合约代码
    InstrumentID = '' #str [31]
	###投机套保标志
    HedgeFlag = None #bytes [1]


###查询交易所调整保证金率
class pyThostFtdcQryExchangeMarginRateAdjustField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###合约代码
    InstrumentID = '' #str [31]
	###投机套保标志
    HedgeFlag = None #bytes [1]


###查询汇率
class pyThostFtdcQryExchangeRateField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###源币种
    FromCurrencyID = '' #str [4]
	###目标币种
    ToCurrencyID = '' #str [4]


###查询货币质押流水
class pyThostFtdcQrySyncFundMortgageField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###货币质押流水号
    MortgageSeqNo = '' #str [15]


###查询报单
class pyThostFtdcQryHisOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###报单编号
    OrderSysID = '' #str [21]
	###开始时间
    InsertTimeStart = '' #str [9]
	###结束时间
    InsertTimeEnd = '' #str [9]
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int


###当前期权合约最小保证金
class pyThostFtdcOptionInstrMiniMarginField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###单位（手）期权合约最小保证金
    MinMargin = 0 #double
	###取值方式
    ValueMethod = None #bytes [1]
	###是否跟随交易所收取
    IsRelative = 0 #int


###当前期权合约保证金调整系数
class pyThostFtdcOptionInstrMarginAdjustField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###投机空头保证金调整系数
    SShortMarginRatioByMoney = 0 #double
	###投机空头保证金调整系数
    SShortMarginRatioByVolume = 0 #double
	###保值空头保证金调整系数
    HShortMarginRatioByMoney = 0 #double
	###保值空头保证金调整系数
    HShortMarginRatioByVolume = 0 #double
	###套利空头保证金调整系数
    AShortMarginRatioByMoney = 0 #double
	###套利空头保证金调整系数
    AShortMarginRatioByVolume = 0 #double
	###是否跟随交易所收取
    IsRelative = 0 #int


###当前期权合约手续费的详细内容
class pyThostFtdcOptionInstrCommRateField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###开仓手续费率
    OpenRatioByMoney = 0 #double
	###开仓手续费
    OpenRatioByVolume = 0 #double
	###平仓手续费率
    CloseRatioByMoney = 0 #double
	###平仓手续费
    CloseRatioByVolume = 0 #double
	###平今手续费率
    CloseTodayRatioByMoney = 0 #double
	###平今手续费
    CloseTodayRatioByVolume = 0 #double
	###执行手续费率
    StrikeRatioByMoney = 0 #double
	###执行手续费
    StrikeRatioByVolume = 0 #double


###期权交易成本
class pyThostFtdcOptionInstrTradeCostField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###期权合约保证金不变部分
    FixedMargin = 0 #double
	###期权合约最小保证金
    MiniMargin = 0 #double
	###期权合约权利金
    Royalty = 0 #double
	###交易所期权合约保证金不变部分
    ExchFixedMargin = 0 #double
	###交易所期权合约最小保证金
    ExchMiniMargin = 0 #double


###期权交易成本查询
class pyThostFtdcQryOptionInstrTradeCostField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###期权合约报价
    InputPrice = 0 #double
	###标的价格,填0则用昨结算价
    UnderlyingPrice = 0 #double


###期权手续费率查询
class pyThostFtdcQryOptionInstrCommRateField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]


###股指现货指数
class pyThostFtdcIndexPriceField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###合约代码
    InstrumentID = '' #str [31]
	###指数现货收盘价
    ClosePrice = 0 #double


###输入的执行宣告
class pyThostFtdcInputExecOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###执行宣告引用
    ExecOrderRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###数量
    Volume = 0 #int
	###请求编号
    RequestID = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###开平标志
    OffsetFlag = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###执行类型
    ActionType = None #bytes [1]
	###保留头寸申请的持仓方向
    PosiDirection = None #bytes [1]
	###期权行权后是否保留期货头寸的标记
    ReservePositionFlag = None #bytes [1]
	###期权行权后生成的头寸是否自动平仓
    CloseFlag = None #bytes [1]


###输入执行宣告操作
class pyThostFtdcInputExecOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###执行宣告操作引用
    ExecOrderActionRef = 0 #int
	###执行宣告引用
    ExecOrderRef = '' #str [13]
	###请求编号
    RequestID = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###执行宣告操作编号
    ExecOrderSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###用户代码
    UserID = '' #str [16]
	###合约代码
    InstrumentID = '' #str [31]


###执行宣告
class pyThostFtdcExecOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###执行宣告引用
    ExecOrderRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###数量
    Volume = 0 #int
	###请求编号
    RequestID = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###开平标志
    OffsetFlag = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###执行类型
    ActionType = None #bytes [1]
	###保留头寸申请的持仓方向
    PosiDirection = None #bytes [1]
	###期权行权后是否保留期货头寸的标记
    ReservePositionFlag = None #bytes [1]
	###期权行权后生成的头寸是否自动平仓
    CloseFlag = None #bytes [1]
	###本地执行宣告编号
    ExecOrderLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###执行宣告提交状态
    OrderSubmitStatus = None #bytes [1]
	###报单提示序号
    NotifySequence = 0 #int
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###执行宣告编号
    ExecOrderSysID = '' #str [21]
	###报单日期
    InsertDate = '' #str [9]
	###插入时间
    InsertTime = '' #str [9]
	###撤销时间
    CancelTime = '' #str [9]
	###执行结果
    ExecResult = None #bytes [1]
	###结算会员编号
    ClearingPartID = '' #str [11]
	###序号
    SequenceNo = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###状态信息
    StatusMsg = '' #str [81]
	###操作用户代码
    ActiveUserID = '' #str [16]
	###经纪公司报单编号
    BrokerExecOrderSeq = 0 #int


###执行宣告操作
class pyThostFtdcExecOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###执行宣告操作引用
    ExecOrderActionRef = 0 #int
	###执行宣告引用
    ExecOrderRef = '' #str [13]
	###请求编号
    RequestID = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###执行宣告操作编号
    ExecOrderSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###操作日期
    ActionDate = '' #str [9]
	###操作时间
    ActionTime = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###本地执行宣告编号
    ExecOrderLocalID = '' #str [13]
	###操作本地编号
    ActionLocalID = '' #str [13]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###业务单元
    BusinessUnit = '' #str [21]
	###报单操作状态
    OrderActionStatus = None #bytes [1]
	###用户代码
    UserID = '' #str [16]
	###执行类型
    ActionType = None #bytes [1]
	###状态信息
    StatusMsg = '' #str [81]
	###合约代码
    InstrumentID = '' #str [31]


###执行宣告查询
class pyThostFtdcQryExecOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###执行宣告编号
    ExecOrderSysID = '' #str [21]
	###开始时间
    InsertTimeStart = '' #str [9]
	###结束时间
    InsertTimeEnd = '' #str [9]


###交易所执行宣告信息
class pyThostFtdcExchangeExecOrderField:

	###数量
    Volume = 0 #int
	###请求编号
    RequestID = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###开平标志
    OffsetFlag = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###执行类型
    ActionType = None #bytes [1]
	###保留头寸申请的持仓方向
    PosiDirection = None #bytes [1]
	###期权行权后是否保留期货头寸的标记
    ReservePositionFlag = None #bytes [1]
	###期权行权后生成的头寸是否自动平仓
    CloseFlag = None #bytes [1]
	###本地执行宣告编号
    ExecOrderLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###执行宣告提交状态
    OrderSubmitStatus = None #bytes [1]
	###报单提示序号
    NotifySequence = 0 #int
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###执行宣告编号
    ExecOrderSysID = '' #str [21]
	###报单日期
    InsertDate = '' #str [9]
	###插入时间
    InsertTime = '' #str [9]
	###撤销时间
    CancelTime = '' #str [9]
	###执行结果
    ExecResult = None #bytes [1]
	###结算会员编号
    ClearingPartID = '' #str [11]
	###序号
    SequenceNo = 0 #int


###交易所执行宣告查询
class pyThostFtdcQryExchangeExecOrderField:

	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]


###执行宣告操作查询
class pyThostFtdcQryExecOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]


###交易所执行宣告操作
class pyThostFtdcExchangeExecOrderActionField:

	###交易所代码
    ExchangeID = '' #str [9]
	###执行宣告操作编号
    ExecOrderSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###操作日期
    ActionDate = '' #str [9]
	###操作时间
    ActionTime = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###本地执行宣告编号
    ExecOrderLocalID = '' #str [13]
	###操作本地编号
    ActionLocalID = '' #str [13]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###业务单元
    BusinessUnit = '' #str [21]
	###报单操作状态
    OrderActionStatus = None #bytes [1]
	###用户代码
    UserID = '' #str [16]
	###执行类型
    ActionType = None #bytes [1]


###交易所执行宣告操作查询
class pyThostFtdcQryExchangeExecOrderActionField:

	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]


###错误执行宣告
class pyThostFtdcErrExecOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###执行宣告引用
    ExecOrderRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###数量
    Volume = 0 #int
	###请求编号
    RequestID = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###开平标志
    OffsetFlag = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###执行类型
    ActionType = None #bytes [1]
	###保留头寸申请的持仓方向
    PosiDirection = None #bytes [1]
	###期权行权后是否保留期货头寸的标记
    ReservePositionFlag = None #bytes [1]
	###期权行权后生成的头寸是否自动平仓
    CloseFlag = None #bytes [1]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###查询错误执行宣告
class pyThostFtdcQryErrExecOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###错误执行宣告操作
class pyThostFtdcErrExecOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###执行宣告操作引用
    ExecOrderActionRef = 0 #int
	###执行宣告引用
    ExecOrderRef = '' #str [13]
	###请求编号
    RequestID = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###执行宣告操作编号
    ExecOrderSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###用户代码
    UserID = '' #str [16]
	###合约代码
    InstrumentID = '' #str [31]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###查询错误执行宣告操作
class pyThostFtdcQryErrExecOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###投资者期权合约交易权限
class pyThostFtdcOptionInstrTradingRightField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###买卖方向
    Direction = None #bytes [1]
	###交易权限
    TradingRight = None #bytes [1]


###查询期权合约交易权限
class pyThostFtdcQryOptionInstrTradingRightField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###买卖方向
    Direction = None #bytes [1]


###输入的询价
class pyThostFtdcInputForQuoteField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###询价引用
    ForQuoteRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]


###询价
class pyThostFtdcForQuoteField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###询价引用
    ForQuoteRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###本地询价编号
    ForQuoteLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###报单日期
    InsertDate = '' #str [9]
	###插入时间
    InsertTime = '' #str [9]
	###询价状态
    ForQuoteStatus = None #bytes [1]
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###状态信息
    StatusMsg = '' #str [81]
	###操作用户代码
    ActiveUserID = '' #str [16]
	###经纪公司询价编号
    BrokerForQutoSeq = 0 #int


###询价查询
class pyThostFtdcQryForQuoteField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###开始时间
    InsertTimeStart = '' #str [9]
	###结束时间
    InsertTimeEnd = '' #str [9]


###交易所询价信息
class pyThostFtdcExchangeForQuoteField:

	###本地询价编号
    ForQuoteLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###报单日期
    InsertDate = '' #str [9]
	###插入时间
    InsertTime = '' #str [9]
	###询价状态
    ForQuoteStatus = None #bytes [1]


###交易所询价查询
class pyThostFtdcQryExchangeForQuoteField:

	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]


###输入的报价
class pyThostFtdcInputQuoteField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###报价引用
    QuoteRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###卖价格
    AskPrice = 0 #double
	###买价格
    BidPrice = 0 #double
	###卖数量
    AskVolume = 0 #int
	###买数量
    BidVolume = 0 #int
	###请求编号
    RequestID = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###卖开平标志
    AskOffsetFlag = None #bytes [1]
	###买开平标志
    BidOffsetFlag = None #bytes [1]
	###卖投机套保标志
    AskHedgeFlag = None #bytes [1]
	###买投机套保标志
    BidHedgeFlag = None #bytes [1]
	###衍生卖报单引用
    AskOrderRef = '' #str [13]
	###衍生买报单引用
    BidOrderRef = '' #str [13]
	###应价编号
    ForQuoteSysID = '' #str [21]


###输入报价操作
class pyThostFtdcInputQuoteActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###报价操作引用
    QuoteActionRef = 0 #int
	###报价引用
    QuoteRef = '' #str [13]
	###请求编号
    RequestID = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###报价操作编号
    QuoteSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###用户代码
    UserID = '' #str [16]
	###合约代码
    InstrumentID = '' #str [31]


###报价
class pyThostFtdcQuoteField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###报价引用
    QuoteRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###卖价格
    AskPrice = 0 #double
	###买价格
    BidPrice = 0 #double
	###卖数量
    AskVolume = 0 #int
	###买数量
    BidVolume = 0 #int
	###请求编号
    RequestID = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###卖开平标志
    AskOffsetFlag = None #bytes [1]
	###买开平标志
    BidOffsetFlag = None #bytes [1]
	###卖投机套保标志
    AskHedgeFlag = None #bytes [1]
	###买投机套保标志
    BidHedgeFlag = None #bytes [1]
	###本地报价编号
    QuoteLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###报价提示序号
    NotifySequence = 0 #int
	###报价提交状态
    OrderSubmitStatus = None #bytes [1]
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###报价编号
    QuoteSysID = '' #str [21]
	###报单日期
    InsertDate = '' #str [9]
	###插入时间
    InsertTime = '' #str [9]
	###撤销时间
    CancelTime = '' #str [9]
	###报价状态
    QuoteStatus = None #bytes [1]
	###结算会员编号
    ClearingPartID = '' #str [11]
	###序号
    SequenceNo = 0 #int
	###卖方报单编号
    AskOrderSysID = '' #str [21]
	###买方报单编号
    BidOrderSysID = '' #str [21]
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###状态信息
    StatusMsg = '' #str [81]
	###操作用户代码
    ActiveUserID = '' #str [16]
	###经纪公司报价编号
    BrokerQuoteSeq = 0 #int
	###衍生卖报单引用
    AskOrderRef = '' #str [13]
	###衍生买报单引用
    BidOrderRef = '' #str [13]
	###应价编号
    ForQuoteSysID = '' #str [21]


###报价操作
class pyThostFtdcQuoteActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###报价操作引用
    QuoteActionRef = 0 #int
	###报价引用
    QuoteRef = '' #str [13]
	###请求编号
    RequestID = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###报价操作编号
    QuoteSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###操作日期
    ActionDate = '' #str [9]
	###操作时间
    ActionTime = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###本地报价编号
    QuoteLocalID = '' #str [13]
	###操作本地编号
    ActionLocalID = '' #str [13]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###业务单元
    BusinessUnit = '' #str [21]
	###报单操作状态
    OrderActionStatus = None #bytes [1]
	###用户代码
    UserID = '' #str [16]
	###状态信息
    StatusMsg = '' #str [81]
	###合约代码
    InstrumentID = '' #str [31]


###报价查询
class pyThostFtdcQryQuoteField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###报价编号
    QuoteSysID = '' #str [21]
	###开始时间
    InsertTimeStart = '' #str [9]
	###结束时间
    InsertTimeEnd = '' #str [9]


###交易所报价信息
class pyThostFtdcExchangeQuoteField:

	###卖价格
    AskPrice = 0 #double
	###买价格
    BidPrice = 0 #double
	###卖数量
    AskVolume = 0 #int
	###买数量
    BidVolume = 0 #int
	###请求编号
    RequestID = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###卖开平标志
    AskOffsetFlag = None #bytes [1]
	###买开平标志
    BidOffsetFlag = None #bytes [1]
	###卖投机套保标志
    AskHedgeFlag = None #bytes [1]
	###买投机套保标志
    BidHedgeFlag = None #bytes [1]
	###本地报价编号
    QuoteLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###报价提示序号
    NotifySequence = 0 #int
	###报价提交状态
    OrderSubmitStatus = None #bytes [1]
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###报价编号
    QuoteSysID = '' #str [21]
	###报单日期
    InsertDate = '' #str [9]
	###插入时间
    InsertTime = '' #str [9]
	###撤销时间
    CancelTime = '' #str [9]
	###报价状态
    QuoteStatus = None #bytes [1]
	###结算会员编号
    ClearingPartID = '' #str [11]
	###序号
    SequenceNo = 0 #int
	###卖方报单编号
    AskOrderSysID = '' #str [21]
	###买方报单编号
    BidOrderSysID = '' #str [21]
	###应价编号
    ForQuoteSysID = '' #str [21]


###交易所报价查询
class pyThostFtdcQryExchangeQuoteField:

	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]


###报价操作查询
class pyThostFtdcQryQuoteActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]


###交易所报价操作
class pyThostFtdcExchangeQuoteActionField:

	###交易所代码
    ExchangeID = '' #str [9]
	###报价操作编号
    QuoteSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###操作日期
    ActionDate = '' #str [9]
	###操作时间
    ActionTime = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###本地报价编号
    QuoteLocalID = '' #str [13]
	###操作本地编号
    ActionLocalID = '' #str [13]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###业务单元
    BusinessUnit = '' #str [21]
	###报单操作状态
    OrderActionStatus = None #bytes [1]
	###用户代码
    UserID = '' #str [16]


###交易所报价操作查询
class pyThostFtdcQryExchangeQuoteActionField:

	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]


###期权合约delta值
class pyThostFtdcOptionInstrDeltaField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###Delta值
    Delta = 0 #double


###发给做市商的询价请求
class pyThostFtdcForQuoteRspField:

	###交易日
    TradingDay = '' #str [9]
	###合约代码
    InstrumentID = '' #str [31]
	###询价编号
    ForQuoteSysID = '' #str [21]
	###询价时间
    ForQuoteTime = '' #str [9]
	###业务日期
    ActionDay = '' #str [9]
	###交易所代码
    ExchangeID = '' #str [9]


###当前期权合约执行偏移值的详细内容
class pyThostFtdcStrikeOffsetField:

	###合约代码
    InstrumentID = '' #str [31]
	###投资者范围
    InvestorRange = None #bytes [1]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###执行偏移值
    Offset = 0 #double


###期权执行偏移值查询
class pyThostFtdcQryStrikeOffsetField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]


###组合合约安全系数
class pyThostFtdcCombInstrumentGuardField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###合约代码
    InstrumentID = '' #str [31]
	###
    GuarantRatio = 0 #double


###组合合约安全系数查询
class pyThostFtdcQryCombInstrumentGuardField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###合约代码
    InstrumentID = '' #str [31]


###输入的申请组合
class pyThostFtdcInputCombActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###组合引用
    CombActionRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###买卖方向
    Direction = None #bytes [1]
	###数量
    Volume = 0 #int
	###组合指令方向
    CombDirection = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]


###申请组合
class pyThostFtdcCombActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###组合引用
    CombActionRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###买卖方向
    Direction = None #bytes [1]
	###数量
    Volume = 0 #int
	###组合指令方向
    CombDirection = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###本地申请组合编号
    ActionLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###组合状态
    ActionStatus = None #bytes [1]
	###报单提示序号
    NotifySequence = 0 #int
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###序号
    SequenceNo = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###状态信息
    StatusMsg = '' #str [81]


###申请组合查询
class pyThostFtdcQryCombActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]


###交易所申请组合信息
class pyThostFtdcExchangeCombActionField:

	###买卖方向
    Direction = None #bytes [1]
	###数量
    Volume = 0 #int
	###组合指令方向
    CombDirection = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###本地申请组合编号
    ActionLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###组合状态
    ActionStatus = None #bytes [1]
	###报单提示序号
    NotifySequence = 0 #int
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###序号
    SequenceNo = 0 #int


###交易所申请组合查询
class pyThostFtdcQryExchangeCombActionField:

	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]


###产品报价汇率
class pyThostFtdcProductExchRateField:

	###产品代码
    ProductID = '' #str [31]
	###报价币种类型
    QuoteCurrencyID = '' #str [4]
	###汇率
    ExchangeRate = 0 #double


###产品报价汇率查询
class pyThostFtdcQryProductExchRateField:

	###产品代码
    ProductID = '' #str [31]


###市场行情
class pyThostFtdcMarketDataField:

	###交易日
    TradingDay = '' #str [9]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###最新价
    LastPrice = 0 #double
	###上次结算价
    PreSettlementPrice = 0 #double
	###昨收盘
    PreClosePrice = 0 #double
	###昨持仓量
    PreOpenInterest = 0 #double
	###今开盘
    OpenPrice = 0 #double
	###最高价
    HighestPrice = 0 #double
	###最低价
    LowestPrice = 0 #double
	###数量
    Volume = 0 #int
	###成交金额
    Turnover = 0 #double
	###持仓量
    OpenInterest = 0 #double
	###今收盘
    ClosePrice = 0 #double
	###本次结算价
    SettlementPrice = 0 #double
	###涨停板价
    UpperLimitPrice = 0 #double
	###跌停板价
    LowerLimitPrice = 0 #double
	###昨虚实度
    PreDelta = 0 #double
	###今虚实度
    CurrDelta = 0 #double
	###最后修改时间
    UpdateTime = '' #str [9]
	###最后修改毫秒
    UpdateMillisec = 0 #int
	###业务日期
    ActionDay = '' #str [9]


###行情基础属性
class pyThostFtdcMarketDataBaseField:

	###交易日
    TradingDay = '' #str [9]
	###上次结算价
    PreSettlementPrice = 0 #double
	###昨收盘
    PreClosePrice = 0 #double
	###昨持仓量
    PreOpenInterest = 0 #double
	###昨虚实度
    PreDelta = 0 #double


###行情静态属性
class pyThostFtdcMarketDataStaticField:

	###今开盘
    OpenPrice = 0 #double
	###最高价
    HighestPrice = 0 #double
	###最低价
    LowestPrice = 0 #double
	###今收盘
    ClosePrice = 0 #double
	###涨停板价
    UpperLimitPrice = 0 #double
	###跌停板价
    LowerLimitPrice = 0 #double
	###本次结算价
    SettlementPrice = 0 #double
	###今虚实度
    CurrDelta = 0 #double


###行情最新成交属性
class pyThostFtdcMarketDataLastMatchField:

	###最新价
    LastPrice = 0 #double
	###数量
    Volume = 0 #int
	###成交金额
    Turnover = 0 #double
	###持仓量
    OpenInterest = 0 #double


###行情最优价属性
class pyThostFtdcMarketDataBestPriceField:

	###申买价一
    BidPrice1 = 0 #double
	###申买量一
    BidVolume1 = 0 #int
	###申卖价一
    AskPrice1 = 0 #double
	###申卖量一
    AskVolume1 = 0 #int


###行情申买二、三属性
class pyThostFtdcMarketDataBid23Field:

	###申买价二
    BidPrice2 = 0 #double
	###申买量二
    BidVolume2 = 0 #int
	###申买价三
    BidPrice3 = 0 #double
	###申买量三
    BidVolume3 = 0 #int


###行情申卖二、三属性
class pyThostFtdcMarketDataAsk23Field:

	###申卖价二
    AskPrice2 = 0 #double
	###申卖量二
    AskVolume2 = 0 #int
	###申卖价三
    AskPrice3 = 0 #double
	###申卖量三
    AskVolume3 = 0 #int


###行情申买四、五属性
class pyThostFtdcMarketDataBid45Field:

	###申买价四
    BidPrice4 = 0 #double
	###申买量四
    BidVolume4 = 0 #int
	###申买价五
    BidPrice5 = 0 #double
	###申买量五
    BidVolume5 = 0 #int


###行情申卖四、五属性
class pyThostFtdcMarketDataAsk45Field:

	###申卖价四
    AskPrice4 = 0 #double
	###申卖量四
    AskVolume4 = 0 #int
	###申卖价五
    AskPrice5 = 0 #double
	###申卖量五
    AskVolume5 = 0 #int


###行情更新时间属性
class pyThostFtdcMarketDataUpdateTimeField:

	###合约代码
    InstrumentID = '' #str [31]
	###最后修改时间
    UpdateTime = '' #str [9]
	###最后修改毫秒
    UpdateMillisec = 0 #int
	###业务日期
    ActionDay = '' #str [9]


###行情交易所代码属性
class pyThostFtdcMarketDataExchangeField:

	###交易所代码
    ExchangeID = '' #str [9]


###指定的合约
class pyThostFtdcSpecificInstrumentField:

	###合约代码
    InstrumentID = '' #str [31]


###合约状态
class pyThostFtdcInstrumentStatusField:

	###交易所代码
    ExchangeID = '' #str [9]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###结算组代码
    SettlementGroupID = '' #str [9]
	###合约代码
    InstrumentID = '' #str [31]
	###合约交易状态
    InstrumentStatus = None #bytes [1]
	###交易阶段编号
    TradingSegmentSN = 0 #int
	###进入本状态时间
    EnterTime = '' #str [9]
	###进入本状态原因
    EnterReason = None #bytes [1]


###查询合约状态
class pyThostFtdcQryInstrumentStatusField:

	###交易所代码
    ExchangeID = '' #str [9]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]


###投资者账户
class pyThostFtdcInvestorAccountField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###投资者帐号
    AccountID = '' #str [13]
	###币种代码
    CurrencyID = '' #str [4]


###浮动盈亏算法
class pyThostFtdcPositionProfitAlgorithmField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###盈亏算法
    Algorithm = None #bytes [1]
	###备注
    Memo = '' #str [161]
	###币种代码
    CurrencyID = '' #str [4]


###会员资金折扣
class pyThostFtdcDiscountField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者范围
    InvestorRange = None #bytes [1]
	###投资者代码
    InvestorID = '' #str [13]
	###资金折扣比例
    Discount = 0 #double


###查询转帐银行
class pyThostFtdcQryTransferBankField:

	###银行代码
    BankID = '' #str [4]
	###银行分中心代码
    BankBrchID = '' #str [5]


###转帐银行
class pyThostFtdcTransferBankField:

	###银行代码
    BankID = '' #str [4]
	###银行分中心代码
    BankBrchID = '' #str [5]
	###银行名称
    BankName = '' #str [101]
	###是否活跃
    IsActive = 0 #int


###查询投资者持仓明细
class pyThostFtdcQryInvestorPositionDetailField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]


###投资者持仓明细
class pyThostFtdcInvestorPositionDetailField:

	###合约代码
    InstrumentID = '' #str [31]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###买卖
    Direction = None #bytes [1]
	###开仓日期
    OpenDate = '' #str [9]
	###成交编号
    TradeID = '' #str [21]
	###数量
    Volume = 0 #int
	###开仓价
    OpenPrice = 0 #double
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###成交类型
    TradeType = None #bytes [1]
	###组合合约代码
    CombInstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]
	###逐日盯市平仓盈亏
    CloseProfitByDate = 0 #double
	###逐笔对冲平仓盈亏
    CloseProfitByTrade = 0 #double
	###逐日盯市持仓盈亏
    PositionProfitByDate = 0 #double
	###逐笔对冲持仓盈亏
    PositionProfitByTrade = 0 #double
	###投资者保证金
    Margin = 0 #double
	###交易所保证金
    ExchMargin = 0 #double
	###保证金率
    MarginRateByMoney = 0 #double
	###保证金率(按手数)
    MarginRateByVolume = 0 #double
	###昨结算价
    LastSettlementPrice = 0 #double
	###结算价
    SettlementPrice = 0 #double
	###平仓量
    CloseVolume = 0 #int
	###平仓金额
    CloseAmount = 0 #double


###资金账户口令域
class pyThostFtdcTradingAccountPasswordField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###密码
    Password = '' #str [41]
	###币种代码
    CurrencyID = '' #str [4]


###交易所行情报盘机
class pyThostFtdcMDTraderOfferField:

	###交易所代码
    ExchangeID = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###会员代码
    ParticipantID = '' #str [11]
	###密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###交易所交易员连接状态
    TraderConnectStatus = None #bytes [1]
	###发出连接请求的日期
    ConnectRequestDate = '' #str [9]
	###发出连接请求的时间
    ConnectRequestTime = '' #str [9]
	###上次报告日期
    LastReportDate = '' #str [9]
	###上次报告时间
    LastReportTime = '' #str [9]
	###完成连接日期
    ConnectDate = '' #str [9]
	###完成连接时间
    ConnectTime = '' #str [9]
	###启动日期
    StartDate = '' #str [9]
	###启动时间
    StartTime = '' #str [9]
	###交易日
    TradingDay = '' #str [9]
	###经纪公司代码
    BrokerID = '' #str [11]
	###本席位最大成交编号
    MaxTradeID = '' #str [21]
	###本席位最大报单备拷
    MaxOrderMessageReference = '' #str [7]


###查询行情报盘机
class pyThostFtdcQryMDTraderOfferField:

	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###交易所交易员代码
    TraderID = '' #str [21]


###查询客户通知
class pyThostFtdcQryNoticeField:

	###经纪公司代码
    BrokerID = '' #str [11]


###客户通知
class pyThostFtdcNoticeField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###消息正文
    Content = '' #str [501]
	###经纪公司通知内容序列号
    SequenceLabel = '' #str [2]


###用户权限
class pyThostFtdcUserRightField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###客户权限类型
    UserRightType = None #bytes [1]
	###是否禁止
    IsForbidden = 0 #int


###查询结算信息确认域
class pyThostFtdcQrySettlementInfoConfirmField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###装载结算信息
class pyThostFtdcLoadSettlementInfoField:

	###经纪公司代码
    BrokerID = '' #str [11]


###经纪公司可提资金算法表
class pyThostFtdcBrokerWithdrawAlgorithmField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###可提资金算法
    WithdrawAlgorithm = None #bytes [1]
	###资金使用率
    UsingRatio = 0 #double
	###可提是否包含平仓盈利
    IncludeCloseProfit = None #bytes [1]
	###本日无仓且无成交客户是否受可提比例限制
    AllWithoutTrade = None #bytes [1]
	###可用是否包含平仓盈利
    AvailIncludeCloseProfit = None #bytes [1]
	###是否启用用户事件
    IsBrokerUserEvent = 0 #int
	###币种代码
    CurrencyID = '' #str [4]
	###货币质押比率
    FundMortgageRatio = 0 #double
	###权益算法
    BalanceAlgorithm = None #bytes [1]


###资金账户口令变更域
class pyThostFtdcTradingAccountPasswordUpdateV1Field:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###原来的口令
    OldPassword = '' #str [41]
	###新的口令
    NewPassword = '' #str [41]


###资金账户口令变更域
class pyThostFtdcTradingAccountPasswordUpdateField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###原来的口令
    OldPassword = '' #str [41]
	###新的口令
    NewPassword = '' #str [41]
	###币种代码
    CurrencyID = '' #str [4]


###查询组合合约分腿
class pyThostFtdcQryCombinationLegField:

	###组合合约代码
    CombInstrumentID = '' #str [31]
	###单腿编号
    LegID = 0 #int
	###单腿合约代码
    LegInstrumentID = '' #str [31]


###查询组合合约分腿
class pyThostFtdcQrySyncStatusField:

	###交易日
    TradingDay = '' #str [9]


###组合交易合约的单腿
class pyThostFtdcCombinationLegField:

	###组合合约代码
    CombInstrumentID = '' #str [31]
	###单腿编号
    LegID = 0 #int
	###单腿合约代码
    LegInstrumentID = '' #str [31]
	###买卖方向
    Direction = None #bytes [1]
	###单腿乘数
    LegMultiple = 0 #int
	###派生层数
    ImplyLevel = 0 #int


###数据同步状态
class pyThostFtdcSyncStatusField:

	###交易日
    TradingDay = '' #str [9]
	###数据同步状态
    DataSyncStatus = None #bytes [1]


###查询联系人
class pyThostFtdcQryLinkManField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###联系人
class pyThostFtdcLinkManField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###联系人类型
    PersonType = None #bytes [1]
	###证件类型
    IdentifiedCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###名称
    PersonName = '' #str [81]
	###联系电话
    Telephone = '' #str [41]
	###通讯地址
    Address = '' #str [101]
	###邮政编码
    ZipCode = '' #str [7]
	###优先级
    Priority = 0 #int
	###开户邮政编码
    UOAZipCode = '' #str [11]
	###全称
    PersonFullName = '' #str [101]


###查询经纪公司用户事件
class pyThostFtdcQryBrokerUserEventField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###用户事件类型
    UserEventType = None #bytes [1]


###查询经纪公司用户事件
class pyThostFtdcBrokerUserEventField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###用户事件类型
    UserEventType = None #bytes [1]
	###用户事件序号
    EventSequenceNo = 0 #int
	###事件发生日期
    EventDate = '' #str [9]
	###事件发生时间
    EventTime = '' #str [9]
	###用户事件信息
    UserEventInfo = '' #str [1025]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]


###查询签约银行请求
class pyThostFtdcQryContractBankField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###银行代码
    BankID = '' #str [4]
	###银行分中心代码
    BankBrchID = '' #str [5]


###查询签约银行响应
class pyThostFtdcContractBankField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###银行代码
    BankID = '' #str [4]
	###银行分中心代码
    BankBrchID = '' #str [5]
	###银行名称
    BankName = '' #str [101]


###投资者组合持仓明细
class pyThostFtdcInvestorPositionCombineDetailField:

	###交易日
    TradingDay = '' #str [9]
	###开仓日期
    OpenDate = '' #str [9]
	###交易所代码
    ExchangeID = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###组合编号
    ComTradeID = '' #str [21]
	###撮合编号
    TradeID = '' #str [21]
	###合约代码
    InstrumentID = '' #str [31]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###买卖
    Direction = None #bytes [1]
	###持仓量
    TotalAmt = 0 #int
	###投资者保证金
    Margin = 0 #double
	###交易所保证金
    ExchMargin = 0 #double
	###保证金率
    MarginRateByMoney = 0 #double
	###保证金率(按手数)
    MarginRateByVolume = 0 #double
	###单腿编号
    LegID = 0 #int
	###单腿乘数
    LegMultiple = 0 #int
	###组合持仓合约编码
    CombInstrumentID = '' #str [31]
	###成交组号
    TradeGroupID = 0 #int


###预埋单
class pyThostFtdcParkedOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###报单引用
    OrderRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###报单价格条件
    OrderPriceType = None #bytes [1]
	###买卖方向
    Direction = None #bytes [1]
	###组合开平标志
    CombOffsetFlag = '' #str [5]
	###组合投机套保标志
    CombHedgeFlag = '' #str [5]
	###价格
    LimitPrice = 0 #double
	###数量
    VolumeTotalOriginal = 0 #int
	###有效期类型
    TimeCondition = None #bytes [1]
	###GTD日期
    GTDDate = '' #str [9]
	###成交量类型
    VolumeCondition = None #bytes [1]
	###最小成交量
    MinVolume = 0 #int
	###触发条件
    ContingentCondition = None #bytes [1]
	###止损价
    StopPrice = 0 #double
	###强平原因
    ForceCloseReason = None #bytes [1]
	###自动挂起标志
    IsAutoSuspend = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###请求编号
    RequestID = 0 #int
	###用户强评标志
    UserForceClose = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###预埋报单编号
    ParkedOrderID = '' #str [13]
	###用户类型
    UserType = None #bytes [1]
	###预埋单状态
    Status = None #bytes [1]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]
	###互换单标志
    IsSwapOrder = 0 #int


###输入预埋单操作
class pyThostFtdcParkedOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###报单操作引用
    OrderActionRef = 0 #int
	###报单引用
    OrderRef = '' #str [13]
	###请求编号
    RequestID = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###报单编号
    OrderSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###价格
    LimitPrice = 0 #double
	###数量变化
    VolumeChange = 0 #int
	###用户代码
    UserID = '' #str [16]
	###合约代码
    InstrumentID = '' #str [31]
	###预埋撤单单编号
    ParkedOrderActionID = '' #str [13]
	###用户类型
    UserType = None #bytes [1]
	###预埋撤单状态
    Status = None #bytes [1]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###查询预埋单
class pyThostFtdcQryParkedOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]


###查询预埋撤单
class pyThostFtdcQryParkedOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###交易所代码
    ExchangeID = '' #str [9]


###删除预埋单
class pyThostFtdcRemoveParkedOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###预埋报单编号
    ParkedOrderID = '' #str [13]


###删除预埋撤单
class pyThostFtdcRemoveParkedOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###预埋撤单编号
    ParkedOrderActionID = '' #str [13]


###经纪公司可提资金算法表
class pyThostFtdcInvestorWithdrawAlgorithmField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者范围
    InvestorRange = None #bytes [1]
	###投资者代码
    InvestorID = '' #str [13]
	###可提资金比例
    UsingRatio = 0 #double
	###币种代码
    CurrencyID = '' #str [4]
	###货币质押比率
    FundMortgageRatio = 0 #double


###查询组合持仓明细
class pyThostFtdcQryInvestorPositionCombineDetailField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###组合持仓合约编码
    CombInstrumentID = '' #str [31]


###成交均价
class pyThostFtdcMarketDataAveragePriceField:

	###当日均价
    AveragePrice = 0 #double


###校验投资者密码
class pyThostFtdcVerifyInvestorPasswordField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###密码
    Password = '' #str [41]


###用户IP
class pyThostFtdcUserIPField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###IP地址
    IPAddress = '' #str [16]
	###IP地址掩码
    IPMask = '' #str [16]
	###Mac地址
    MacAddress = '' #str [21]


###用户事件通知信息
class pyThostFtdcTradingNoticeInfoField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###发送时间
    SendTime = '' #str [9]
	###消息正文
    FieldContent = '' #str [501]
	###序列系列号
    SequenceSeries = 0 #short
	###序列号
    SequenceNo = 0 #int


###用户事件通知
class pyThostFtdcTradingNoticeField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者范围
    InvestorRange = None #bytes [1]
	###投资者代码
    InvestorID = '' #str [13]
	###序列系列号
    SequenceSeries = 0 #short
	###用户代码
    UserID = '' #str [16]
	###发送时间
    SendTime = '' #str [9]
	###序列号
    SequenceNo = 0 #int
	###消息正文
    FieldContent = '' #str [501]


###查询交易事件通知
class pyThostFtdcQryTradingNoticeField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###查询错误报单
class pyThostFtdcQryErrOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###错误报单
class pyThostFtdcErrOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###报单引用
    OrderRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###报单价格条件
    OrderPriceType = None #bytes [1]
	###买卖方向
    Direction = None #bytes [1]
	###组合开平标志
    CombOffsetFlag = '' #str [5]
	###组合投机套保标志
    CombHedgeFlag = '' #str [5]
	###价格
    LimitPrice = 0 #double
	###数量
    VolumeTotalOriginal = 0 #int
	###有效期类型
    TimeCondition = None #bytes [1]
	###GTD日期
    GTDDate = '' #str [9]
	###成交量类型
    VolumeCondition = None #bytes [1]
	###最小成交量
    MinVolume = 0 #int
	###触发条件
    ContingentCondition = None #bytes [1]
	###止损价
    StopPrice = 0 #double
	###强平原因
    ForceCloseReason = None #bytes [1]
	###自动挂起标志
    IsAutoSuspend = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###请求编号
    RequestID = 0 #int
	###用户强评标志
    UserForceClose = 0 #int
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]
	###互换单标志
    IsSwapOrder = 0 #int


###查询错误报单操作
class pyThostFtdcErrorConditionalOrderField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###报单引用
    OrderRef = '' #str [13]
	###用户代码
    UserID = '' #str [16]
	###报单价格条件
    OrderPriceType = None #bytes [1]
	###买卖方向
    Direction = None #bytes [1]
	###组合开平标志
    CombOffsetFlag = '' #str [5]
	###组合投机套保标志
    CombHedgeFlag = '' #str [5]
	###价格
    LimitPrice = 0 #double
	###数量
    VolumeTotalOriginal = 0 #int
	###有效期类型
    TimeCondition = None #bytes [1]
	###GTD日期
    GTDDate = '' #str [9]
	###成交量类型
    VolumeCondition = None #bytes [1]
	###最小成交量
    MinVolume = 0 #int
	###触发条件
    ContingentCondition = None #bytes [1]
	###止损价
    StopPrice = 0 #double
	###强平原因
    ForceCloseReason = None #bytes [1]
	###自动挂起标志
    IsAutoSuspend = 0 #int
	###业务单元
    BusinessUnit = '' #str [21]
	###请求编号
    RequestID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###合约在交易所的代码
    ExchangeInstID = '' #str [31]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###报单提交状态
    OrderSubmitStatus = None #bytes [1]
	###报单提示序号
    NotifySequence = 0 #int
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###报单编号
    OrderSysID = '' #str [21]
	###报单来源
    OrderSource = None #bytes [1]
	###报单状态
    OrderStatus = None #bytes [1]
	###报单类型
    OrderType = None #bytes [1]
	###今成交数量
    VolumeTraded = 0 #int
	###剩余数量
    VolumeTotal = 0 #int
	###报单日期
    InsertDate = '' #str [9]
	###委托时间
    InsertTime = '' #str [9]
	###激活时间
    ActiveTime = '' #str [9]
	###挂起时间
    SuspendTime = '' #str [9]
	###最后修改时间
    UpdateTime = '' #str [9]
	###撤销时间
    CancelTime = '' #str [9]
	###最后修改交易所交易员代码
    ActiveTraderID = '' #str [21]
	###结算会员编号
    ClearingPartID = '' #str [11]
	###序号
    SequenceNo = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###用户端产品信息
    UserProductInfo = '' #str [11]
	###状态信息
    StatusMsg = '' #str [81]
	###用户强评标志
    UserForceClose = 0 #int
	###操作用户代码
    ActiveUserID = '' #str [16]
	###经纪公司报单编号
    BrokerOrderSeq = 0 #int
	###相关报单
    RelativeOrderSysID = '' #str [21]
	###郑商所成交数量
    ZCETotalTradedVolume = 0 #int
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]
	###互换单标志
    IsSwapOrder = 0 #int


###查询错误报单操作
class pyThostFtdcQryErrOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###错误报单操作
class pyThostFtdcErrOrderActionField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###报单操作引用
    OrderActionRef = 0 #int
	###报单引用
    OrderRef = '' #str [13]
	###请求编号
    RequestID = 0 #int
	###前置编号
    FrontID = 0 #int
	###会话编号
    SessionID = 0 #int
	###交易所代码
    ExchangeID = '' #str [9]
	###报单编号
    OrderSysID = '' #str [21]
	###操作标志
    ActionFlag = None #bytes [1]
	###价格
    LimitPrice = 0 #double
	###数量变化
    VolumeChange = 0 #int
	###操作日期
    ActionDate = '' #str [9]
	###操作时间
    ActionTime = '' #str [9]
	###交易所交易员代码
    TraderID = '' #str [21]
	###安装编号
    InstallID = 0 #int
	###本地报单编号
    OrderLocalID = '' #str [13]
	###操作本地编号
    ActionLocalID = '' #str [13]
	###会员代码
    ParticipantID = '' #str [11]
	###客户代码
    ClientID = '' #str [11]
	###业务单元
    BusinessUnit = '' #str [21]
	###报单操作状态
    OrderActionStatus = None #bytes [1]
	###用户代码
    UserID = '' #str [16]
	###状态信息
    StatusMsg = '' #str [81]
	###合约代码
    InstrumentID = '' #str [31]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###查询交易所状态
class pyThostFtdcQryExchangeSequenceField:

	###交易所代码
    ExchangeID = '' #str [9]


###交易所状态
class pyThostFtdcExchangeSequenceField:

	###交易所代码
    ExchangeID = '' #str [9]
	###序号
    SequenceNo = 0 #int
	###合约交易状态
    MarketStatus = None #bytes [1]


###根据价格查询最大报单数量
class pyThostFtdcQueryMaxOrderVolumeWithPriceField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###合约代码
    InstrumentID = '' #str [31]
	###买卖方向
    Direction = None #bytes [1]
	###开平标志
    OffsetFlag = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###最大允许报单数量
    MaxVolume = 0 #int
	###报单价格
    Price = 0 #double


###查询经纪公司交易参数
class pyThostFtdcQryBrokerTradingParamsField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###币种代码
    CurrencyID = '' #str [4]


###经纪公司交易参数
class pyThostFtdcBrokerTradingParamsField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###保证金价格类型
    MarginPriceType = None #bytes [1]
	###盈亏算法
    Algorithm = None #bytes [1]
	###可用是否包含平仓盈利
    AvailIncludeCloseProfit = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###期权权利金价格类型
    OptionRoyaltyPriceType = None #bytes [1]


###查询经纪公司交易算法
class pyThostFtdcQryBrokerTradingAlgosField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]
	###合约代码
    InstrumentID = '' #str [31]


###经纪公司交易算法
class pyThostFtdcBrokerTradingAlgosField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]
	###合约代码
    InstrumentID = '' #str [31]
	###持仓处理算法编号
    HandlePositionAlgoID = None #bytes [1]
	###寻找保证金率算法编号
    FindMarginRateAlgoID = None #bytes [1]
	###资金处理算法编号
    HandleTradingAccountAlgoID = None #bytes [1]


###查询经纪公司资金
class pyThostFtdcQueryBrokerDepositField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]


###经纪公司资金
class pyThostFtdcBrokerDepositField:

	###交易日期
    TradingDay = '' #str [9]
	###经纪公司代码
    BrokerID = '' #str [11]
	###会员代码
    ParticipantID = '' #str [11]
	###交易所代码
    ExchangeID = '' #str [9]
	###上次结算准备金
    PreBalance = 0 #double
	###当前保证金总额
    CurrMargin = 0 #double
	###平仓盈亏
    CloseProfit = 0 #double
	###期货结算准备金
    Balance = 0 #double
	###入金金额
    Deposit = 0 #double
	###出金金额
    Withdraw = 0 #double
	###可提资金
    Available = 0 #double
	###基本准备金
    Reserve = 0 #double
	###冻结的保证金
    FrozenMargin = 0 #double


###查询保证金监管系统经纪公司密钥
class pyThostFtdcQryCFMMCBrokerKeyField:

	###经纪公司代码
    BrokerID = '' #str [11]


###保证金监管系统经纪公司密钥
class pyThostFtdcCFMMCBrokerKeyField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###经纪公司统一编码
    ParticipantID = '' #str [11]
	###密钥生成日期
    CreateDate = '' #str [9]
	###密钥生成时间
    CreateTime = '' #str [9]
	###密钥编号
    KeyID = 0 #int
	###动态密钥
    CurrentKey = '' #str [21]
	###动态密钥类型
    KeyKind = None #bytes [1]


###保证金监管系统经纪公司资金账户密钥
class pyThostFtdcCFMMCTradingAccountKeyField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###经纪公司统一编码
    ParticipantID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###密钥编号
    KeyID = 0 #int
	###动态密钥
    CurrentKey = '' #str [21]


###请求查询保证金监管系统经纪公司资金账户密钥
class pyThostFtdcQryCFMMCTradingAccountKeyField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###用户动态令牌参数
class pyThostFtdcBrokerUserOTPParamField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###动态令牌提供商
    OTPVendorsID = '' #str [2]
	###动态令牌序列号
    SerialNumber = '' #str [17]
	###令牌密钥
    AuthKey = '' #str [41]
	###漂移值
    LastDrift = 0 #int
	###成功值
    LastSuccess = 0 #int
	###动态令牌类型
    OTPType = None #bytes [1]


###手工同步用户动态令牌
class pyThostFtdcManualSyncBrokerUserOTPField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###动态令牌类型
    OTPType = None #bytes [1]
	###第一个动态密码
    FirstOTP = '' #str [41]
	###第二个动态密码
    SecondOTP = '' #str [41]


###投资者手续费率模板
class pyThostFtdcCommRateModelField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###手续费率模板代码
    CommModelID = '' #str [13]
	###模板名称
    CommModelName = '' #str [161]


###请求查询投资者手续费率模板
class pyThostFtdcQryCommRateModelField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###手续费率模板代码
    CommModelID = '' #str [13]


###投资者保证金率模板
class pyThostFtdcMarginModelField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###保证金率模板代码
    MarginModelID = '' #str [13]
	###模板名称
    MarginModelName = '' #str [161]


###请求查询投资者保证金率模板
class pyThostFtdcQryMarginModelField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###保证金率模板代码
    MarginModelID = '' #str [13]


###仓单折抵信息
class pyThostFtdcEWarrantOffsetField:

	###交易日期
    TradingDay = '' #str [9]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###合约代码
    InstrumentID = '' #str [31]
	###买卖方向
    Direction = None #bytes [1]
	###投机套保标志
    HedgeFlag = None #bytes [1]
	###数量
    Volume = 0 #int


###查询仓单折抵信息
class pyThostFtdcQryEWarrantOffsetField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易所代码
    ExchangeID = '' #str [9]
	###合约代码
    InstrumentID = '' #str [31]


###查询投资者品种#跨品种保证金
class pyThostFtdcQryInvestorProductGroupMarginField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###品种#跨品种标示
    ProductGroupID = '' #str [31]
	###投机套保标志
    HedgeFlag = None #bytes [1]


###投资者品种#跨品种保证金
class pyThostFtdcInvestorProductGroupMarginField:

	###品种#跨品种标示
    ProductGroupID = '' #str [31]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###交易日
    TradingDay = '' #str [9]
	###结算编号
    SettlementID = 0 #int
	###冻结的保证金
    FrozenMargin = 0 #double
	###多头冻结的保证金
    LongFrozenMargin = 0 #double
	###空头冻结的保证金
    ShortFrozenMargin = 0 #double
	###占用的保证金
    UseMargin = 0 #double
	###多头保证金
    LongUseMargin = 0 #double
	###空头保证金
    ShortUseMargin = 0 #double
	###交易所保证金
    ExchMargin = 0 #double
	###交易所多头保证金
    LongExchMargin = 0 #double
	###交易所空头保证金
    ShortExchMargin = 0 #double
	###平仓盈亏
    CloseProfit = 0 #double
	###冻结的手续费
    FrozenCommission = 0 #double
	###手续费
    Commission = 0 #double
	###冻结的资金
    FrozenCash = 0 #double
	###资金差额
    CashIn = 0 #double
	###持仓盈亏
    PositionProfit = 0 #double
	###折抵总金额
    OffsetAmount = 0 #double
	###多头折抵总金额
    LongOffsetAmount = 0 #double
	###空头折抵总金额
    ShortOffsetAmount = 0 #double
	###交易所折抵总金额
    ExchOffsetAmount = 0 #double
	###交易所多头折抵总金额
    LongExchOffsetAmount = 0 #double
	###交易所空头折抵总金额
    ShortExchOffsetAmount = 0 #double
	###投机套保标志
    HedgeFlag = None #bytes [1]


###查询监控中心用户令牌
class pyThostFtdcQueryCFMMCTradingAccountTokenField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]


###监控中心用户令牌
class pyThostFtdcCFMMCTradingAccountTokenField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###经纪公司统一编码
    ParticipantID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###密钥编号
    KeyID = 0 #int
	###动态令牌
    Token = '' #str [21]


###转帐开户请求
class pyThostFtdcReqOpenAccountField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###性别
    Gender = None #bytes [1]
	###国家代码
    CountryCode = '' #str [21]
	###客户类型
    CustType = None #bytes [1]
	###地址
    Address = '' #str [101]
	###邮编
    ZipCode = '' #str [7]
	###电话号码
    Telephone = '' #str [41]
	###手机
    MobilePhone = '' #str [21]
	###传真
    Fax = '' #str [41]
	###电子邮件
    EMail = '' #str [41]
	###资金账户状态
    MoneyAccountStatus = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###汇钞标志
    CashExchangeCode = None #bytes [1]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###交易ID
    TID = 0 #int
	###用户标识
    UserID = '' #str [16]


###转帐销户请求
class pyThostFtdcReqCancelAccountField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###性别
    Gender = None #bytes [1]
	###国家代码
    CountryCode = '' #str [21]
	###客户类型
    CustType = None #bytes [1]
	###地址
    Address = '' #str [101]
	###邮编
    ZipCode = '' #str [7]
	###电话号码
    Telephone = '' #str [41]
	###手机
    MobilePhone = '' #str [21]
	###传真
    Fax = '' #str [41]
	###电子邮件
    EMail = '' #str [41]
	###资金账户状态
    MoneyAccountStatus = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###汇钞标志
    CashExchangeCode = None #bytes [1]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###交易ID
    TID = 0 #int
	###用户标识
    UserID = '' #str [16]


###变更银行账户请求
class pyThostFtdcReqChangeAccountField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###性别
    Gender = None #bytes [1]
	###国家代码
    CountryCode = '' #str [21]
	###客户类型
    CustType = None #bytes [1]
	###地址
    Address = '' #str [101]
	###邮编
    ZipCode = '' #str [7]
	###电话号码
    Telephone = '' #str [41]
	###手机
    MobilePhone = '' #str [21]
	###传真
    Fax = '' #str [41]
	###电子邮件
    EMail = '' #str [41]
	###资金账户状态
    MoneyAccountStatus = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###新银行帐号
    NewBankAccount = '' #str [41]
	###新银行密码
    NewBankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###安装编号
    InstallID = 0 #int
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易ID
    TID = 0 #int
	###摘要
    Digest = '' #str [36]


###转账请求
class pyThostFtdcReqTransferField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###期货公司流水号
    FutureSerial = 0 #int
	###用户标识
    UserID = '' #str [16]
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###转帐金额
    TradeAmount = 0 #double
	###期货可取金额
    FutureFetchAmount = 0 #double
	###费用支付标志
    FeePayFlag = None #bytes [1]
	###应收客户费用
    CustFee = 0 #double
	###应收期货公司费用
    BrokerFee = 0 #double
	###发送方给接收方的消息
    Message = '' #str [129]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###转账交易状态
    TransferStatus = None #bytes [1]


###银行发起银行资金转期货响应
class pyThostFtdcRspTransferField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###期货公司流水号
    FutureSerial = 0 #int
	###用户标识
    UserID = '' #str [16]
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###转帐金额
    TradeAmount = 0 #double
	###期货可取金额
    FutureFetchAmount = 0 #double
	###费用支付标志
    FeePayFlag = None #bytes [1]
	###应收客户费用
    CustFee = 0 #double
	###应收期货公司费用
    BrokerFee = 0 #double
	###发送方给接收方的消息
    Message = '' #str [129]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###转账交易状态
    TransferStatus = None #bytes [1]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###冲正请求
class pyThostFtdcReqRepealField:

	###冲正时间间隔
    RepealTimeInterval = 0 #int
	###已经冲正次数
    RepealedTimes = 0 #int
	###银行冲正标志
    BankRepealFlag = None #bytes [1]
	###期商冲正标志
    BrokerRepealFlag = None #bytes [1]
	###被冲正平台流水号
    PlateRepealSerial = 0 #int
	###被冲正银行流水号
    BankRepealSerial = '' #str [13]
	###被冲正期货流水号
    FutureRepealSerial = 0 #int
	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###期货公司流水号
    FutureSerial = 0 #int
	###用户标识
    UserID = '' #str [16]
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###转帐金额
    TradeAmount = 0 #double
	###期货可取金额
    FutureFetchAmount = 0 #double
	###费用支付标志
    FeePayFlag = None #bytes [1]
	###应收客户费用
    CustFee = 0 #double
	###应收期货公司费用
    BrokerFee = 0 #double
	###发送方给接收方的消息
    Message = '' #str [129]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###转账交易状态
    TransferStatus = None #bytes [1]


###冲正响应
class pyThostFtdcRspRepealField:

	###冲正时间间隔
    RepealTimeInterval = 0 #int
	###已经冲正次数
    RepealedTimes = 0 #int
	###银行冲正标志
    BankRepealFlag = None #bytes [1]
	###期商冲正标志
    BrokerRepealFlag = None #bytes [1]
	###被冲正平台流水号
    PlateRepealSerial = 0 #int
	###被冲正银行流水号
    BankRepealSerial = '' #str [13]
	###被冲正期货流水号
    FutureRepealSerial = 0 #int
	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###期货公司流水号
    FutureSerial = 0 #int
	###用户标识
    UserID = '' #str [16]
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###转帐金额
    TradeAmount = 0 #double
	###期货可取金额
    FutureFetchAmount = 0 #double
	###费用支付标志
    FeePayFlag = None #bytes [1]
	###应收客户费用
    CustFee = 0 #double
	###应收期货公司费用
    BrokerFee = 0 #double
	###发送方给接收方的消息
    Message = '' #str [129]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###转账交易状态
    TransferStatus = None #bytes [1]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###查询账户信息请求
class pyThostFtdcReqQueryAccountField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###期货公司流水号
    FutureSerial = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int


###查询账户信息响应
class pyThostFtdcRspQueryAccountField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###期货公司流水号
    FutureSerial = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###银行可用金额
    BankUseAmount = 0 #double
	###银行可取金额
    BankFetchAmount = 0 #double


###期商签到签退
class pyThostFtdcFutureSignIOField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###摘要
    Digest = '' #str [36]
	###币种代码
    CurrencyID = '' #str [4]
	###渠道标志
    DeviceID = '' #str [3]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int


###期商签到响应
class pyThostFtdcRspFutureSignInField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###摘要
    Digest = '' #str [36]
	###币种代码
    CurrencyID = '' #str [4]
	###渠道标志
    DeviceID = '' #str [3]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]
	###PIN密钥
    PinKey = '' #str [129]
	###MAC密钥
    MacKey = '' #str [129]


###期商签退请求
class pyThostFtdcReqFutureSignOutField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###摘要
    Digest = '' #str [36]
	###币种代码
    CurrencyID = '' #str [4]
	###渠道标志
    DeviceID = '' #str [3]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int


###期商签退响应
class pyThostFtdcRspFutureSignOutField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###摘要
    Digest = '' #str [36]
	###币种代码
    CurrencyID = '' #str [4]
	###渠道标志
    DeviceID = '' #str [3]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###查询指定流水号的交易结果请求
class pyThostFtdcReqQueryTradeResultBySerialField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###流水号
    Reference = 0 #int
	###本流水号发布者的机构类型
    RefrenceIssureType = None #bytes [1]
	###本流水号发布者机构编码
    RefrenceIssure = '' #str [36]
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###币种代码
    CurrencyID = '' #str [4]
	###转帐金额
    TradeAmount = 0 #double
	###摘要
    Digest = '' #str [36]


###查询指定流水号的交易结果响应
class pyThostFtdcRspQueryTradeResultBySerialField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]
	###流水号
    Reference = 0 #int
	###本流水号发布者的机构类型
    RefrenceIssureType = None #bytes [1]
	###本流水号发布者机构编码
    RefrenceIssure = '' #str [36]
	###原始返回代码
    OriginReturnCode = '' #str [7]
	###原始返回码描述
    OriginDescrInfoForReturnCode = '' #str [129]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###币种代码
    CurrencyID = '' #str [4]
	###转帐金额
    TradeAmount = 0 #double
	###摘要
    Digest = '' #str [36]


###日终文件就绪请求
class pyThostFtdcReqDayEndFileReadyField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###文件业务功能
    FileBusinessCode = None #bytes [1]
	###摘要
    Digest = '' #str [36]


###返回结果
class pyThostFtdcReturnResultField:

	###返回代码
    ReturnCode = '' #str [7]
	###返回码描述
    DescrInfoForReturnCode = '' #str [129]


###验证期货资金密码
class pyThostFtdcVerifyFuturePasswordField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###交易ID
    TID = 0 #int
	###币种代码
    CurrencyID = '' #str [4]


###验证客户信息
class pyThostFtdcVerifyCustInfoField:

	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]


###验证期货资金密码和客户信息
class pyThostFtdcVerifyFuturePasswordAndCustInfoField:

	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###币种代码
    CurrencyID = '' #str [4]


###验证期货资金密码和客户信息
class pyThostFtdcDepositResultInformField:

	###出入金流水号，该流水号为银期报盘返回的流水号
    DepositSeqNo = '' #str [15]
	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者代码
    InvestorID = '' #str [13]
	###入金金额
    Deposit = 0 #double
	###请求编号
    RequestID = 0 #int
	###返回代码
    ReturnCode = '' #str [7]
	###返回码描述
    DescrInfoForReturnCode = '' #str [129]


###交易核心向银期报盘发出密钥同步请求
class pyThostFtdcReqSyncKeyField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###交易核心给银期报盘的消息
    Message = '' #str [129]
	###渠道标志
    DeviceID = '' #str [3]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int


###交易核心向银期报盘发出密钥同步响应
class pyThostFtdcRspSyncKeyField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###交易核心给银期报盘的消息
    Message = '' #str [129]
	###渠道标志
    DeviceID = '' #str [3]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###查询账户信息通知
class pyThostFtdcNotifyQueryAccountField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户类型
    CustType = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###期货公司流水号
    FutureSerial = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###银行可用金额
    BankUseAmount = 0 #double
	###银行可取金额
    BankFetchAmount = 0 #double
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###银期转账交易流水表
class pyThostFtdcTransferSerialField:

	###平台流水号
    PlateSerial = 0 #int
	###交易发起方日期
    TradeDate = '' #str [9]
	###交易日期
    TradingDay = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###交易代码
    TradeCode = '' #str [7]
	###会话编号
    SessionID = 0 #int
	###银行编码
    BankID = '' #str [4]
	###银行分支机构编码
    BankBranchID = '' #str [5]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行流水号
    BankSerial = '' #str [13]
	###期货公司编码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###期货公司帐号类型
    FutureAccType = None #bytes [1]
	###投资者帐号
    AccountID = '' #str [13]
	###投资者代码
    InvestorID = '' #str [13]
	###期货公司流水号
    FutureSerial = 0 #int
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###币种代码
    CurrencyID = '' #str [4]
	###交易金额
    TradeAmount = 0 #double
	###应收客户费用
    CustFee = 0 #double
	###应收期货公司费用
    BrokerFee = 0 #double
	###有效标志
    AvailabilityFlag = None #bytes [1]
	###操作员
    OperatorCode = '' #str [17]
	###新银行帐号
    BankNewAccount = '' #str [41]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###请求查询转帐流水
class pyThostFtdcQryTransferSerialField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###银行编码
    BankID = '' #str [4]
	###币种代码
    CurrencyID = '' #str [4]


###期商签到通知
class pyThostFtdcNotifyFutureSignInField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###摘要
    Digest = '' #str [36]
	###币种代码
    CurrencyID = '' #str [4]
	###渠道标志
    DeviceID = '' #str [3]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]
	###PIN密钥
    PinKey = '' #str [129]
	###MAC密钥
    MacKey = '' #str [129]


###期商签退通知
class pyThostFtdcNotifyFutureSignOutField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###摘要
    Digest = '' #str [36]
	###币种代码
    CurrencyID = '' #str [4]
	###渠道标志
    DeviceID = '' #str [3]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###交易核心向银期报盘发出密钥同步处理结果的通知
class pyThostFtdcNotifySyncKeyField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###安装编号
    InstallID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###交易核心给银期报盘的消息
    Message = '' #str [129]
	###渠道标志
    DeviceID = '' #str [3]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###交易柜员
    OperNo = '' #str [17]
	###请求编号
    RequestID = 0 #int
	###交易ID
    TID = 0 #int
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###请求查询银期签约关系
class pyThostFtdcQryAccountregisterField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###银行编码
    BankID = '' #str [4]
	###银行分支机构编码
    BankBranchID = '' #str [5]
	###币种代码
    CurrencyID = '' #str [4]


###客户开销户信息表
class pyThostFtdcAccountregisterField:

	###交易日期
    TradeDay = '' #str [9]
	###银行编码
    BankID = '' #str [4]
	###银行分支机构编码
    BankBranchID = '' #str [5]
	###银行帐号
    BankAccount = '' #str [41]
	###期货公司编码
    BrokerID = '' #str [11]
	###期货公司分支机构编码
    BrokerBranchID = '' #str [31]
	###投资者帐号
    AccountID = '' #str [13]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###客户姓名
    CustomerName = '' #str [51]
	###币种代码
    CurrencyID = '' #str [4]
	###开销户类别
    OpenOrDestroy = None #bytes [1]
	###签约日期
    RegDate = '' #str [9]
	###解约日期
    OutDate = '' #str [9]
	###交易ID
    TID = 0 #int
	###客户类型
    CustType = None #bytes [1]
	###银行帐号类型
    BankAccType = None #bytes [1]


###银期开户信息
class pyThostFtdcOpenAccountField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###性别
    Gender = None #bytes [1]
	###国家代码
    CountryCode = '' #str [21]
	###客户类型
    CustType = None #bytes [1]
	###地址
    Address = '' #str [101]
	###邮编
    ZipCode = '' #str [7]
	###电话号码
    Telephone = '' #str [41]
	###手机
    MobilePhone = '' #str [21]
	###传真
    Fax = '' #str [41]
	###电子邮件
    EMail = '' #str [41]
	###资金账户状态
    MoneyAccountStatus = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###汇钞标志
    CashExchangeCode = None #bytes [1]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###交易ID
    TID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###银期销户信息
class pyThostFtdcCancelAccountField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###性别
    Gender = None #bytes [1]
	###国家代码
    CountryCode = '' #str [21]
	###客户类型
    CustType = None #bytes [1]
	###地址
    Address = '' #str [101]
	###邮编
    ZipCode = '' #str [7]
	###电话号码
    Telephone = '' #str [41]
	###手机
    MobilePhone = '' #str [21]
	###传真
    Fax = '' #str [41]
	###电子邮件
    EMail = '' #str [41]
	###资金账户状态
    MoneyAccountStatus = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###安装编号
    InstallID = 0 #int
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###汇钞标志
    CashExchangeCode = None #bytes [1]
	###摘要
    Digest = '' #str [36]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###渠道标志
    DeviceID = '' #str [3]
	###期货单位帐号类型
    BankSecuAccType = None #bytes [1]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###期货单位帐号
    BankSecuAcc = '' #str [41]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易柜员
    OperNo = '' #str [17]
	###交易ID
    TID = 0 #int
	###用户标识
    UserID = '' #str [16]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###银期变更银行账号信息
class pyThostFtdcChangeAccountField:

	###业务功能码
    TradeCode = '' #str [7]
	###银行代码
    BankID = '' #str [4]
	###银行分支机构代码
    BankBranchID = '' #str [5]
	###期商代码
    BrokerID = '' #str [11]
	###期商分支机构代码
    BrokerBranchID = '' #str [31]
	###交易日期
    TradeDate = '' #str [9]
	###交易时间
    TradeTime = '' #str [9]
	###银行流水号
    BankSerial = '' #str [13]
	###交易系统日期 
    TradingDay = '' #str [9]
	###银期平台消息流水号
    PlateSerial = 0 #int
	###最后分片标志
    LastFragment = None #bytes [1]
	###会话号
    SessionID = 0 #int
	###客户姓名
    CustomerName = '' #str [51]
	###证件类型
    IdCardType = None #bytes [1]
	###证件号码
    IdentifiedCardNo = '' #str [51]
	###性别
    Gender = None #bytes [1]
	###国家代码
    CountryCode = '' #str [21]
	###客户类型
    CustType = None #bytes [1]
	###地址
    Address = '' #str [101]
	###邮编
    ZipCode = '' #str [7]
	###电话号码
    Telephone = '' #str [41]
	###手机
    MobilePhone = '' #str [21]
	###传真
    Fax = '' #str [41]
	###电子邮件
    EMail = '' #str [41]
	###资金账户状态
    MoneyAccountStatus = None #bytes [1]
	###银行帐号
    BankAccount = '' #str [41]
	###银行密码
    BankPassWord = '' #str [41]
	###新银行帐号
    NewBankAccount = '' #str [41]
	###新银行密码
    NewBankPassWord = '' #str [41]
	###投资者帐号
    AccountID = '' #str [13]
	###期货密码
    Password = '' #str [41]
	###银行帐号类型
    BankAccType = None #bytes [1]
	###安装编号
    InstallID = 0 #int
	###验证客户证件号码标志
    VerifyCertNoFlag = None #bytes [1]
	###币种代码
    CurrencyID = '' #str [4]
	###期货公司银行编码
    BrokerIDByBank = '' #str [33]
	###银行密码标志
    BankPwdFlag = None #bytes [1]
	###期货资金密码核对标志
    SecuPwdFlag = None #bytes [1]
	###交易ID
    TID = 0 #int
	###摘要
    Digest = '' #str [36]
	###错误代码
    ErrorID = 0 #int
	###错误信息
    ErrorMsg = '' #str [81]


###二级代理操作员银期权限
class pyThostFtdcSecAgentACIDMapField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###资金账户
    AccountID = '' #str [13]
	###币种
    CurrencyID = '' #str [4]
	###境外中介机构资金帐号
    BrokerSecAgentID = '' #str [13]


###二级代理操作员银期权限查询
class pyThostFtdcQrySecAgentACIDMapField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###资金账户
    AccountID = '' #str [13]
	###币种
    CurrencyID = '' #str [4]


###灾备中心交易权限
class pyThostFtdcUserRightsAssignField:

	###应用单元代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###交易中心代码
    DRIdentityID = 0 #int


###经济公司是否有在本标示的交易权限
class pyThostFtdcBrokerUserRightAssignField:

	###应用单元代码
    BrokerID = '' #str [11]
	###交易中心代码
    DRIdentityID = 0 #int
	###能否交易
    Tradeable = 0 #int


###灾备交易转换报文
class pyThostFtdcDRTransferField:

	###原交易中心代码
    OrigDRIdentityID = 0 #int
	###目标交易中心代码
    DestDRIdentityID = 0 #int
	###原应用单元代码
    OrigBrokerID = '' #str [11]
	###目标易用单元代码
    DestBrokerID = '' #str [11]


###Fens用户信息
class pyThostFtdcFensUserInfoField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]
	###登录模式
    LoginMode = None #bytes [1]


###当前银期所属交易中心
class pyThostFtdcCurrTransferIdentityField:

	###交易中心代码
    IdentityID = 0 #int


###禁止登录用户
class pyThostFtdcLoginForbiddenUserField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]


###查询禁止登录用户
class pyThostFtdcQryLoginForbiddenUserField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###用户代码
    UserID = '' #str [16]


###UDP组播组信息
class pyThostFtdcMulticastGroupInfoField:

	###组播组IP地址
    GroupIP = '' #str [16]
	###组播组IP端口
    GroupPort = 0 #int
	###源地址
    SourceIP = '' #str [16]


###资金账户基本准备金
class pyThostFtdcTradingAccountReserveField:

	###经纪公司代码
    BrokerID = '' #str [11]
	###投资者帐号
    AccountID = '' #str [13]
	###基本准备金
    Reserve = 0 #double
	###币种代码
    CurrencyID = '' #str [4]

