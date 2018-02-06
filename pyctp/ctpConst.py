# encoding: UTF-8

#########################################################################
###@system 新一代交易所系统
###@company 上海期货信息技术有限公司
###@file ThostFtdcUserApiDataType.h
###@brief 定义了客户端接口使用的业务数据类型
###@history 
###20060106	赵鸿昊		创建该文件
#########################################################################

THOST_TERT_RESTART = 0
THOST_TERT_RESUME = 1
THOST_TERT_QUICK = 2

#########################################################################
###TFtdcExchangePropertyType是一个交易所属性类型
#########################################################################
###正常
THOST_FTDC_EXP_Normal = '0'
###根据成交生成报单
THOST_FTDC_EXP_GenOrderByTrade = '1'

#########################################################################
###TFtdcIdCardTypeType是一个证件类型类型
#########################################################################
###组织机构代码
THOST_FTDC_ICT_EID = '0'
###中国公民身份证
THOST_FTDC_ICT_IDCard = '1'
###军官证
THOST_FTDC_ICT_OfficerIDCard = '2'
###警官证
THOST_FTDC_ICT_PoliceIDCard = '3'
###士兵证
THOST_FTDC_ICT_SoldierIDCard = '4'
###户口簿
THOST_FTDC_ICT_HouseholdRegister  = '5'
###护照
THOST_FTDC_ICT_Passport = '6'
###台胞证
THOST_FTDC_ICT_TaiwanCompatriotIDCard  = '7'
###回乡证
THOST_FTDC_ICT_HomeComingCard = '8'
###营业执照号
THOST_FTDC_ICT_LicenseNo = '9'
###税务登记号#当地纳税ID
THOST_FTDC_ICT_TaxNo = 'A'
###港澳居民来往内地通行证
THOST_FTDC_ICT_HMMainlandTravelPermit  = 'B'
###台湾居民来往大陆通行证
THOST_FTDC_ICT_TwMainlandTravelPermit = 'C'
###驾照
THOST_FTDC_ICT_DrivingLicense = 'D'
###当地社保ID
THOST_FTDC_ICT_SocialID = 'F'
###当地身份证
THOST_FTDC_ICT_LocalID = 'G'
###商业登记证
THOST_FTDC_ICT_BusinessRegistration  = 'H'
###港澳永久性居民身份证
THOST_FTDC_ICT_HKMCIDCard = 'I'
###人行开户许可证
THOST_FTDC_ICT_AccountsPermits = 'J'
###其他证件
THOST_FTDC_ICT_OtherCard = 'x'

#########################################################################
###TFtdcInvestorRangeType是一个投资者范围类型
#########################################################################
###所有
THOST_FTDC_IR_All = '1'
###投资者组
THOST_FTDC_IR_Group = '2'
###单一投资者
THOST_FTDC_IR_Single = '3'

#########################################################################
###TFtdcDepartmentRangeType是一个投资者范围类型
#########################################################################
###所有
THOST_FTDC_DR_All = '1'
###组织架构
THOST_FTDC_DR_Group = '2'
###单一投资者
THOST_FTDC_DR_Single = '3'

#########################################################################
###TFtdcDataSyncStatusType是一个数据同步状态类型
#########################################################################
###未同步
THOST_FTDC_DS_Asynchronous = '1'
###同步中
THOST_FTDC_DS_Synchronizing = '2'
###已同步
THOST_FTDC_DS_Synchronized = '3'

#########################################################################
###TFtdcBrokerDataSyncStatusType是一个经纪公司数据同步状态类型
#########################################################################
###已同步
THOST_FTDC_BDS_Synchronized = '1'
###同步中
THOST_FTDC_BDS_Synchronizing = '2'

#########################################################################
###TFtdcExchangeConnectStatusType是一个交易所连接状态类型
#########################################################################
###没有任何连接
THOST_FTDC_ECS_NoConnection = '1'
###已经发出合约查询请求
THOST_FTDC_ECS_QryInstrumentSent = '2'
###已经获取信息
THOST_FTDC_ECS_GotInformation = '9'

#########################################################################
###TFtdcTraderConnectStatusType是一个交易所交易员连接状态类型
#########################################################################
###没有任何连接
THOST_FTDC_TCS_NotConnected = '1'
###已经连接
THOST_FTDC_TCS_Connected = '2'
###已经发出合约查询请求
THOST_FTDC_TCS_QryInstrumentSent = '3'
###订阅私有流
THOST_FTDC_TCS_SubPrivateFlow = '4'

#########################################################################
###TFtdcFunctionCodeType是一个功能代码类型
#########################################################################
###数据异步化
THOST_FTDC_FC_DataAsync = '1'
###强制用户登出
THOST_FTDC_FC_ForceUserLogout = '2'
###变更管理用户口令
THOST_FTDC_FC_UserPasswordUpdate = '3'
###变更经纪公司口令
THOST_FTDC_FC_BrokerPasswordUpdate = '4'
###变更投资者口令
THOST_FTDC_FC_InvestorPasswordUpdate = '5'
###报单插入
THOST_FTDC_FC_OrderInsert = '6'
###报单操作
THOST_FTDC_FC_OrderAction = '7'
###同步系统数据
THOST_FTDC_FC_SyncSystemData = '8'
###同步经纪公司数据
THOST_FTDC_FC_SyncBrokerData = '9'
###批量同步经纪公司数据
THOST_FTDC_FC_BachSyncBrokerData = 'A'
###超级查询
THOST_FTDC_FC_SuperQuery = 'B'
###预埋报单插入
THOST_FTDC_FC_ParkedOrderInsert = 'C'
###预埋报单操作
THOST_FTDC_FC_ParkedOrderAction = 'D'
###同步动态令牌
THOST_FTDC_FC_SyncOTP = 'E'
###删除未知单
THOST_FTDC_FC_DeleteOrder = 'F'

#########################################################################
###TFtdcBrokerFunctionCodeType是一个经纪公司功能代码类型
#########################################################################
###强制用户登出
THOST_FTDC_BFC_ForceUserLogout = '1'
###变更用户口令
THOST_FTDC_BFC_UserPasswordUpdate = '2'
###同步经纪公司数据
THOST_FTDC_BFC_SyncBrokerData = '3'
###批量同步经纪公司数据
THOST_FTDC_BFC_BachSyncBrokerData = '4'
###报单插入
THOST_FTDC_BFC_OrderInsert = '5'
###报单操作
THOST_FTDC_BFC_OrderAction = '6'
###全部查询
THOST_FTDC_BFC_AllQuery = '7'
###系统功能：登入#登出#修改密码等
THOST_FTDC_BFC_log = 'a'
###基本查询：查询基础数据，如合约，交易所等常量
THOST_FTDC_BFC_BaseQry = 'b'
###交易查询：如查成交，委托
THOST_FTDC_BFC_TradeQry = 'c'
###交易功能：报单，撤单
THOST_FTDC_BFC_Trade = 'd'
###银期转账
THOST_FTDC_BFC_Virement = 'e'
###风险监控
THOST_FTDC_BFC_Risk = 'f'
###查询#管理：查询会话，踢人等
THOST_FTDC_BFC_Session = 'g'
###风控通知控制
THOST_FTDC_BFC_RiskNoticeCtl = 'h'
###风控通知发送
THOST_FTDC_BFC_RiskNotice = 'i'
###察看经纪公司资金权限
THOST_FTDC_BFC_BrokerDeposit = 'j'
###资金查询
THOST_FTDC_BFC_QueryFund = 'k'
###报单查询
THOST_FTDC_BFC_QueryOrder = 'l'
###成交查询
THOST_FTDC_BFC_QueryTrade = 'm'
###持仓查询
THOST_FTDC_BFC_QueryPosition = 'n'
###行情查询
THOST_FTDC_BFC_QueryMarketData = 'o'
###用户事件查询
THOST_FTDC_BFC_QueryUserEvent = 'p'
###风险通知查询
THOST_FTDC_BFC_QueryRiskNotify = 'q'
###出入金查询
THOST_FTDC_BFC_QueryFundChange = 'r'
###投资者信息查询
THOST_FTDC_BFC_QueryInvestor = 's'
###交易编码查询
THOST_FTDC_BFC_QueryTradingCode = 't'
###强平
THOST_FTDC_BFC_ForceClose = 'u'
###压力测试
THOST_FTDC_BFC_PressTest = 'v'
###权益反算
THOST_FTDC_BFC_RemainCalc = 'w'
###净持仓保证金指标
THOST_FTDC_BFC_NetPositionInd = 'x'
###风险预算
THOST_FTDC_BFC_RiskPredict = 'y'
###数据导出
THOST_FTDC_BFC_DataExport = 'z'
###风控指标设置
THOST_FTDC_BFC_RiskTargetSetup = 'A'
###行情预警
THOST_FTDC_BFC_MarketDataWarn = 'B'
###业务通知查询
THOST_FTDC_BFC_QryBizNotice = 'C'
###业务通知模板设置
THOST_FTDC_BFC_CfgBizNotice = 'D'
###同步动态令牌
THOST_FTDC_BFC_SyncOTP = 'E'
###发送业务通知
THOST_FTDC_BFC_SendBizNotice = 'F'
###风险级别标准设置
THOST_FTDC_BFC_CfgRiskLevelStd = 'G'
###交易终端应急功能
THOST_FTDC_BFC_TbCommand = 'H'
###删除未知单
THOST_FTDC_BFC_DeleteOrder = 'J'
###预埋报单插入
THOST_FTDC_BFC_ParkedOrderInsert = 'K'
###预埋报单操作
THOST_FTDC_BFC_ParkedOrderAction = 'L'

#########################################################################
###TFtdcOrderActionStatusType是一个报单操作状态类型
#########################################################################
###已经提交
THOST_FTDC_OAS_Submitted = 'a'
###已经接受
THOST_FTDC_OAS_Accepted = 'b'
###已经被拒绝
THOST_FTDC_OAS_Rejected = 'c'

#########################################################################
###TFtdcOrderStatusType是一个报单状态类型
#########################################################################
###全部成交
THOST_FTDC_OST_AllTraded = '0'
###部分成交还在队列中
THOST_FTDC_OST_PartTradedQueueing = '1'
###部分成交不在队列中
THOST_FTDC_OST_PartTradedNotQueueing = '2'
###未成交还在队列中
THOST_FTDC_OST_NoTradeQueueing = '3'
###未成交不在队列中
THOST_FTDC_OST_NoTradeNotQueueing = '4'
###撤单
THOST_FTDC_OST_Canceled = '5'
###未知
THOST_FTDC_OST_Unknown = 'a'
###尚未触发
THOST_FTDC_OST_NotTouched = 'b'
###已触发
THOST_FTDC_OST_Touched = 'c'

#########################################################################
###TFtdcOrderSubmitStatusType是一个报单提交状态类型
#########################################################################
###已经提交
THOST_FTDC_OSS_InsertSubmitted = '0'
###撤单已经提交
THOST_FTDC_OSS_CancelSubmitted = '1'
###修改已经提交
THOST_FTDC_OSS_ModifySubmitted = '2'
###已经接受
THOST_FTDC_OSS_Accepted = '3'
###报单已经被拒绝
THOST_FTDC_OSS_InsertRejected = '4'
###撤单已经被拒绝
THOST_FTDC_OSS_CancelRejected = '5'
###改单已经被拒绝
THOST_FTDC_OSS_ModifyRejected = '6'

#########################################################################
###TFtdcPositionDateType是一个持仓日期类型
#########################################################################
###今日持仓
THOST_FTDC_PSD_Today = '1'
###历史持仓
THOST_FTDC_PSD_History = '2'

#########################################################################
###TFtdcPositionDateTypeType是一个持仓日期类型类型
#########################################################################
###使用历史持仓
THOST_FTDC_PDT_UseHistory = '1'
###不使用历史持仓
THOST_FTDC_PDT_NoUseHistory = '2'

#########################################################################
###TFtdcTradingRoleType是一个交易角色类型
#########################################################################
###代理
THOST_FTDC_ER_Broker = '1'
###自营
THOST_FTDC_ER_Host = '2'
###做市商
THOST_FTDC_ER_Maker = '3'

#########################################################################
###TFtdcProductClassType是一个产品类型类型
#########################################################################
###期货
THOST_FTDC_PC_Futures = '1'
###期货期权
THOST_FTDC_PC_Options = '2'
###组合
THOST_FTDC_PC_Combination = '3'
###即期
THOST_FTDC_PC_Spot = '4'
###期转现
THOST_FTDC_PC_EFP = '5'
###现货期权
THOST_FTDC_PC_SpotOption = '6'

#########################################################################
###TFtdcInstLifePhaseType是一个合约生命周期状态类型
#########################################################################
###未上市
THOST_FTDC_IP_NotStart = '0'
###上市
THOST_FTDC_IP_Started = '1'
###停牌
THOST_FTDC_IP_Pause = '2'
###到期
THOST_FTDC_IP_Expired = '3'

#########################################################################
###TFtdcDirectionType是一个买卖方向类型
#########################################################################
###买
THOST_FTDC_D_Buy = '0'
###卖
THOST_FTDC_D_Sell = '1'

#########################################################################
###TFtdcPositionTypeType是一个持仓类型类型
#########################################################################
###净持仓
THOST_FTDC_PT_Net = '1'
###综合持仓
THOST_FTDC_PT_Gross = '2'

#########################################################################
###TFtdcPosiDirectionType是一个持仓多空方向类型
#########################################################################
###净
THOST_FTDC_PD_Net = '1'
###多头
THOST_FTDC_PD_Long = '2'
###空头
THOST_FTDC_PD_Short = '3'

#########################################################################
###TFtdcSysSettlementStatusType是一个系统结算状态类型
#########################################################################
###不活跃
THOST_FTDC_SS_NonActive = '1'
###启动
THOST_FTDC_SS_Startup = '2'
###操作
THOST_FTDC_SS_Operating = '3'
###结算
THOST_FTDC_SS_Settlement = '4'
###结算完成
THOST_FTDC_SS_SettlementFinished = '5'

#########################################################################
###TFtdcRatioAttrType是一个费率属性类型
#########################################################################
###交易费率
THOST_FTDC_RA_Trade = '0'
###结算费率
THOST_FTDC_RA_Settlement = '1'

#########################################################################
###TFtdcHedgeFlagType是一个投机套保标志类型
#########################################################################
###投机
THOST_FTDC_HF_Speculation = '1'
###套利
THOST_FTDC_HF_Arbitrage = '2'
###套保
THOST_FTDC_HF_Hedge = '3'

#########################################################################
###TFtdcBillHedgeFlagType是一个投机套保标志类型
#########################################################################
###投机
THOST_FTDC_BHF_Speculation = '1'
###套利
THOST_FTDC_BHF_Arbitrage = '2'
###套保
THOST_FTDC_BHF_Hedge = '3'

#########################################################################
###TFtdcClientIDTypeType是一个交易编码类型类型
#########################################################################
###投机
THOST_FTDC_CIDT_Speculation = '1'
###套利
THOST_FTDC_CIDT_Arbitrage = '2'
###套保
THOST_FTDC_CIDT_Hedge = '3'

#########################################################################
###TFtdcOrderPriceTypeType是一个报单价格条件类型
#########################################################################
###任意价
THOST_FTDC_OPT_AnyPrice = '1'
###限价
THOST_FTDC_OPT_LimitPrice = '2'
###最优价
THOST_FTDC_OPT_BestPrice = '3'
###最新价
THOST_FTDC_OPT_LastPrice = '4'
###最新价浮动上浮1个ticks
THOST_FTDC_OPT_LastPricePlusOneTicks = '5'
###最新价浮动上浮2个ticks
THOST_FTDC_OPT_LastPricePlusTwoTicks = '6'
###最新价浮动上浮3个ticks
THOST_FTDC_OPT_LastPricePlusThreeTicks = '7'
###卖一价
THOST_FTDC_OPT_AskPrice1 = '8'
###卖一价浮动上浮1个ticks
THOST_FTDC_OPT_AskPrice1PlusOneTicks = '9'
###卖一价浮动上浮2个ticks
THOST_FTDC_OPT_AskPrice1PlusTwoTicks = 'A'
###卖一价浮动上浮3个ticks
THOST_FTDC_OPT_AskPrice1PlusThreeTicks = 'B'
###买一价
THOST_FTDC_OPT_BidPrice1 = 'C'
###买一价浮动上浮1个ticks
THOST_FTDC_OPT_BidPrice1PlusOneTicks = 'D'
###买一价浮动上浮2个ticks
THOST_FTDC_OPT_BidPrice1PlusTwoTicks = 'E'
###买一价浮动上浮3个ticks
THOST_FTDC_OPT_BidPrice1PlusThreeTicks = 'F'
###五档价
THOST_FTDC_OPT_FiveLevelPrice = 'G'

#########################################################################
###TFtdcOffsetFlagType是一个开平标志类型
#########################################################################
###开仓
THOST_FTDC_OF_Open = '0'
###平仓
THOST_FTDC_OF_Close = '1'
###强平
THOST_FTDC_OF_ForceClose = '2'
###平今
THOST_FTDC_OF_CloseToday = '3'
###平昨
THOST_FTDC_OF_CloseYesterday = '4'
###强减
THOST_FTDC_OF_ForceOff = '5'
###本地强平
THOST_FTDC_OF_LocalForceClose = '6'

#########################################################################
###TFtdcForceCloseReasonType是一个强平原因类型
#########################################################################
###非强平
THOST_FTDC_FCC_NotForceClose = '0'
###资金不足
THOST_FTDC_FCC_LackDeposit = '1'
###客户超仓
THOST_FTDC_FCC_ClientOverPositionLimit = '2'
###会员超仓
THOST_FTDC_FCC_MemberOverPositionLimit = '3'
###持仓非整数倍
THOST_FTDC_FCC_NotMultiple = '4'
###违规
THOST_FTDC_FCC_Violation = '5'
###其它
THOST_FTDC_FCC_Other = '6'
###自然人临近交割
THOST_FTDC_FCC_PersonDeliv = '7'

#########################################################################
###TFtdcOrderTypeType是一个报单类型类型
#########################################################################
###正常
THOST_FTDC_ORDT_Normal = '0'
###报价衍生
THOST_FTDC_ORDT_DeriveFromQuote = '1'
###组合衍生
THOST_FTDC_ORDT_DeriveFromCombination = '2'
###组合报单
THOST_FTDC_ORDT_Combination = '3'
###条件单
THOST_FTDC_ORDT_ConditionalOrder = '4'
###互换单
THOST_FTDC_ORDT_Swap = '5'

#########################################################################
###TFtdcTimeConditionType是一个有效期类型类型
#########################################################################
###立即完成，否则撤销
THOST_FTDC_TC_IOC = '1'
###本节有效
THOST_FTDC_TC_GFS = '2'
###当日有效
THOST_FTDC_TC_GFD = '3'
###指定日期前有效
THOST_FTDC_TC_GTD = '4'
###撤销前有效
THOST_FTDC_TC_GTC = '5'
###集合竞价有效
THOST_FTDC_TC_GFA = '6'

#########################################################################
###TFtdcVolumeConditionType是一个成交量类型类型
#########################################################################
###任何数量
THOST_FTDC_VC_AV = '1'
###最小数量
THOST_FTDC_VC_MV = '2'
###全部数量
THOST_FTDC_VC_CV = '3'

#########################################################################
###TFtdcContingentConditionType是一个触发条件类型
#########################################################################
###立即
THOST_FTDC_CC_Immediately = '1'
###止损
THOST_FTDC_CC_Touch = '2'
###止赢
THOST_FTDC_CC_TouchProfit = '3'
###预埋单
THOST_FTDC_CC_ParkedOrder = '4'
###最新价大于条件价
THOST_FTDC_CC_LastPriceGreaterThanStopPrice = '5'
###最新价大于等于条件价
THOST_FTDC_CC_LastPriceGreaterEqualStopPrice = '6'
###最新价小于条件价
THOST_FTDC_CC_LastPriceLesserThanStopPrice = '7'
###最新价小于等于条件价
THOST_FTDC_CC_LastPriceLesserEqualStopPrice = '8'
###卖一价大于条件价
THOST_FTDC_CC_AskPriceGreaterThanStopPrice = '9'
###卖一价大于等于条件价
THOST_FTDC_CC_AskPriceGreaterEqualStopPrice = 'A'
###卖一价小于条件价
THOST_FTDC_CC_AskPriceLesserThanStopPrice = 'B'
###卖一价小于等于条件价
THOST_FTDC_CC_AskPriceLesserEqualStopPrice = 'C'
###买一价大于条件价
THOST_FTDC_CC_BidPriceGreaterThanStopPrice = 'D'
###买一价大于等于条件价
THOST_FTDC_CC_BidPriceGreaterEqualStopPrice = 'E'
###买一价小于条件价
THOST_FTDC_CC_BidPriceLesserThanStopPrice = 'F'
###买一价小于等于条件价
THOST_FTDC_CC_BidPriceLesserEqualStopPrice = 'H'

#########################################################################
###TFtdcActionFlagType是一个操作标志类型
#########################################################################
###删除
THOST_FTDC_AF_Delete = '0'
###修改
THOST_FTDC_AF_Modify = '3'

#########################################################################
###TFtdcTradingRightType是一个交易权限类型
#########################################################################
###可以交易
THOST_FTDC_TR_Allow = '0'
###只能平仓
THOST_FTDC_TR_CloseOnly = '1'
###不能交易
THOST_FTDC_TR_Forbidden = '2'

#########################################################################
###TFtdcOrderSourceType是一个报单来源类型
#########################################################################
###来自参与者
THOST_FTDC_OSRC_Participant = '0'
###来自管理员
THOST_FTDC_OSRC_Administrator = '1'

#########################################################################
###TFtdcTradeTypeType是一个成交类型类型
#########################################################################
###组合持仓拆分为单一持仓,初始化不应包含该类型的持仓
THOST_FTDC_TRDT_SplitCombination = '#'
###普通成交
THOST_FTDC_TRDT_Common = '0'
###期权执行
THOST_FTDC_TRDT_OptionsExecution = '1'
###OTC成交
THOST_FTDC_TRDT_OTC = '2'
###期转现衍生成交
THOST_FTDC_TRDT_EFPDerived = '3'
###组合衍生成交
THOST_FTDC_TRDT_CombinationDerived = '4'

#########################################################################
###TFtdcPriceSourceType是一个成交价来源类型
#########################################################################
###前成交价
THOST_FTDC_PSRC_LastPrice = '0'
###买委托价
THOST_FTDC_PSRC_Buy = '1'
###卖委托价
THOST_FTDC_PSRC_Sell = '2'

#########################################################################
###TFtdcInstrumentStatusType是一个合约交易状态类型
#########################################################################
###开盘前
THOST_FTDC_IS_BeforeTrading = '0'
###非交易
THOST_FTDC_IS_NoTrading = '1'
###连续交易
THOST_FTDC_IS_Continous = '2'
###集合竞价报单
THOST_FTDC_IS_AuctionOrdering = '3'
###集合竞价价格平衡
THOST_FTDC_IS_AuctionBalance = '4'
###集合竞价撮合
THOST_FTDC_IS_AuctionMatch = '5'
###收盘
THOST_FTDC_IS_Closed = '6'

#########################################################################
###TFtdcInstStatusEnterReasonType是一个品种进入交易状态原因类型
#########################################################################
###自动切换
THOST_FTDC_IER_Automatic = '1'
###手动切换
THOST_FTDC_IER_Manual = '2'
###熔断
THOST_FTDC_IER_Fuse = '3'

#########################################################################
###TFtdcBatchStatusType是一个处理状态类型
#########################################################################
###未上传
THOST_FTDC_BS_NoUpload = '1'
###已上传
THOST_FTDC_BS_Uploaded = '2'
###审核失败
THOST_FTDC_BS_Failed = '3'

#########################################################################
###TFtdcReturnStyleType是一个按品种返还方式类型
#########################################################################
###按所有品种
THOST_FTDC_RS_All = '1'
###按品种
THOST_FTDC_RS_ByProduct = '2'

#########################################################################
###TFtdcReturnPatternType是一个返还模式类型
#########################################################################
###按成交手数
THOST_FTDC_RP_ByVolume = '1'
###按留存手续费
THOST_FTDC_RP_ByFeeOnHand = '2'

#########################################################################
###TFtdcReturnLevelType是一个返还级别类型
#########################################################################
###级别1
THOST_FTDC_RL_Level1 = '1'
###级别2
THOST_FTDC_RL_Level2 = '2'
###级别3
THOST_FTDC_RL_Level3 = '3'
###级别4
THOST_FTDC_RL_Level4 = '4'
###级别5
THOST_FTDC_RL_Level5 = '5'
###级别6
THOST_FTDC_RL_Level6 = '6'
###级别7
THOST_FTDC_RL_Level7 = '7'
###级别8
THOST_FTDC_RL_Level8 = '8'
###级别9
THOST_FTDC_RL_Level9 = '9'

#########################################################################
###TFtdcReturnStandardType是一个返还标准类型
#########################################################################
###分阶段返还
THOST_FTDC_RSD_ByPeriod = '1'
###按某一标准
THOST_FTDC_RSD_ByStandard = '2'

#########################################################################
###TFtdcMortgageTypeType是一个质押类型类型
#########################################################################
###质出
THOST_FTDC_MT_Out = '0'
###质入
THOST_FTDC_MT_In = '1'

#########################################################################
###TFtdcInvestorSettlementParamIDType是一个投资者结算参数代码类型
#########################################################################
###质押比例
THOST_FTDC_ISPI_MortgageRatio = '4'
###保证金算法
THOST_FTDC_ISPI_MarginWay = '5'
###结算单结存是否包含质押
THOST_FTDC_ISPI_BillDeposit = '9'

#########################################################################
###TFtdcExchangeSettlementParamIDType是一个交易所结算参数代码类型
#########################################################################
###质押比例
THOST_FTDC_ESPI_MortgageRatio = '1'
###分项资金导入项
THOST_FTDC_ESPI_OtherFundItem = '2'
###分项资金入交易所出入金
THOST_FTDC_ESPI_OtherFundImport = '3'
###中金所开户最低可用金额
THOST_FTDC_ESPI_CFFEXMinPrepa = '6'
###郑商所结算方式
THOST_FTDC_ESPI_CZCESettlementType = '7'
###交易所交割手续费收取方式
THOST_FTDC_ESPI_ExchDelivFeeMode = '9'
###投资者交割手续费收取方式
THOST_FTDC_ESPI_DelivFeeMode = '0'
###郑商所组合持仓保证金收取方式
THOST_FTDC_ESPI_CZCEComMarginType = 'A'
###大商所套利保证金是否优惠
THOST_FTDC_ESPI_DceComMarginType = 'B'
###虚值期权保证金优惠比率
THOST_FTDC_ESPI_OptOutDisCountRate = 'a'
###最低保障系数
THOST_FTDC_ESPI_OptMiniGuarantee = 'b'

#########################################################################
###TFtdcSystemParamIDType是一个系统参数代码类型
#########################################################################
###投资者代码最小长度
THOST_FTDC_SPI_InvestorIDMinLength = '1'
###投资者帐号代码最小长度
THOST_FTDC_SPI_AccountIDMinLength = '2'
###投资者开户默认登录权限
THOST_FTDC_SPI_UserRightLogon = '3'
###投资者交易结算单成交汇总方式
THOST_FTDC_SPI_SettlementBillTrade = '4'
###统一开户更新交易编码方式
THOST_FTDC_SPI_TradingCode = '5'
###结算是否判断存在未复核的出入金和分项资金
THOST_FTDC_SPI_CheckFund = '6'
###是否启用手续费模板数据权限
THOST_FTDC_SPI_CommModelRight = '7'
###是否启用保证金率模板数据权限
THOST_FTDC_SPI_MarginModelRight = '9'
###是否规范用户才能激活
THOST_FTDC_SPI_IsStandardActive = '8'
###上传的交易所结算文件路径
THOST_FTDC_SPI_UploadSettlementFile = 'U'
###上报保证金监控中心文件路径
THOST_FTDC_SPI_DownloadCSRCFile = 'D'
###生成的结算单文件路径
THOST_FTDC_SPI_SettlementBillFile = 'S'
###证监会文件标识
THOST_FTDC_SPI_CSRCOthersFile = 'C'
###投资者照片路径
THOST_FTDC_SPI_InvestorPhoto = 'P'
###全结经纪公司上传文件路径
THOST_FTDC_SPI_CSRCData = 'R'
###开户密码录入方式
THOST_FTDC_SPI_InvestorPwdModel = 'I'
###投资者中金所结算文件下载路径
THOST_FTDC_SPI_CFFEXInvestorSettleFile = 'F'
###投资者代码编码方式
THOST_FTDC_SPI_InvestorIDType = 'a'
###休眠户最高权益
THOST_FTDC_SPI_FreezeMaxReMain = 'r'
###手续费相关操作实时上场开关
THOST_FTDC_SPI_IsSync = 'A'
###解除开仓权限限制
THOST_FTDC_SPI_RelieveOpenLimit = 'O'
###是否规范用户才能休眠
THOST_FTDC_SPI_IsStandardFreeze = 'X'
###郑商所是否开放所有品种套保交易
THOST_FTDC_SPI_CZCENormalProductHedge = 'B'

#########################################################################
###TFtdcTradeParamIDType是一个交易系统参数代码类型
#########################################################################
###系统加密算法
THOST_FTDC_TPID_EncryptionStandard = 'E'
###系统风险算法
THOST_FTDC_TPID_RiskMode = 'R'
###系统风险算法是否全局 0-否 1-是
THOST_FTDC_TPID_RiskModeGlobal = 'G'
###密码加密算法
THOST_FTDC_TPID_modeEncode = 'P'
###价格小数位数参数
THOST_FTDC_TPID_tickMode = 'T'
###用户最大会话数
THOST_FTDC_TPID_SingleUserSessionMaxNum = 'S'
###最大连续登录失败数
THOST_FTDC_TPID_LoginFailMaxNum = 'L'
###是否强制认证
THOST_FTDC_TPID_IsAuthForce = 'A'

#########################################################################
###TFtdcFileIDType是一个文件标识类型
#########################################################################
###资金数据
THOST_FTDC_FI_SettlementFund = 'F'
###成交数据
THOST_FTDC_FI_Trade = 'T'
###投资者持仓数据
THOST_FTDC_FI_InvestorPosition = 'P'
###投资者分项资金数据
THOST_FTDC_FI_SubEntryFund = 'O'
###组合持仓数据
THOST_FTDC_FI_CZCECombinationPos = 'C'
###上报保证金监控中心数据
THOST_FTDC_FI_CSRCData = 'R'
###郑商所平仓了结数据
THOST_FTDC_FI_CZCEClose = 'L'
###郑商所非平仓了结数据
THOST_FTDC_FI_CZCENoClose = 'N'
###持仓明细数据
THOST_FTDC_FI_PositionDtl = 'D'
###期权执行文件
THOST_FTDC_FI_OptionStrike = 'S'
###结算价比对文件
THOST_FTDC_FI_SettlementPriceComparison = 'M'
###上期所非持仓变动明细
THOST_FTDC_FI_NonTradePosChange = 'B'

#########################################################################
###TFtdcFileTypeType是一个文件上传类型类型
#########################################################################
###结算
THOST_FTDC_FUT_Settlement = '0'
###核对
THOST_FTDC_FUT_Check = '1'

#########################################################################
###TFtdcFileFormatType是一个文件格式类型
#########################################################################
###文本文件(.txt)
THOST_FTDC_FFT_Txt = '0'
###压缩文件(.zip)
THOST_FTDC_FFT_Zip = '1'
###DBF文件(.dbf)
THOST_FTDC_FFT_DBF = '2'

#########################################################################
###TFtdcFileUploadStatusType是一个文件状态类型
#########################################################################
###上传成功
THOST_FTDC_FUS_SucceedUpload = '1'
###上传失败
THOST_FTDC_FUS_FailedUpload = '2'
###导入成功
THOST_FTDC_FUS_SucceedLoad = '3'
###导入部分成功
THOST_FTDC_FUS_PartSucceedLoad = '4'
###导入失败
THOST_FTDC_FUS_FailedLoad = '5'

#########################################################################
###TFtdcTransferDirectionType是一个移仓方向类型
#########################################################################
###移出
THOST_FTDC_TD_Out = '0'
###移入
THOST_FTDC_TD_In = '1'

#########################################################################
###TFtdcSpecialCreateRuleType是一个特殊的创建规则类型
#########################################################################
###没有特殊创建规则
THOST_FTDC_SC_NoSpecialRule = '0'
###不包含春节
THOST_FTDC_SC_NoSpringFestival = '1'

#########################################################################
###TFtdcBasisPriceTypeType是一个挂牌基准价类型类型
#########################################################################
###上一合约结算价
THOST_FTDC_IPT_LastSettlement = '1'
###上一合约收盘价
THOST_FTDC_IPT_LaseClose = '2'

#########################################################################
###TFtdcProductLifePhaseType是一个产品生命周期状态类型
#########################################################################
###活跃
THOST_FTDC_PLP_Active = '1'
###不活跃
THOST_FTDC_PLP_NonActive = '2'
###注销
THOST_FTDC_PLP_Canceled = '3'

#########################################################################
###TFtdcDeliveryModeType是一个交割方式类型
#########################################################################
###现金交割
THOST_FTDC_DM_CashDeliv = '1'
###实物交割
THOST_FTDC_DM_CommodityDeliv = '2'

#########################################################################
###TFtdcFundIOTypeType是一个出入金类型类型
#########################################################################
###出入金
THOST_FTDC_FIOT_FundIO = '1'
###银期转帐
THOST_FTDC_FIOT_Transfer = '2'
###银期换汇
THOST_FTDC_FIOT_SwapCurrency = '3'

#########################################################################
###TFtdcFundTypeType是一个资金类型类型
#########################################################################
###银行存款
THOST_FTDC_FT_Deposite = '1'
###分项资金
THOST_FTDC_FT_ItemFund = '2'
###公司调整
THOST_FTDC_FT_Company = '3'
###资金内转
THOST_FTDC_FT_InnerTransfer = '4'

#########################################################################
###TFtdcFundDirectionType是一个出入金方向类型
#########################################################################
###入金
THOST_FTDC_FD_In = '1'
###出金
THOST_FTDC_FD_Out = '2'

#########################################################################
###TFtdcFundStatusType是一个资金状态类型
#########################################################################
###已录入
THOST_FTDC_FS_Record = '1'
###已复核
THOST_FTDC_FS_Check = '2'
###已冲销
THOST_FTDC_FS_Charge = '3'

#########################################################################
###TFtdcPublishStatusType是一个发布状态类型
#########################################################################
###未发布
THOST_FTDC_PS_None = '1'
###正在发布
THOST_FTDC_PS_Publishing = '2'
###已发布
THOST_FTDC_PS_Published = '3'

#########################################################################
###TFtdcSystemStatusType是一个系统状态类型
#########################################################################
###不活跃
THOST_FTDC_ES_NonActive = '1'
###启动
THOST_FTDC_ES_Startup = '2'
###交易开始初始化
THOST_FTDC_ES_Initialize = '3'
###交易完成初始化
THOST_FTDC_ES_Initialized = '4'
###收市开始
THOST_FTDC_ES_Close = '5'
###收市完成
THOST_FTDC_ES_Closed = '6'
###结算
THOST_FTDC_ES_Settlement = '7'

#########################################################################
###TFtdcSettlementStatusType是一个结算状态类型
#########################################################################
###初始
THOST_FTDC_STS_Initialize = '0'
###结算中
THOST_FTDC_STS_Settlementing = '1'
###已结算
THOST_FTDC_STS_Settlemented = '2'
###结算完成
THOST_FTDC_STS_Finished = '3'

#########################################################################
###TFtdcInvestorTypeType是一个投资者类型类型
#########################################################################
###自然人
THOST_FTDC_CT_Person = '0'
###法人
THOST_FTDC_CT_Company = '1'
###投资基金
THOST_FTDC_CT_Fund = '2'
###特殊法人
THOST_FTDC_CT_SpecialOrgan = '3'
###资管户
THOST_FTDC_CT_Asset = '4'

#########################################################################
###TFtdcBrokerTypeType是一个经纪公司类型类型
#########################################################################
###交易会员
THOST_FTDC_BT_Trade = '0'
###交易结算会员
THOST_FTDC_BT_TradeSettle = '1'

#########################################################################
###TFtdcRiskLevelType是一个风险等级类型
#########################################################################
###低风险客户
THOST_FTDC_FAS_Low = '1'
###普通客户
THOST_FTDC_FAS_Normal = '2'
###关注客户
THOST_FTDC_FAS_Focus = '3'
###风险客户
THOST_FTDC_FAS_Risk = '4'

#########################################################################
###TFtdcFeeAcceptStyleType是一个手续费收取方式类型
#########################################################################
###按交易收取
THOST_FTDC_FAS_ByTrade = '1'
###按交割收取
THOST_FTDC_FAS_ByDeliv = '2'
###不收
THOST_FTDC_FAS_None = '3'
###按指定手续费收取
THOST_FTDC_FAS_FixFee = '4'

#########################################################################
###TFtdcPasswordTypeType是一个密码类型类型
#########################################################################
###交易密码
THOST_FTDC_PWDT_Trade = '1'
###资金密码
THOST_FTDC_PWDT_Account = '2'

#########################################################################
###TFtdcAlgorithmType是一个盈亏算法类型
#########################################################################
###浮盈浮亏都计算
THOST_FTDC_AG_All = '1'
###浮盈不计，浮亏计
THOST_FTDC_AG_OnlyLost = '2'
###浮盈计，浮亏不计
THOST_FTDC_AG_OnlyGain = '3'
###浮盈浮亏都不计算
THOST_FTDC_AG_None = '4'

#########################################################################
###TFtdcIncludeCloseProfitType是一个是否包含平仓盈利类型
#########################################################################
###包含平仓盈利
THOST_FTDC_ICP_Include = '0'
###不包含平仓盈利
THOST_FTDC_ICP_NotInclude = '2'

#########################################################################
###TFtdcAllWithoutTradeType是一个是否受可提比例限制类型
#########################################################################
###无仓无成交不受可提比例限制
THOST_FTDC_AWT_Enable = '0'
###受可提比例限制
THOST_FTDC_AWT_Disable = '2'
###无仓不受可提比例限制
THOST_FTDC_AWT_NoHoldEnable = '3'

#########################################################################
###TFtdcFuturePwdFlagType是一个资金密码核对标志类型
#########################################################################
###不核对
THOST_FTDC_FPWD_UnCheck = '0'
###核对
THOST_FTDC_FPWD_Check = '1'

#########################################################################
###TFtdcTransferTypeType是一个银期转账类型类型
#########################################################################
###银行转期货
THOST_FTDC_TT_BankToFuture = '0'
###期货转银行
THOST_FTDC_TT_FutureToBank = '1'

#########################################################################
###TFtdcTransferValidFlagType是一个转账有效标志类型
#########################################################################
###无效或失败
THOST_FTDC_TVF_Invalid = '0'
###有效
THOST_FTDC_TVF_Valid = '1'
###冲正
THOST_FTDC_TVF_Reverse = '2'

#########################################################################
###TFtdcReasonType是一个事由类型
#########################################################################
###错单
THOST_FTDC_RN_CD = '0'
###资金在途
THOST_FTDC_RN_ZT = '1'
###其它
THOST_FTDC_RN_QT = '2'

#########################################################################
###TFtdcSexType是一个性别类型
#########################################################################
###未知
THOST_FTDC_SEX_None = '0'
###男
THOST_FTDC_SEX_Man = '1'
###女
THOST_FTDC_SEX_Woman = '2'

#########################################################################
###TFtdcUserTypeType是一个用户类型类型
#########################################################################
###投资者
THOST_FTDC_UT_Investor = '0'
###操作员
THOST_FTDC_UT_Operator = '1'
###管理员
THOST_FTDC_UT_SuperUser = '2'

#########################################################################
###TFtdcRateTypeType是一个费率类型类型
#########################################################################
###保证金率
THOST_FTDC_RATETYPE_MarginRate = '2'

#########################################################################
###TFtdcNoteTypeType是一个通知类型类型
#########################################################################
###交易结算单
THOST_FTDC_NOTETYPE_TradeSettleBill = '1'
###交易结算月报
THOST_FTDC_NOTETYPE_TradeSettleMonth = '2'
###追加保证金通知书
THOST_FTDC_NOTETYPE_CallMarginNotes = '3'
###强行平仓通知书
THOST_FTDC_NOTETYPE_ForceCloseNotes = '4'
###成交通知书
THOST_FTDC_NOTETYPE_TradeNotes = '5'
###交割通知书
THOST_FTDC_NOTETYPE_DelivNotes = '6'

#########################################################################
###TFtdcSettlementStyleType是一个结算单方式类型
#########################################################################
###逐日盯市
THOST_FTDC_SBS_Day = '1'
###逐笔对冲
THOST_FTDC_SBS_Volume = '2'

#########################################################################
###TFtdcSettlementBillTypeType是一个结算单类型类型
#########################################################################
###日报
THOST_FTDC_ST_Day = '0'
###月报
THOST_FTDC_ST_Month = '1'

#########################################################################
###TFtdcUserRightTypeType是一个客户权限类型类型
#########################################################################
###登录
THOST_FTDC_URT_Logon = '1'
###银期转帐
THOST_FTDC_URT_Transfer = '2'
###邮寄结算单
THOST_FTDC_URT_EMail = '3'
###传真结算单
THOST_FTDC_URT_Fax = '4'
###条件单
THOST_FTDC_URT_ConditionOrder = '5'

#########################################################################
###TFtdcMarginPriceTypeType是一个保证金价格类型类型
#########################################################################
###昨结算价
THOST_FTDC_MPT_PreSettlementPrice = '1'
###最新价
THOST_FTDC_MPT_SettlementPrice = '2'
###成交均价
THOST_FTDC_MPT_AveragePrice = '3'
###开仓价
THOST_FTDC_MPT_OpenPrice = '4'

#########################################################################
###TFtdcBillGenStatusType是一个结算单生成状态类型
#########################################################################
###未生成
THOST_FTDC_BGS_None = '0'
###生成中
THOST_FTDC_BGS_NoGenerated = '1'
###已生成
THOST_FTDC_BGS_Generated = '2'

#########################################################################
###TFtdcAlgoTypeType是一个算法类型类型
#########################################################################
###持仓处理算法
THOST_FTDC_AT_HandlePositionAlgo = '1'
###寻找保证金率算法
THOST_FTDC_AT_FindMarginRateAlgo = '2'

#########################################################################
###TFtdcHandlePositionAlgoIDType是一个持仓处理算法编号类型
#########################################################################
###基本
THOST_FTDC_HPA_Base = '1'
###大连商品交易所
THOST_FTDC_HPA_DCE = '2'
###郑州商品交易所
THOST_FTDC_HPA_CZCE = '3'

#########################################################################
###TFtdcFindMarginRateAlgoIDType是一个寻找保证金率算法编号类型
#########################################################################
###基本
THOST_FTDC_FMRA_Base = '1'
###大连商品交易所
THOST_FTDC_FMRA_DCE = '2'
###郑州商品交易所
THOST_FTDC_FMRA_CZCE = '3'

#########################################################################
###TFtdcHandleTradingAccountAlgoIDType是一个资金处理算法编号类型
#########################################################################
###基本
THOST_FTDC_HTAA_Base = '1'
###大连商品交易所
THOST_FTDC_HTAA_DCE = '2'
###郑州商品交易所
THOST_FTDC_HTAA_CZCE = '3'

#########################################################################
###TFtdcPersonTypeType是一个联系人类型类型
#########################################################################
###指定下单人
THOST_FTDC_PST_Order = '1'
###开户授权人
THOST_FTDC_PST_Open = '2'
###资金调拨人
THOST_FTDC_PST_Fund = '3'
###结算单确认人
THOST_FTDC_PST_Settlement = '4'
###法人
THOST_FTDC_PST_Company = '5'
###法人代表
THOST_FTDC_PST_Corporation = '6'
###投资者联系人
THOST_FTDC_PST_LinkMan = '7'
###分户管理资产负责人
THOST_FTDC_PST_Ledger = '8'
###托（保）管人
THOST_FTDC_PST_Trustee = '9'
###托（保）管机构法人代表
THOST_FTDC_PST_TrusteeCorporation = 'A'
###托（保）管机构开户授权人
THOST_FTDC_PST_TrusteeOpen = 'B'
###托（保）管机构联系人
THOST_FTDC_PST_TrusteeContact = 'C'
###境外自然人参考证件
THOST_FTDC_PST_ForeignerRefer = 'D'
###法人代表参考证件
THOST_FTDC_PST_CorporationRefer = 'E'

#########################################################################
###TFtdcQueryInvestorRangeType是一个查询范围类型
#########################################################################
###所有
THOST_FTDC_QIR_All = '1'
###查询分类
THOST_FTDC_QIR_Group = '2'
###单一投资者
THOST_FTDC_QIR_Single = '3'

#########################################################################
###TFtdcInvestorRiskStatusType是一个投资者风险状态类型
#########################################################################
###正常
THOST_FTDC_IRS_Normal = '1'
###警告
THOST_FTDC_IRS_Warn = '2'
###追保
THOST_FTDC_IRS_Call = '3'
###强平
THOST_FTDC_IRS_Force = '4'
###异常
THOST_FTDC_IRS_Exception = '5'

#########################################################################
###TFtdcUserEventTypeType是一个用户事件类型类型
#########################################################################
###登录
THOST_FTDC_UET_Login = '1'
###登出
THOST_FTDC_UET_Logout = '2'
###交易成功
THOST_FTDC_UET_Trading = '3'
###交易失败
THOST_FTDC_UET_TradingError = '4'
###修改密码
THOST_FTDC_UET_UpdatePassword = '5'
###客户端认证
THOST_FTDC_UET_Authenticate = '6'
###其他
THOST_FTDC_UET_Other = '9'

#########################################################################
###TFtdcCloseStyleType是一个平仓方式类型
#########################################################################
###先开先平
THOST_FTDC_ICS_Close = '0'
###先平今再平昨
THOST_FTDC_ICS_CloseToday = '1'

#########################################################################
###TFtdcCloseStyleType是一个平仓方式类型
#########################################################################
###先开先平
THOST_FTDC_ICS_Close = '0'
###先平今再平昨
THOST_FTDC_ICS_CloseToday = '1'

#########################################################################
###TFtdcStatModeType是一个统计方式类型
#########################################################################
###----
THOST_FTDC_SM_Non = '0'
###按合约统计
THOST_FTDC_SM_Instrument = '1'
###按产品统计
THOST_FTDC_SM_Product = '2'
###按投资者统计
THOST_FTDC_SM_Investor = '3'

#########################################################################
###TFtdcParkedOrderStatusType是一个预埋单状态类型
#########################################################################
###未发送
THOST_FTDC_PAOS_NotSend = '1'
###已发送
THOST_FTDC_PAOS_Send = '2'
###已删除
THOST_FTDC_PAOS_Deleted = '3'

#########################################################################
###TFtdcVirDealStatusType是一个处理状态类型
#########################################################################
###正在处理
THOST_FTDC_VDS_Dealing = '1'
###处理成功
THOST_FTDC_VDS_DeaclSucceed = '2'

#########################################################################
###TFtdcOrgSystemIDType是一个原有系统代码类型
#########################################################################
###综合交易平台
THOST_FTDC_ORGS_Standard = '0'
###易盛系统
THOST_FTDC_ORGS_ESunny = '1'
###金仕达V6系统
THOST_FTDC_ORGS_KingStarV6 = '2'

#########################################################################
###TFtdcVirTradeStatusType是一个交易状态类型
#########################################################################
###正常处理中
THOST_FTDC_VTS_NaturalDeal = '0'
###成功结束
THOST_FTDC_VTS_SucceedEnd = '1'
###失败结束
THOST_FTDC_VTS_FailedEND = '2'
###异常中
THOST_FTDC_VTS_Exception = '3'
###已人工异常处理
THOST_FTDC_VTS_ManualDeal = '4'
###通讯异常 ，请人工处理
THOST_FTDC_VTS_MesException = '5'
###系统出错，请人工处理
THOST_FTDC_VTS_SysException = '6'

#########################################################################
###TFtdcVirBankAccTypeType是一个银行帐户类型类型
#########################################################################
###存折
THOST_FTDC_VBAT_BankBook = '1'
###储蓄卡
THOST_FTDC_VBAT_BankCard = '2'
###信用卡
THOST_FTDC_VBAT_CreditCard = '3'

#########################################################################
###TFtdcVirementStatusType是一个银行帐户类型类型
#########################################################################
###正常
THOST_FTDC_VMS_Natural = '0'
###销户
THOST_FTDC_VMS_Canceled = '9'

#########################################################################
###TFtdcVirementAvailAbilityType是一个有效标志类型
#########################################################################
###未确认
THOST_FTDC_VAA_NoAvailAbility = '0'
###有效
THOST_FTDC_VAA_AvailAbility = '1'
###冲正
THOST_FTDC_VAA_Repeal = '2'

#########################################################################
###TFtdcVirementTradeCodeType是一个交易代码类型
#########################################################################
###银行发起银行资金转期货
THOST_FTDC_VTC_BankBankToFuture = '102001'
###银行发起期货资金转银行
THOST_FTDC_VTC_BankFutureToBank = '102002'
###期货发起银行资金转期货
THOST_FTDC_VTC_FutureBankToFuture = '202001'
###期货发起期货资金转银行
THOST_FTDC_VTC_FutureFutureToBank = '202002'

#########################################################################
###TFtdcAMLGenStatusType是一个Aml生成方式类型
#########################################################################
###程序生成
THOST_FTDC_GEN_Program = '0'
###人工生成
THOST_FTDC_GEN_HandWork = '1'

#########################################################################
###TFtdcCFMMCKeyKindType是一个动态密钥类别(保证金监管)类型
#########################################################################
###主动请求更新
THOST_FTDC_CFMMCKK_REQUEST = 'R'
###CFMMC自动更新
THOST_FTDC_CFMMCKK_AUTO = 'A'
###CFMMC手动更新
THOST_FTDC_CFMMCKK_MANUAL = 'M'

#########################################################################
###TFtdcCertificationTypeType是一个证件类型类型
#########################################################################
###身份证
THOST_FTDC_CFT_IDCard = '0'
###护照
THOST_FTDC_CFT_Passport = '1'
###军官证
THOST_FTDC_CFT_OfficerIDCard = '2'
###士兵证
THOST_FTDC_CFT_SoldierIDCard = '3'
###回乡证
THOST_FTDC_CFT_HomeComingCard = '4'
###户口簿
THOST_FTDC_CFT_HouseholdRegister  = '5'
###营业执照号
THOST_FTDC_CFT_LicenseNo = '6'
###组织机构代码证
THOST_FTDC_CFT_InstitutionCodeCard = '7'
###临时营业执照号
THOST_FTDC_CFT_TempLicenseNo = '8'
###民办非企业登记证书
THOST_FTDC_CFT_NoEnterpriseLicenseNo = '9'
###其他证件
THOST_FTDC_CFT_OtherCard = 'x'
###主管部门批文
THOST_FTDC_CFT_SuperDepAgree = 'a'

#########################################################################
###TFtdcFileBusinessCodeType是一个文件业务功能类型
#########################################################################
###其他
THOST_FTDC_FBC_Others = '0'
###转账交易明细对账
THOST_FTDC_FBC_TransferDetails = '1'
###客户账户状态对账
THOST_FTDC_FBC_CustAccStatus = '2'
###账户类交易明细对账
THOST_FTDC_FBC_AccountTradeDetails = '3'
###期货账户信息变更明细对账
THOST_FTDC_FBC_FutureAccountChangeInfoDetails = '4'
###客户资金台账余额明细对账
THOST_FTDC_FBC_CustMoneyDetail = '5'
###客户销户结息明细对账
THOST_FTDC_FBC_CustCancelAccountInfo = '6'
###客户资金余额对账结果
THOST_FTDC_FBC_CustMoneyResult = '7'
###其它对账异常结果文件
THOST_FTDC_FBC_OthersExceptionResult = '8'
###客户结息净额明细
THOST_FTDC_FBC_CustInterestNetMoneyDetails = '9'
###客户资金交收明细
THOST_FTDC_FBC_CustMoneySendAndReceiveDetails = 'a'
###法人存管银行资金交收汇总
THOST_FTDC_FBC_CorporationMoneyTotal = 'b'
###主体间资金交收汇总
THOST_FTDC_FBC_MainbodyMoneyTotal = 'c'
###总分平衡监管数据
THOST_FTDC_FBC_MainPartMonitorData = 'd'
###存管银行备付金余额
THOST_FTDC_FBC_PreparationMoney = 'e'
###协办存管银行资金监管数据
THOST_FTDC_FBC_BankMoneyMonitorData = 'f'

#########################################################################
###TFtdcCashExchangeCodeType是一个汇钞标志类型
#########################################################################
###汇
THOST_FTDC_CEC_Exchange = '1'
###钞
THOST_FTDC_CEC_Cash = '2'

#########################################################################
###TFtdcYesNoIndicatorType是一个是或否标识类型
#########################################################################
###是
THOST_FTDC_YNI_Yes = '0'
###否
THOST_FTDC_YNI_No = '1'

#########################################################################
###TFtdcBanlanceTypeType是一个余额类型类型
#########################################################################
###当前余额
THOST_FTDC_BLT_CurrentMoney = '0'
###可用余额
THOST_FTDC_BLT_UsableMoney = '1'
###可取余额
THOST_FTDC_BLT_FetchableMoney = '2'
###冻结余额
THOST_FTDC_BLT_FreezeMoney = '3'

#########################################################################
###TFtdcGenderType是一个性别类型
#########################################################################
###未知状态
THOST_FTDC_GD_Unknown = '0'
###男
THOST_FTDC_GD_Male = '1'
###女
THOST_FTDC_GD_Female = '2'

#########################################################################
###TFtdcFeePayFlagType是一个费用支付标志类型
#########################################################################
###由受益方支付费用
THOST_FTDC_FPF_BEN = '0'
###由发送方支付费用
THOST_FTDC_FPF_OUR = '1'
###由发送方支付发起的费用，受益方支付接受的费用
THOST_FTDC_FPF_SHA = '2'

#########################################################################
###TFtdcPassWordKeyTypeType是一个密钥类型类型
#########################################################################
###交换密钥
THOST_FTDC_PWKT_ExchangeKey = '0'
###密码密钥
THOST_FTDC_PWKT_PassWordKey = '1'
###MAC密钥
THOST_FTDC_PWKT_MACKey = '2'
###报文密钥
THOST_FTDC_PWKT_MessageKey = '3'

#########################################################################
###TFtdcFBTPassWordTypeType是一个密码类型类型
#########################################################################
###查询
THOST_FTDC_PWT_Query = '0'
###取款
THOST_FTDC_PWT_Fetch = '1'
###转帐
THOST_FTDC_PWT_Transfer = '2'
###交易
THOST_FTDC_PWT_Trade = '3'

#########################################################################
###TFtdcFBTEncryModeType是一个加密方式类型
#########################################################################
###不加密
THOST_FTDC_EM_NoEncry = '0'
###DES
THOST_FTDC_EM_DES = '1'
###3DES
THOST_FTDC_EM_3DES = '2'

#########################################################################
###TFtdcBankRepealFlagType是一个银行冲正标志类型
#########################################################################
###银行无需自动冲正
THOST_FTDC_BRF_BankNotNeedRepeal = '0'
###银行待自动冲正
THOST_FTDC_BRF_BankWaitingRepeal = '1'
###银行已自动冲正
THOST_FTDC_BRF_BankBeenRepealed = '2'

#########################################################################
###TFtdcBrokerRepealFlagType是一个期商冲正标志类型
#########################################################################
###期商无需自动冲正
THOST_FTDC_BRORF_BrokerNotNeedRepeal = '0'
###期商待自动冲正
THOST_FTDC_BRORF_BrokerWaitingRepeal = '1'
###期商已自动冲正
THOST_FTDC_BRORF_BrokerBeenRepealed = '2'

#########################################################################
###TFtdcInstitutionTypeType是一个机构类别类型
#########################################################################
###银行
THOST_FTDC_TS_Bank = '0'
###期商
THOST_FTDC_TS_Future = '1'
###券商
THOST_FTDC_TS_Store = '2'

#########################################################################
###TFtdcLastFragmentType是一个最后分片标志类型
#########################################################################
###是最后分片
THOST_FTDC_LF_Yes = '0'
###不是最后分片
THOST_FTDC_LF_No = '1'

#########################################################################
###TFtdcBankAccStatusType是一个银行账户状态类型
#########################################################################
###正常
THOST_FTDC_BAS_Normal = '0'
###冻结
THOST_FTDC_BAS_Freeze = '1'
###挂失
THOST_FTDC_BAS_ReportLoss = '2'

#########################################################################
###TFtdcMoneyAccountStatusType是一个资金账户状态类型
#########################################################################
###正常
THOST_FTDC_MAS_Normal = '0'
###销户
THOST_FTDC_MAS_Cancel = '1'

#########################################################################
###TFtdcManageStatusType是一个存管状态类型
#########################################################################
###指定存管
THOST_FTDC_MSS_Point = '0'
###预指定
THOST_FTDC_MSS_PrePoint = '1'
###撤销指定
THOST_FTDC_MSS_CancelPoint = '2'

#########################################################################
###TFtdcSystemTypeType是一个应用系统类型类型
#########################################################################
###银期转帐
THOST_FTDC_SYT_FutureBankTransfer = '0'
###银证转帐
THOST_FTDC_SYT_StockBankTransfer = '1'
###第三方存管
THOST_FTDC_SYT_TheThirdPartStore = '2'

#########################################################################
###TFtdcTxnEndFlagType是一个银期转帐划转结果标志类型
#########################################################################
###正常处理中
THOST_FTDC_TEF_NormalProcessing = '0'
###成功结束
THOST_FTDC_TEF_Success = '1'
###失败结束
THOST_FTDC_TEF_Failed = '2'
###异常中
THOST_FTDC_TEF_Abnormal = '3'
###已人工异常处理
THOST_FTDC_TEF_ManualProcessedForException = '4'
###通讯异常 ，请人工处理
THOST_FTDC_TEF_CommuFailedNeedManualProcess = '5'
###系统出错，请人工处理
THOST_FTDC_TEF_SysErrorNeedManualProcess = '6'

#########################################################################
###TFtdcProcessStatusType是一个银期转帐服务处理状态类型
#########################################################################
###未处理
THOST_FTDC_PSS_NotProcess = '0'
###开始处理
THOST_FTDC_PSS_StartProcess = '1'
###处理完成
THOST_FTDC_PSS_Finished = '2'

#########################################################################
###TFtdcCustTypeType是一个客户类型类型
#########################################################################
###自然人
THOST_FTDC_CUSTT_Person = '0'
###机构户
THOST_FTDC_CUSTT_Institution = '1'

#########################################################################
###TFtdcFBTTransferDirectionType是一个银期转帐方向类型
#########################################################################
###入金，银行转期货
THOST_FTDC_FBTTD_FromBankToFuture = '1'
###出金，期货转银行
THOST_FTDC_FBTTD_FromFutureToBank = '2'

#########################################################################
###TFtdcOpenOrDestroyType是一个开销户类别类型
#########################################################################
###开户
THOST_FTDC_OOD_Open = '1'
###销户
THOST_FTDC_OOD_Destroy = '0'

#########################################################################
###TFtdcAvailabilityFlagType是一个有效标志类型
#########################################################################
###未确认
THOST_FTDC_AVAF_Invalid = '0'
###有效
THOST_FTDC_AVAF_Valid = '1'
###冲正
THOST_FTDC_AVAF_Repeal = '2'

#########################################################################
###TFtdcOrganTypeType是一个机构类型类型
#########################################################################
###银行代理
THOST_FTDC_OT_Bank = '1'
###交易前置
THOST_FTDC_OT_Future = '2'
###银期转帐平台管理
THOST_FTDC_OT_PlateForm = '9'

#########################################################################
###TFtdcOrganLevelType是一个机构级别类型
#########################################################################
###银行总行或期商总部
THOST_FTDC_OL_HeadQuarters = '1'
###银行分中心或期货公司营业部
THOST_FTDC_OL_Branch = '2'

#########################################################################
###TFtdcProtocalIDType是一个协议类型类型
#########################################################################
###期商协议
THOST_FTDC_PID_FutureProtocal = '0'
###工行协议
THOST_FTDC_PID_ICBCProtocal = '1'
###农行协议
THOST_FTDC_PID_ABCProtocal = '2'
###中国银行协议
THOST_FTDC_PID_CBCProtocal = '3'
###建行协议
THOST_FTDC_PID_CCBProtocal = '4'
###交行协议
THOST_FTDC_PID_BOCOMProtocal = '5'
###银期转帐平台协议
THOST_FTDC_PID_FBTPlateFormProtocal = 'X'

#########################################################################
###TFtdcConnectModeType是一个套接字连接方式类型
#########################################################################
###短连接
THOST_FTDC_CM_ShortConnect = '0'
###长连接
THOST_FTDC_CM_LongConnect = '1'

#########################################################################
###TFtdcSyncModeType是一个套接字通信方式类型
#########################################################################
###异步
THOST_FTDC_SRM_ASync = '0'
###同步
THOST_FTDC_SRM_Sync = '1'

#########################################################################
###TFtdcBankAccTypeType是一个银行帐号类型类型
#########################################################################
###银行存折
THOST_FTDC_BAT_BankBook = '1'
###储蓄卡
THOST_FTDC_BAT_SavingCard = '2'
###信用卡
THOST_FTDC_BAT_CreditCard = '3'

#########################################################################
###TFtdcFutureAccTypeType是一个期货公司帐号类型类型
#########################################################################
###银行存折
THOST_FTDC_FAT_BankBook = '1'
###储蓄卡
THOST_FTDC_FAT_SavingCard = '2'
###信用卡
THOST_FTDC_FAT_CreditCard = '3'

#########################################################################
###TFtdcOrganStatusType是一个接入机构状态类型
#########################################################################
###启用
THOST_FTDC_OS_Ready = '0'
###签到
THOST_FTDC_OS_CheckIn = '1'
###签退
THOST_FTDC_OS_CheckOut = '2'
###对帐文件到达
THOST_FTDC_OS_CheckFileArrived = '3'
###对帐
THOST_FTDC_OS_CheckDetail = '4'
###日终清理
THOST_FTDC_OS_DayEndClean = '5'
###注销
THOST_FTDC_OS_Invalid = '9'

#########################################################################
###TFtdcCCBFeeModeType是一个建行收费模式类型
#########################################################################
###按金额扣收
THOST_FTDC_CCBFM_ByAmount = '1'
###按月扣收
THOST_FTDC_CCBFM_ByMonth = '2'

#########################################################################
###TFtdcCommApiTypeType是一个通讯API类型类型
#########################################################################
###客户端
THOST_FTDC_CAPIT_Client = '1'
###服务端
THOST_FTDC_CAPIT_Server = '2'
###交易系统的UserApi
THOST_FTDC_CAPIT_UserApi = '3'

#########################################################################
###TFtdcLinkStatusType是一个连接状态类型
#########################################################################
###已经连接
THOST_FTDC_LS_Connected = '1'
###没有连接
THOST_FTDC_LS_Disconnected = '2'

#########################################################################
###TFtdcPwdFlagType是一个密码核对标志类型
#########################################################################
###不核对
THOST_FTDC_BPWDF_NoCheck = '0'
###明文核对
THOST_FTDC_BPWDF_BlankCheck = '1'
###密文核对
THOST_FTDC_BPWDF_EncryptCheck = '2'

#########################################################################
###TFtdcSecuAccTypeType是一个期货帐号类型类型
#########################################################################
###资金帐号
THOST_FTDC_SAT_AccountID = '1'
###资金卡号
THOST_FTDC_SAT_CardID = '2'
###上海股东帐号
THOST_FTDC_SAT_SHStockholderID = '3'
###深圳股东帐号
THOST_FTDC_SAT_SZStockholderID = '4'

#########################################################################
###TFtdcTransferStatusType是一个转账交易状态类型
#########################################################################
###正常
THOST_FTDC_TRFS_Normal = '0'
###被冲正
THOST_FTDC_TRFS_Repealed = '1'

#########################################################################
###TFtdcSponsorTypeType是一个发起方类型
#########################################################################
###期商
THOST_FTDC_SPTYPE_Broker = '0'
###银行
THOST_FTDC_SPTYPE_Bank = '1'

#########################################################################
###TFtdcReqRspTypeType是一个请求响应类别类型
#########################################################################
###请求
THOST_FTDC_REQRSP_Request = '0'
###响应
THOST_FTDC_REQRSP_Response = '1'

#########################################################################
###TFtdcFBTUserEventTypeType是一个银期转帐用户事件类型类型
#########################################################################
###签到
THOST_FTDC_FBTUET_SignIn = '0'
###银行转期货
THOST_FTDC_FBTUET_FromBankToFuture = '1'
###期货转银行
THOST_FTDC_FBTUET_FromFutureToBank = '2'
###开户
THOST_FTDC_FBTUET_OpenAccount = '3'
###销户
THOST_FTDC_FBTUET_CancelAccount = '4'
###变更银行账户
THOST_FTDC_FBTUET_ChangeAccount = '5'
###冲正银行转期货
THOST_FTDC_FBTUET_RepealFromBankToFuture = '6'
###冲正期货转银行
THOST_FTDC_FBTUET_RepealFromFutureToBank = '7'
###查询银行账户
THOST_FTDC_FBTUET_QueryBankAccount = '8'
###查询期货账户
THOST_FTDC_FBTUET_QueryFutureAccount = '9'
###签退
THOST_FTDC_FBTUET_SignOut = 'A'
###密钥同步
THOST_FTDC_FBTUET_SyncKey = 'B'
###其他
THOST_FTDC_FBTUET_Other = 'Z'

#########################################################################
###TFtdcDBOperationType是一个记录操作类型类型
#########################################################################
###插入
THOST_FTDC_DBOP_Insert = '0'
###更新
THOST_FTDC_DBOP_Update = '1'
###删除
THOST_FTDC_DBOP_Delete = '2'

#########################################################################
###TFtdcSyncFlagType是一个同步标记类型
#########################################################################
###已同步
THOST_FTDC_SYNF_Yes = '0'
###未同步
THOST_FTDC_SYNF_No = '1'

#########################################################################
###TFtdcSyncTypeType是一个同步类型类型
#########################################################################
###一次同步
THOST_FTDC_SYNT_OneOffSync = '0'
###定时同步
THOST_FTDC_SYNT_TimerSync = '1'
###定时完全同步
THOST_FTDC_SYNT_TimerFullSync = '2'

#########################################################################
###TFtdcExDirectionType是一个换汇方向类型
#########################################################################
###结汇
THOST_FTDC_FBEDIR_Settlement = '0'
###售汇
THOST_FTDC_FBEDIR_Sale = '1'

#########################################################################
###TFtdcFBEResultFlagType是一个换汇成功标志类型
#########################################################################
###成功
THOST_FTDC_FBERES_Success = '0'
###账户余额不足
THOST_FTDC_FBERES_InsufficientBalance = '1'
###交易结果未知
THOST_FTDC_FBERES_UnknownTrading = '8'
###失败
THOST_FTDC_FBERES_Fail = 'x'

#########################################################################
###TFtdcFBEExchStatusType是一个换汇交易状态类型
#########################################################################
###正常
THOST_FTDC_FBEES_Normal = '0'
###交易重发
THOST_FTDC_FBEES_ReExchange = '1'

#########################################################################
###TFtdcFBEFileFlagType是一个换汇文件标志类型
#########################################################################
###数据包
THOST_FTDC_FBEFG_DataPackage = '0'
###文件
THOST_FTDC_FBEFG_File = '1'

#########################################################################
###TFtdcFBEAlreadyTradeType是一个换汇已交易标志类型
#########################################################################
###未交易
THOST_FTDC_FBEAT_NotTrade = '0'
###已交易
THOST_FTDC_FBEAT_Trade = '1'

#########################################################################
###TFtdcFBEUserEventTypeType是一个银期换汇用户事件类型类型
#########################################################################
###签到
THOST_FTDC_FBEUET_SignIn = '0'
###换汇
THOST_FTDC_FBEUET_Exchange = '1'
###换汇重发
THOST_FTDC_FBEUET_ReExchange = '2'
###银行账户查询
THOST_FTDC_FBEUET_QueryBankAccount = '3'
###换汇明细查询
THOST_FTDC_FBEUET_QueryExchDetial = '4'
###换汇汇总查询
THOST_FTDC_FBEUET_QueryExchSummary = '5'
###换汇汇率查询
THOST_FTDC_FBEUET_QueryExchRate = '6'
###对账文件通知
THOST_FTDC_FBEUET_CheckBankAccount = '7'
###签退
THOST_FTDC_FBEUET_SignOut = '8'
###其他
THOST_FTDC_FBEUET_Other = 'Z'

#########################################################################
###TFtdcFBEReqFlagType是一个换汇发送标志类型
#########################################################################
###未处理
THOST_FTDC_FBERF_UnProcessed = '0'
###等待发送
THOST_FTDC_FBERF_WaitSend = '1'
###发送成功
THOST_FTDC_FBERF_SendSuccess = '2'
###发送失败
THOST_FTDC_FBERF_SendFailed = '3'
###等待重发
THOST_FTDC_FBERF_WaitReSend = '4'

#########################################################################
###TFtdcNotifyClassType是一个风险通知类型类型
#########################################################################
###正常
THOST_FTDC_NC_NOERROR = '0'
###警示
THOST_FTDC_NC_Warn = '1'
###追保
THOST_FTDC_NC_Call = '2'
###强平
THOST_FTDC_NC_Force = '3'
###穿仓
THOST_FTDC_NC_CHUANCANG = '4'
###异常
THOST_FTDC_NC_Exception = '5'

#########################################################################
###TFtdcForceCloseTypeType是一个强平单类型类型
#########################################################################
###手工强平
THOST_FTDC_FCT_Manual = '0'
###单一投资者辅助强平
THOST_FTDC_FCT_Single = '1'
###批量投资者辅助强平
THOST_FTDC_FCT_Group = '2'

#########################################################################
###TFtdcRiskNotifyMethodType是一个风险通知途径类型
#########################################################################
###系统通知
THOST_FTDC_RNM_System = '0'
###短信通知
THOST_FTDC_RNM_SMS = '1'
###邮件通知
THOST_FTDC_RNM_EMail = '2'
###人工通知
THOST_FTDC_RNM_Manual = '3'

#########################################################################
###TFtdcRiskNotifyStatusType是一个风险通知状态类型
#########################################################################
###未生成
THOST_FTDC_RNS_NotGen = '0'
###已生成未发送
THOST_FTDC_RNS_Generated = '1'
###发送失败
THOST_FTDC_RNS_SendError = '2'
###已发送未接收
THOST_FTDC_RNS_SendOk = '3'
###已接收未确认
THOST_FTDC_RNS_Received = '4'
###已确认
THOST_FTDC_RNS_Confirmed = '5'

#########################################################################
###TFtdcRiskUserEventType是一个风控用户操作事件类型
#########################################################################
###导出数据
THOST_FTDC_RUE_ExportData = '0'

#########################################################################
###TFtdcConditionalOrderSortTypeType是一个条件单索引条件类型
#########################################################################
###使用最新价升序
THOST_FTDC_COST_LastPriceAsc = '0'
###使用最新价降序
THOST_FTDC_COST_LastPriceDesc = '1'
###使用卖价升序
THOST_FTDC_COST_AskPriceAsc = '2'
###使用卖价降序
THOST_FTDC_COST_AskPriceDesc = '3'
###使用买价升序
THOST_FTDC_COST_BidPriceAsc = '4'
###使用买价降序
THOST_FTDC_COST_BidPriceDesc = '5'

#########################################################################
###TFtdcSendTypeType是一个报送状态类型
#########################################################################
###未发送
THOST_FTDC_UOAST_NoSend = '0'
###已发送
THOST_FTDC_UOAST_Sended = '1'
###已生成
THOST_FTDC_UOAST_Generated = '2'
###报送失败
THOST_FTDC_UOAST_SendFail = '3'
###接收成功
THOST_FTDC_UOAST_Success = '4'
###接收失败
THOST_FTDC_UOAST_Fail = '5'
###取消报送
THOST_FTDC_UOAST_Cancel = '6'

#########################################################################
###TFtdcClientIDStatusType是一个交易编码状态类型
#########################################################################
###未申请
THOST_FTDC_UOACS_NoApply = '1'
###已提交申请
THOST_FTDC_UOACS_Submited = '2'
###已发送申请
THOST_FTDC_UOACS_Sended = '3'
###完成
THOST_FTDC_UOACS_Success = '4'
###拒绝
THOST_FTDC_UOACS_Refuse = '5'
###已撤销编码
THOST_FTDC_UOACS_Cancel = '6'

#########################################################################
###TFtdcQuestionTypeType是一个特有信息类型类型
#########################################################################
###单选
THOST_FTDC_QT_Radio = '1'
###多选
THOST_FTDC_QT_Option = '2'
###填空
THOST_FTDC_QT_Blank = '3'

#########################################################################
###TFtdcBusinessTypeType是一个业务类型类型
#########################################################################
###请求
THOST_FTDC_BT_Request = '1'
###应答
THOST_FTDC_BT_Response = '2'
###通知
THOST_FTDC_BT_Notice = '3'

#########################################################################
###TFtdcCfmmcReturnCodeType是一个监控中心返回码类型
#########################################################################
###成功
THOST_FTDC_CRC_Success = '0'
###该客户已经有流程在处理中
THOST_FTDC_CRC_Working = '1'
###监控中客户资料检查失败
THOST_FTDC_CRC_InfoFail = '2'
###监控中实名制检查失败
THOST_FTDC_CRC_IDCardFail = '3'
###其他错误
THOST_FTDC_CRC_OtherFail = '4'

#########################################################################
###TFtdcClientTypeType是一个客户类型类型
#########################################################################
###所有
THOST_FTDC_CfMMCCT_All = '0'
###个人
THOST_FTDC_CfMMCCT_Person = '1'
###单位
THOST_FTDC_CfMMCCT_Company = '2'
###其他
THOST_FTDC_CfMMCCT_Other = '3'
###特殊法人
THOST_FTDC_CfMMCCT_SpecialOrgan = '4'
###资管户
THOST_FTDC_CfMMCCT_Asset = '5'

#########################################################################
###TFtdcExchangeIDTypeType是一个交易所编号类型
#########################################################################
###上海期货交易所
THOST_FTDC_EIDT_SHFE = 'S'
###郑州商品交易所
THOST_FTDC_EIDT_CZCE = 'Z'
###大连商品交易所
THOST_FTDC_EIDT_DCE = 'D'
###中国金融期货交易所
THOST_FTDC_EIDT_CFFEX = 'J'
###上海国际能源交易中心股份有限公司
THOST_FTDC_EIDT_INE = 'N'

#########################################################################
###TFtdcExClientIDTypeType是一个交易编码类型类型
#########################################################################
###套保
THOST_FTDC_ECIDT_Hedge = '1'
###套利
THOST_FTDC_ECIDT_Arbitrage = '2'
###投机
THOST_FTDC_ECIDT_Speculation = '3'

#########################################################################
###TFtdcUpdateFlagType是一个更新状态类型
#########################################################################
###未更新
THOST_FTDC_UF_NoUpdate = '0'
###更新全部信息成功
THOST_FTDC_UF_Success = '1'
###更新全部信息失败
THOST_FTDC_UF_Fail = '2'
###更新交易编码成功
THOST_FTDC_UF_TCSuccess = '3'
###更新交易编码失败
THOST_FTDC_UF_TCFail = '4'
###已丢弃
THOST_FTDC_UF_Cancel = '5'

#########################################################################
###TFtdcApplyOperateIDType是一个申请动作类型
#########################################################################
###开户
THOST_FTDC_AOID_OpenInvestor = '1'
###修改身份信息
THOST_FTDC_AOID_ModifyIDCard = '2'
###修改一般信息
THOST_FTDC_AOID_ModifyNoIDCard = '3'
###申请交易编码
THOST_FTDC_AOID_ApplyTradingCode = '4'
###撤销交易编码
THOST_FTDC_AOID_CancelTradingCode = '5'
###销户
THOST_FTDC_AOID_CancelInvestor = '6'
###账户休眠
THOST_FTDC_AOID_FreezeAccount = '8'
###激活休眠账户
THOST_FTDC_AOID_ActiveFreezeAccount = '9'

#########################################################################
###TFtdcApplyStatusIDType是一个申请状态类型
#########################################################################
###未补全
THOST_FTDC_ASID_NoComplete = '1'
###已提交
THOST_FTDC_ASID_Submited = '2'
###已审核
THOST_FTDC_ASID_Checked = '3'
###已拒绝
THOST_FTDC_ASID_Refused = '4'
###已删除
THOST_FTDC_ASID_Deleted = '5'

#########################################################################
###TFtdcSendMethodType是一个发送方式类型
#########################################################################
###文件发送
THOST_FTDC_UOASM_ByAPI = '1'
###电子发送
THOST_FTDC_UOASM_ByFile = '2'

#########################################################################
###TFtdcEventModeType是一个操作方法类型
#########################################################################
###增加
THOST_FTDC_EvM_ADD = '1'
###修改
THOST_FTDC_EvM_UPDATE = '2'
###删除
THOST_FTDC_EvM_DELETE = '3'
###复核
THOST_FTDC_EvM_CHECK = '4'
###复制
THOST_FTDC_EvM_COPY = '5'
###注销
THOST_FTDC_EvM_CANCEL = '6'
###冲销
THOST_FTDC_EvM_Reverse = '7'

#########################################################################
###TFtdcUOAAutoSendType是一个统一开户申请自动发送类型
#########################################################################
###自动发送并接收
THOST_FTDC_UOAA_ASR = '1'
###自动发送，不自动接收
THOST_FTDC_UOAA_ASNR = '2'
###不自动发送，自动接收
THOST_FTDC_UOAA_NSAR = '3'
###不自动发送，也不自动接收
THOST_FTDC_UOAA_NSR = '4'

#########################################################################
###TFtdcFlowIDType是一个流程ID类型
#########################################################################
###投资者对应投资者组设置
THOST_FTDC_EvM_InvestorGroupFlow = '1'
###投资者手续费率设置
THOST_FTDC_EvM_InvestorRate = '2'
###投资者手续费率模板关系设置
THOST_FTDC_EvM_InvestorCommRateModel = '3'

#########################################################################
###TFtdcCheckLevelType是一个复核级别类型
#########################################################################
###零级复核
THOST_FTDC_CL_Zero = '0'
###一级复核
THOST_FTDC_CL_One = '1'
###二级复核
THOST_FTDC_CL_Two = '2'

#########################################################################
###TFtdcCheckStatusType是一个复核级别类型
#########################################################################
###未复核
THOST_FTDC_CHS_Init = '0'
###复核中
THOST_FTDC_CHS_Checking = '1'
###已复核
THOST_FTDC_CHS_Checked = '2'
###拒绝
THOST_FTDC_CHS_Refuse = '3'
###作废
THOST_FTDC_CHS_Cancel = '4'

#########################################################################
###TFtdcUsedStatusType是一个生效状态类型
#########################################################################
###未生效
THOST_FTDC_CHU_Unused = '0'
###已生效
THOST_FTDC_CHU_Used = '1'
###生效失败
THOST_FTDC_CHU_Fail = '2'

#########################################################################
###TFtdcBankAcountOriginType是一个账户来源类型
#########################################################################
###手工录入
THOST_FTDC_BAO_ByAccProperty = '0'
###银期转账
THOST_FTDC_BAO_ByFBTransfer = '1'

#########################################################################
###TFtdcMonthBillTradeSumType是一个结算单月报成交汇总方式类型
#########################################################################
###同日同合约
THOST_FTDC_MBTS_ByInstrument = '0'
###同日同合约同价格
THOST_FTDC_MBTS_ByDayInsPrc = '1'
###同合约
THOST_FTDC_MBTS_ByDayIns = '2'

#########################################################################
###TFtdcFBTTradeCodeEnumType是一个银期交易代码枚举类型
#########################################################################
###银行发起银行转期货
THOST_FTDC_FTC_BankLaunchBankToBroker = '102001'
###期货发起银行转期货
THOST_FTDC_FTC_BrokerLaunchBankToBroker = '202001'
###银行发起期货转银行
THOST_FTDC_FTC_BankLaunchBrokerToBank = '102002'
###期货发起期货转银行
THOST_FTDC_FTC_BrokerLaunchBrokerToBank = '202002'

#########################################################################
###TFtdcOTPTypeType是一个动态令牌类型类型
#########################################################################
###无动态令牌
THOST_FTDC_OTP_NONE = '0'
###时间令牌
THOST_FTDC_OTP_TOTP = '1'

#########################################################################
###TFtdcOTPStatusType是一个动态令牌状态类型
#########################################################################
###未使用
THOST_FTDC_OTPS_Unused = '0'
###已使用
THOST_FTDC_OTPS_Used = '1'
###注销
THOST_FTDC_OTPS_Disuse = '2'

#########################################################################
###TFtdcBrokerUserTypeType是一个经济公司用户类型类型
#########################################################################
###投资者
THOST_FTDC_BUT_Investor = '1'
###操作员
THOST_FTDC_BUT_BrokerUser = '2'

#########################################################################
###TFtdcFutureTypeType是一个期货类型类型
#########################################################################
###商品期货
THOST_FTDC_FUTT_Commodity = '1'
###金融期货
THOST_FTDC_FUTT_Financial = '2'

#########################################################################
###TFtdcFundEventTypeType是一个资金管理操作类型类型
#########################################################################
###转账限额
THOST_FTDC_FET_Restriction = '0'
###当日转账限额
THOST_FTDC_FET_TodayRestriction = '1'
###期商流水
THOST_FTDC_FET_Transfer = '2'
###资金冻结
THOST_FTDC_FET_Credit = '3'
###投资者可提资金比例
THOST_FTDC_FET_InvestorWithdrawAlm = '4'
###单个银行帐户转账限额
THOST_FTDC_FET_BankRestriction = '5'
###银期签约账户
THOST_FTDC_FET_Accountregister = '6'
###交易所出入金
THOST_FTDC_FET_ExchangeFundIO = '7'
###投资者出入金
THOST_FTDC_FET_InvestorFundIO = '8'

#########################################################################
###TFtdcAccountSourceTypeType是一个资金账户来源类型
#########################################################################
###银期同步
THOST_FTDC_AST_FBTransfer = '0'
###手工录入
THOST_FTDC_AST_ManualEntry = '1'

#########################################################################
###TFtdcCodeSourceTypeType是一个交易编码来源类型
#########################################################################
###统一开户(已规范)
THOST_FTDC_CST_UnifyAccount = '0'
###手工录入(未规范)
THOST_FTDC_CST_ManualEntry = '1'

#########################################################################
###TFtdcUserRangeType是一个操作员范围类型
#########################################################################
###所有
THOST_FTDC_UR_All = '0'
###单一操作员
THOST_FTDC_UR_Single = '1'

#########################################################################
###TFtdcByGroupType是一个交易统计表按客户统计方式类型
#########################################################################
###按投资者统计
THOST_FTDC_BG_Investor = '2'
###按类统计
THOST_FTDC_BG_Group = '1'

#########################################################################
###TFtdcTradeSumStatModeType是一个交易统计表按范围统计方式类型
#########################################################################
###按合约统计
THOST_FTDC_TSSM_Instrument = '1'
###按产品统计
THOST_FTDC_TSSM_Product = '2'
###按交易所统计
THOST_FTDC_TSSM_Exchange = '3'

#########################################################################
###TFtdcExprSetModeType是一个日期表达式设置类型类型
#########################################################################
###相对已有规则设置
THOST_FTDC_ESM_Relative = '1'
###典型设置
THOST_FTDC_ESM_Typical = '2'

#########################################################################
###TFtdcRateInvestorRangeType是一个投资者范围类型
#########################################################################
###公司标准
THOST_FTDC_RIR_All = '1'
###模板
THOST_FTDC_RIR_Model = '2'
###单一投资者
THOST_FTDC_RIR_Single = '3'

#########################################################################
###TFtdcSyncDataStatusType是一个主次用系统数据同步状态类型
#########################################################################
###未同步
THOST_FTDC_SDS_Initialize = '0'
###同步中
THOST_FTDC_SDS_Settlementing = '1'
###已同步
THOST_FTDC_SDS_Settlemented = '2'

#########################################################################
###TFtdcTradeSourceType是一个成交来源类型
#########################################################################
###来自交易所普通回报
THOST_FTDC_TSRC_NORMAL = '0'
###来自查询
THOST_FTDC_TSRC_QUERY = '1'

#########################################################################
###TFtdcFlexStatModeType是一个产品合约统计方式类型
#########################################################################
###产品统计
THOST_FTDC_FSM_Product = '1'
###交易所统计
THOST_FTDC_FSM_Exchange = '2'
###统计所有
THOST_FTDC_FSM_All = '3'

#########################################################################
###TFtdcByInvestorRangeType是一个投资者范围统计方式类型
#########################################################################
###属性统计
THOST_FTDC_BIR_Property = '1'
###统计所有
THOST_FTDC_BIR_All = '2'

#########################################################################
###TFtdcPropertyInvestorRangeType是一个投资者范围类型
#########################################################################
###所有
THOST_FTDC_PIR_All = '1'
###投资者属性
THOST_FTDC_PIR_Property = '2'
###单一投资者
THOST_FTDC_PIR_Single = '3'

#########################################################################
###TFtdcFileStatusType是一个文件状态类型
#########################################################################
###未生成
THOST_FTDC_FIS_NoCreate = '0'
###已生成
THOST_FTDC_FIS_Created = '1'
###生成失败
THOST_FTDC_FIS_Failed = '2'

#########################################################################
###TFtdcFileGenStyleType是一个文件生成方式类型
#########################################################################
###下发
THOST_FTDC_FGS_FileTransmit = '0'
###生成
THOST_FTDC_FGS_FileGen = '1'

#########################################################################
###TFtdcSysOperModeType是一个系统日志操作方法类型
#########################################################################
###增加
THOST_FTDC_SoM_Add = '1'
###修改
THOST_FTDC_SoM_Update = '2'
###删除
THOST_FTDC_SoM_Delete = '3'
###复制
THOST_FTDC_SoM_Copy = '4'
###激活
THOST_FTDC_SoM_AcTive = '5'
###注销
THOST_FTDC_SoM_CanCel = '6'
###重置
THOST_FTDC_SoM_ReSet = '7'

#########################################################################
###TFtdcSysOperTypeType是一个系统日志操作类型类型
#########################################################################
###修改操作员密码
THOST_FTDC_SoT_UpdatePassword = '0'
###操作员组织架构关系
THOST_FTDC_SoT_UserDepartment = '1'
###角色管理
THOST_FTDC_SoT_RoleManager = '2'
###角色功能设置
THOST_FTDC_SoT_RoleFunction = '3'
###基础参数设置
THOST_FTDC_SoT_BaseParam = '4'
###设置操作员
THOST_FTDC_SoT_SetUserID = '5'
###用户角色设置
THOST_FTDC_SoT_SetUserRole = '6'
###用户IP限制
THOST_FTDC_SoT_UserIpRestriction = '7'
###组织架构管理
THOST_FTDC_SoT_DepartmentManager = '8'
###组织架构向查询分类复制
THOST_FTDC_SoT_DepartmentCopy = '9'
###交易编码管理
THOST_FTDC_SoT_Tradingcode = 'A'
###投资者状态维护
THOST_FTDC_SoT_InvestorStatus = 'B'
###投资者权限管理
THOST_FTDC_SoT_InvestorAuthority = 'C'
###属性设置
THOST_FTDC_SoT_PropertySet = 'D'
###重置投资者密码
THOST_FTDC_SoT_ReSetInvestorPasswd = 'E'
###投资者个性信息维护
THOST_FTDC_SoT_InvestorPersonalityInfo = 'F'

#########################################################################
###TFtdcCSRCDataQueyTypeType是一个上报数据查询类型类型
#########################################################################
###查询当前交易日报送的数据
THOST_FTDC_CSRCQ_Current = '0'
###查询历史报送的代理经纪公司的数据
THOST_FTDC_CSRCQ_History = '1'

#########################################################################
###TFtdcFreezeStatusType是一个休眠状态类型
#########################################################################
###活跃
THOST_FTDC_FRS_Normal = '1'
###休眠
THOST_FTDC_FRS_Freeze = '0'

#########################################################################
###TFtdcStandardStatusType是一个规范状态类型
#########################################################################
###已规范
THOST_FTDC_STST_Standard = '0'
###未规范
THOST_FTDC_STST_NonStandard = '1'

#########################################################################
###TFtdcRightParamTypeType是一个配置类型类型
#########################################################################
###休眠户
THOST_FTDC_RPT_Freeze = '1'
###激活休眠户
THOST_FTDC_RPT_FreezeActive = '2'
###开仓权限限制
THOST_FTDC_RPT_OpenLimit = '3'
###解除开仓权限限制
THOST_FTDC_RPT_RelieveOpenLimit = '4'

#########################################################################
###TFtdcDataStatusType是一个反洗钱审核表数据状态类型
#########################################################################
###正常
THOST_FTDC_AMLDS_Normal = '0'
###已删除
THOST_FTDC_AMLDS_Deleted = '1'

#########################################################################
###TFtdcAMLCheckStatusType是一个审核状态类型
#########################################################################
###未复核
THOST_FTDC_AMLCHS_Init = '0'
###复核中
THOST_FTDC_AMLCHS_Checking = '1'
###已复核
THOST_FTDC_AMLCHS_Checked = '2'
###拒绝上报
THOST_FTDC_AMLCHS_RefuseReport = '3'

#########################################################################
###TFtdcAmlDateTypeType是一个日期类型类型
#########################################################################
###检查日期
THOST_FTDC_AMLDT_DrawDay = '0'
###发生日期
THOST_FTDC_AMLDT_TouchDay = '1'

#########################################################################
###TFtdcAmlCheckLevelType是一个审核级别类型
#########################################################################
###零级审核
THOST_FTDC_AMLCL_CheckLevel0 = '0'
###一级审核
THOST_FTDC_AMLCL_CheckLevel1 = '1'
###二级审核
THOST_FTDC_AMLCL_CheckLevel2 = '2'
###三级审核
THOST_FTDC_AMLCL_CheckLevel3 = '3'

#########################################################################
###TFtdcExportFileTypeType是一个导出文件类型类型
#########################################################################
###CSV
THOST_FTDC_EFT_CSV = '0'
###Excel
THOST_FTDC_EFT_EXCEL = '1'
###DBF
THOST_FTDC_EFT_DBF = '2'

#########################################################################
###TFtdcSettleManagerTypeType是一个结算配置类型类型
#########################################################################
###结算前准备
THOST_FTDC_SMT_Before = '1'
###结算
THOST_FTDC_SMT_Settlement = '2'
###结算后核对
THOST_FTDC_SMT_After = '3'
###结算后处理
THOST_FTDC_SMT_Settlemented = '4'

#########################################################################
###TFtdcSettleManagerLevelType是一个结算配置等级类型
#########################################################################
###必要
THOST_FTDC_SML_Must = '1'
###警告
THOST_FTDC_SML_Alarm = '2'
###提示
THOST_FTDC_SML_Prompt = '3'
###不检查
THOST_FTDC_SML_Ignore = '4'

#########################################################################
###TFtdcSettleManagerGroupType是一个模块分组类型
#########################################################################
###交易所核对
THOST_FTDC_SMG_Exhcange = '1'
###内部核对
THOST_FTDC_SMG_ASP = '2'
###上报数据核对
THOST_FTDC_SMG_CSRC = '3'

#########################################################################
###TFtdcLimitUseTypeType是一个保值额度使用类型类型
#########################################################################
###可重复使用
THOST_FTDC_LUT_Repeatable = '1'
###不可重复使用
THOST_FTDC_LUT_Unrepeatable = '2'

#########################################################################
###TFtdcDataResourceType是一个数据来源类型
#########################################################################
###本系统
THOST_FTDC_DAR_Settle = '1'
###交易所
THOST_FTDC_DAR_Exchange = '2'
###报送数据
THOST_FTDC_DAR_CSRC = '3'

#########################################################################
###TFtdcMarginTypeType是一个保证金类型类型
#########################################################################
###交易所保证金率
THOST_FTDC_MGT_ExchMarginRate = '0'
###投资者保证金率
THOST_FTDC_MGT_InstrMarginRate = '1'
###投资者交易保证金率
THOST_FTDC_MGT_InstrMarginRateTrade = '2'

#########################################################################
###TFtdcActiveTypeType是一个生效类型类型
#########################################################################
###仅当日生效
THOST_FTDC_ACT_Intraday = '1'
###长期生效
THOST_FTDC_ACT_Long = '2'

#########################################################################
###TFtdcMarginRateTypeType是一个冲突保证金率类型类型
#########################################################################
###交易所保证金率
THOST_FTDC_MRT_Exchange = '1'
###投资者保证金率
THOST_FTDC_MRT_Investor = '2'
###投资者交易保证金率
THOST_FTDC_MRT_InvestorTrade = '3'

#########################################################################
###TFtdcBackUpStatusType是一个备份数据状态类型
#########################################################################
###未生成备份数据
THOST_FTDC_BUS_UnBak = '0'
###备份数据生成中
THOST_FTDC_BUS_BakUp = '1'
###已生成备份数据
THOST_FTDC_BUS_BakUped = '2'
###备份数据失败
THOST_FTDC_BUS_BakFail = '3'

#########################################################################
###TFtdcInitSettlementType是一个结算初始化状态类型
#########################################################################
###结算初始化未开始
THOST_FTDC_SIS_UnInitialize = '0'
###结算初始化中
THOST_FTDC_SIS_Initialize = '1'
###结算初始化完成
THOST_FTDC_SIS_Initialized = '2'

#########################################################################
###TFtdcReportStatusType是一个报表数据生成状态类型
#########################################################################
###未生成报表数据
THOST_FTDC_SRS_NoCreate = '0'
###报表数据生成中
THOST_FTDC_SRS_Create = '1'
###已生成报表数据
THOST_FTDC_SRS_Created = '2'
###生成报表数据失败
THOST_FTDC_SRS_CreateFail = '3'

#########################################################################
###TFtdcSaveStatusType是一个数据归档状态类型
#########################################################################
###归档未完成
THOST_FTDC_SSS_UnSaveData = '0'
###归档完成
THOST_FTDC_SSS_SaveDatad = '1'

#########################################################################
###TFtdcSettArchiveStatusType是一个结算确认数据归档状态类型
#########################################################################
###未归档数据
THOST_FTDC_SAS_UnArchived = '0'
###数据归档中
THOST_FTDC_SAS_Archiving = '1'
###已归档数据
THOST_FTDC_SAS_Archived = '2'
###归档数据失败
THOST_FTDC_SAS_ArchiveFail = '3'

#########################################################################
###TFtdcCTPTypeType是一个CTP交易系统类型类型
#########################################################################
###未知类型
THOST_FTDC_CTPT_Unkown = '0'
###主中心
THOST_FTDC_CTPT_MainCenter = '1'
###备中心
THOST_FTDC_CTPT_BackUp = '2'

#########################################################################
###TFtdcCloseDealTypeType是一个平仓处理类型类型
#########################################################################
###正常
THOST_FTDC_CDT_Normal = '0'
###投机平仓优先
THOST_FTDC_CDT_SpecFirst = '1'

#########################################################################
###TFtdcMortgageFundUseRangeType是一个货币质押资金可用范围类型
#########################################################################
###不能使用
THOST_FTDC_MFUR_None = '0'
###用于保证金
THOST_FTDC_MFUR_Margin = '1'
###用于手续费、盈亏、保证金
THOST_FTDC_MFUR_All = '2'

#########################################################################
###TFtdcSpecProductTypeType是一个特殊产品类型类型
#########################################################################
###郑商所套保产品
THOST_FTDC_SPT_CzceHedge = '1'
###货币质押产品
THOST_FTDC_SPT_IneForeignCurrency = '2'
###大连短线开平仓产品
THOST_FTDC_SPT_DceOpenClose = '3'

#########################################################################
###TFtdcFundMortgageTypeType是一个货币质押类型类型
#########################################################################
###质押
THOST_FTDC_FMT_Mortgage = '1'
###解质
THOST_FTDC_FMT_Redemption = '2'

#########################################################################
###TFtdcAccountSettlementParamIDType是一个投资者账户结算参数代码类型
#########################################################################
###基础保证金
THOST_FTDC_ASPI_BaseMargin = '1'
###最低权益标准
THOST_FTDC_ASPI_LowestInterest = '2'

#########################################################################
###TFtdcFundMortDirectionType是一个货币质押方向类型
#########################################################################
###货币质入
THOST_FTDC_FMD_In = '1'
###货币质出
THOST_FTDC_FMD_Out = '2'

#########################################################################
###TFtdcBusinessClassType是一个换汇类别类型
#########################################################################
###盈利
THOST_FTDC_BT_Profit = '0'
###亏损
THOST_FTDC_BT_Loss = '1'
###其他
THOST_FTDC_BT_Other = 'Z'

#########################################################################
###TFtdcSwapSourceTypeType是一个换汇数据来源类型
#########################################################################
###手工
THOST_FTDC_SST_Manual = '0'
###自动生成
THOST_FTDC_SST_Automatic = '1'

#########################################################################
###TFtdcCurrExDirectionType是一个换汇类型类型
#########################################################################
###结汇
THOST_FTDC_CED_Settlement = '0'
###售汇
THOST_FTDC_CED_Sale = '1'

#########################################################################
###TFtdcCurrencySwapStatusType是一个申请状态类型
#########################################################################
###已录入
THOST_FTDC_CSS_Entry = '1'
###已审核
THOST_FTDC_CSS_Approve = '2'
###已拒绝
THOST_FTDC_CSS_Refuse = '3'
###已撤销
THOST_FTDC_CSS_Revoke = '4'
###已发送
THOST_FTDC_CSS_Send = '5'
###换汇成功
THOST_FTDC_CSS_Success = '6'
###换汇失败
THOST_FTDC_CSS_Failure = '7'

#########################################################################
###TFtdcReqFlagType是一个换汇发送标志类型
#########################################################################
###未发送
THOST_FTDC_REQF_NoSend = '0'
###发送成功
THOST_FTDC_REQF_SendSuccess = '1'
###发送失败
THOST_FTDC_REQF_SendFailed = '2'
###等待重发
THOST_FTDC_REQF_WaitReSend = '3'

#########################################################################
###TFtdcResFlagType是一个换汇返回成功标志类型
#########################################################################
###成功
THOST_FTDC_RESF_Success = '0'
###账户余额不足
THOST_FTDC_RESF_InsuffiCient = '1'
###交易结果未知
THOST_FTDC_RESF_UnKnown = '8'

#########################################################################
###TFtdcExStatusType是一个修改状态类型
#########################################################################
###修改前
THOST_FTDC_EXS_Before = '0'
###修改后
THOST_FTDC_EXS_After = '1'

#########################################################################
###TFtdcClientRegionType是一个开户客户地域类型
#########################################################################
###国内客户
THOST_FTDC_CR_Domestic = '1'
###港澳台客户
THOST_FTDC_CR_GMT = '2'
###国外客户
THOST_FTDC_CR_Foreign = '3'

#########################################################################
###TFtdcHasBoardType是一个是否有董事会类型
#########################################################################
###没有
THOST_FTDC_HB_No = '0'
###有
THOST_FTDC_HB_Yes = '1'

#########################################################################
###TFtdcStartModeType是一个启动模式类型
#########################################################################
###正常
THOST_FTDC_SM_Normal = '1'
###应急
THOST_FTDC_SM_Emerge = '2'
###恢复
THOST_FTDC_SM_Restore = '3'

#########################################################################
###TFtdcTemplateTypeType是一个模型类型类型
#########################################################################
###全量
THOST_FTDC_TPT_Full = '1'
###增量
THOST_FTDC_TPT_Increment = '2'
###备份
THOST_FTDC_TPT_BackUp = '3'

#########################################################################
###TFtdcLoginModeType是一个登录模式类型
#########################################################################
###交易
THOST_FTDC_LM_Trade = '0'
###转账
THOST_FTDC_LM_Transfer = '1'

#########################################################################
###TFtdcPromptTypeType是一个日历提示类型类型
#########################################################################
###合约上下市
THOST_FTDC_CPT_Instrument = '1'
###保证金分段生效
THOST_FTDC_CPT_Margin = '2'

#########################################################################
###TFtdcHasTrusteeType是一个是否有托管人类型
#########################################################################
###有
THOST_FTDC_HT_Yes = '1'
###没有
THOST_FTDC_HT_No = '0'

#########################################################################
###TFtdcAmTypeType是一个机构类型类型
#########################################################################
###银行
THOST_FTDC_AMT_Bank = '1'
###证券公司
THOST_FTDC_AMT_Securities = '2'
###基金公司
THOST_FTDC_AMT_Fund = '3'
###保险公司
THOST_FTDC_AMT_Insurance = '4'
###信托公司
THOST_FTDC_AMT_Trust = '5'
###其他
THOST_FTDC_AMT_Other = '9'

#########################################################################
###TFtdcCSRCFundIOTypeType是一个出入金类型类型
#########################################################################
###出入金
THOST_FTDC_CFIOT_FundIO = '0'
###银期换汇
THOST_FTDC_CFIOT_SwapCurrency = '1'

#########################################################################
###TFtdcCusAccountTypeType是一个结算账户类型类型
#########################################################################
###期货结算账户
THOST_FTDC_CAT_Futures = '1'
###纯期货资管业务下的资管结算账户
THOST_FTDC_CAT_AssetmgrFuture = '2'
###综合类资管业务下的期货资管托管账户
THOST_FTDC_CAT_AssetmgrTrustee = '3'
###综合类资管业务下的资金中转账户
THOST_FTDC_CAT_AssetmgrTransfer = '4'

#########################################################################
###TFtdcLanguageTypeType是一个通知语言类型类型
#########################################################################
###中文
THOST_FTDC_LT_Chinese = '1'
###英文
THOST_FTDC_LT_English = '2'

#########################################################################
###TFtdcAssetmgrClientTypeType是一个资产管理客户类型类型
#########################################################################
###个人资管客户
THOST_FTDC_AMCT_Person = '1'
###单位资管客户
THOST_FTDC_AMCT_Organ = '2'
###特殊单位资管客户
THOST_FTDC_AMCT_SpecialOrgan = '4'

#########################################################################
###TFtdcAssetmgrTypeType是一个投资类型类型
#########################################################################
###期货类
THOST_FTDC_ASST_Futures = '3'
###综合类
THOST_FTDC_ASST_SpecialOrgan = '4'

#########################################################################
###TFtdcCheckInstrTypeType是一个合约比较类型类型
#########################################################################
###合约交易所不存在
THOST_FTDC_CIT_HasExch = '0'
###合约本系统不存在
THOST_FTDC_CIT_HasATP = '1'
###合约比较不一致
THOST_FTDC_CIT_HasDiff = '2'

#########################################################################
###TFtdcDeliveryTypeType是一个交割类型类型
#########################################################################
###手工交割
THOST_FTDC_DT_HandDeliv = '1'
###到期交割
THOST_FTDC_DT_PersonDeliv = '2'

#########################################################################
###TFtdcMaxMarginSideAlgorithmType是一个大额单边保证金算法类型
#########################################################################
###不使用大额单边保证金算法
THOST_FTDC_MMSA_NO = '0'
###使用大额单边保证金算法
THOST_FTDC_MMSA_YES = '1'

#########################################################################
###TFtdcDAClientTypeType是一个资产管理客户类型类型
#########################################################################
###自然人
THOST_FTDC_CACT_Person = '0'
###法人
THOST_FTDC_CACT_Company = '1'
###其他
THOST_FTDC_CACT_Other = '2'

#########################################################################
###TFtdcUOAAssetmgrTypeType是一个投资类型类型
#########################################################################
###期货类
THOST_FTDC_UOAAT_Futures = '1'
###综合类
THOST_FTDC_UOAAT_SpecialOrgan = '2'

#########################################################################
###TFtdcDirectionEnType是一个买卖方向类型
#########################################################################
###Buy
THOST_FTDC_DEN_Buy = '0'
###Sell
THOST_FTDC_DEN_Sell = '1'

#########################################################################
###TFtdcOffsetFlagEnType是一个开平标志类型
#########################################################################
###Position Opening
THOST_FTDC_OFEN_Open = '0'
###Position Close
THOST_FTDC_OFEN_Close = '1'
###Forced Liquidation
THOST_FTDC_OFEN_ForceClose = '2'
###Close Today
THOST_FTDC_OFEN_CloseToday = '3'
###Close Prev.
THOST_FTDC_OFEN_CloseYesterday = '4'
###Forced Reduction
THOST_FTDC_OFEN_ForceOff = '5'
###Local Forced Liquidation
THOST_FTDC_OFEN_LocalForceClose = '6'

#########################################################################
###TFtdcHedgeFlagEnType是一个投机套保标志类型
#########################################################################
###Speculation
THOST_FTDC_HFEN_Speculation = '1'
###Arbitrage
THOST_FTDC_HFEN_Arbitrage = '2'
###Hedge
THOST_FTDC_HFEN_Hedge = '3'

#########################################################################
###TFtdcFundIOTypeEnType是一个出入金类型类型
#########################################################################
###Deposit#Withdrawal
THOST_FTDC_FIOTEN_FundIO = '1'
###Bank-Futures Transfer
THOST_FTDC_FIOTEN_Transfer = '2'
###Bank-Futures FX Exchange
THOST_FTDC_FIOTEN_SwapCurrency = '3'

#########################################################################
###TFtdcFundTypeEnType是一个资金类型类型
#########################################################################
###Bank Deposit
THOST_FTDC_FTEN_Deposite = '1'
###Payment#Fee
THOST_FTDC_FTEN_ItemFund = '2'
###Brokerage Adj
THOST_FTDC_FTEN_Company = '3'
###Internal Transfer
THOST_FTDC_FTEN_InnerTransfer = '4'

#########################################################################
###TFtdcFundDirectionEnType是一个出入金方向类型
#########################################################################
###Deposit
THOST_FTDC_FDEN_In = '1'
###Withdrawal
THOST_FTDC_FDEN_Out = '2'

#########################################################################
###TFtdcFundMortDirectionEnType是一个货币质押方向类型
#########################################################################
###Pledge
THOST_FTDC_FMDEN_In = '1'
###Redemption
THOST_FTDC_FMDEN_Out = '2'

#########################################################################
###TFtdcOptionsTypeType是一个期权类型类型
#########################################################################
###看涨
THOST_FTDC_CP_CallOptions = '1'
###看跌
THOST_FTDC_CP_PutOptions = '2'

#########################################################################
###TFtdcStrikeModeType是一个执行方式类型
#########################################################################
###欧式
THOST_FTDC_STM_Continental = '0'
###美式
THOST_FTDC_STM_American = '1'
###百慕大
THOST_FTDC_STM_Bermuda = '2'

#########################################################################
###TFtdcStrikeTypeType是一个执行类型类型
#########################################################################
###自身对冲
THOST_FTDC_STT_Hedge = '0'
###匹配执行
THOST_FTDC_STT_Match = '1'

#########################################################################
###TFtdcApplyTypeType是一个中金所期权放弃执行申请类型类型
#########################################################################
###不执行数量
THOST_FTDC_APPT_NotStrikeNum = '4'

#########################################################################
###TFtdcGiveUpDataSourceType是一个放弃执行申请数据来源类型
#########################################################################
###系统生成
THOST_FTDC_GUDS_Gen = '0'
###手工添加
THOST_FTDC_GUDS_Hand = '1'

#########################################################################
###TFtdcExecResultType是一个执行结果类型
#########################################################################
###没有执行
THOST_FTDC_OER_NoExec = 'n'
###已经取消
THOST_FTDC_OER_Canceled = 'c'
###执行成功
THOST_FTDC_OER_OK = '0'
###期权持仓不够
THOST_FTDC_OER_NoPosition = '1'
###资金不够
THOST_FTDC_OER_NoDeposit = '2'
###会员不存在
THOST_FTDC_OER_NoParticipant = '3'
###客户不存在
THOST_FTDC_OER_NoClient = '4'
###合约不存在
THOST_FTDC_OER_NoInstrument = '6'
###没有执行权限
THOST_FTDC_OER_NoRight = '7'
###不合理的数量
THOST_FTDC_OER_InvalidVolume = '8'
###没有足够的历史成交
THOST_FTDC_OER_NoEnoughHistoryTrade = '9'
###未知
THOST_FTDC_OER_Unknown = 'a'

#########################################################################
###TFtdcCombinationTypeType是一个组合类型类型
#########################################################################
###期货组合
THOST_FTDC_COMBT_Future = '0'
###垂直价差BUL
THOST_FTDC_COMBT_BUL = '1'
###垂直价差BER
THOST_FTDC_COMBT_BER = '2'
###跨式组合
THOST_FTDC_COMBT_STD = '3'
###宽跨式组合
THOST_FTDC_COMBT_STG = '4'
###备兑组合
THOST_FTDC_COMBT_PRT = '5'
###时间价差组合
THOST_FTDC_COMBT_CLD = '6'

#########################################################################
###TFtdcOptionRoyaltyPriceTypeType是一个期权权利金价格类型类型
#########################################################################
###昨结算价
THOST_FTDC_ORPT_PreSettlementPrice = '1'
###开仓价
THOST_FTDC_ORPT_OpenPrice = '4'

#########################################################################
###TFtdcBalanceAlgorithmType是一个权益算法类型
#########################################################################
###不计算期权市值盈亏
THOST_FTDC_BLAG_Default = '1'
###计算期权市值亏损
THOST_FTDC_BLAG_IncludeOptValLost = '2'

#########################################################################
###TFtdcActionTypeType是一个执行类型类型
#########################################################################
###执行
THOST_FTDC_ACTP_Exec = '1'
###放弃
THOST_FTDC_ACTP_Abandon = '2'

#########################################################################
###TFtdcForQuoteStatusType是一个询价状态类型
#########################################################################
###已经提交
THOST_FTDC_FQST_Submitted = 'a'
###已经接受
THOST_FTDC_FQST_Accepted = 'b'
###已经被拒绝
THOST_FTDC_FQST_Rejected = 'c'

#########################################################################
###TFtdcValueMethodType是一个取值方式类型
#########################################################################
###按绝对值
THOST_FTDC_VM_Absolute = '0'
###按比率
THOST_FTDC_VM_Ratio = '1'

#########################################################################
###TFtdcExecOrderPositionFlagType是一个期权行权后是否保留期货头寸的标记类型
#########################################################################
###保留
THOST_FTDC_EOPF_Reserve = '0'
###不保留
THOST_FTDC_EOPF_UnReserve = '1'

#########################################################################
###TFtdcExecOrderCloseFlagType是一个期权行权后生成的头寸是否自动平仓类型
#########################################################################
###自动平仓
THOST_FTDC_EOCF_AutoClose = '0'
###免于自动平仓
THOST_FTDC_EOCF_NotToClose = '1'

#########################################################################
###TFtdcProductTypeType是一个产品类型类型
#########################################################################
###期货
THOST_FTDC_PTE_Futures = '1'
###期权
THOST_FTDC_PTE_Options = '2'

#########################################################################
###TFtdcCZCEUploadFileNameType是一个郑商所结算文件名类型
#########################################################################
###^\d{8}_zz_\d{4}
THOST_FTDC_CUFN_CUFN_O = 'O'
###^\d{8}成交表
THOST_FTDC_CUFN_CUFN_T = 'T'
###^\d{8}单腿持仓表new
THOST_FTDC_CUFN_CUFN_P = 'P'
###^\d{8}非平仓了结表
THOST_FTDC_CUFN_CUFN_N = 'N'
###^\d{8}平仓表
THOST_FTDC_CUFN_CUFN_L = 'L'
###^\d{8}资金表
THOST_FTDC_CUFN_CUFN_F = 'F'
###^\d{8}组合持仓表
THOST_FTDC_CUFN_CUFN_C = 'C'
###^\d{8}保证金参数表
THOST_FTDC_CUFN_CUFN_M = 'M'

#########################################################################
###TFtdcDCEUploadFileNameType是一个大商所结算文件名类型
#########################################################################
###^\d{8}_dl_\d{3}
THOST_FTDC_DUFN_DUFN_O = 'O'
###^\d{8}_成交表
THOST_FTDC_DUFN_DUFN_T = 'T'
###^\d{8}_持仓表
THOST_FTDC_DUFN_DUFN_P = 'P'
###^\d{8}_资金结算表
THOST_FTDC_DUFN_DUFN_F = 'F'
###^\d{8}_优惠组合持仓明细表
THOST_FTDC_DUFN_DUFN_C = 'C'
###^\d{8}_持仓明细表
THOST_FTDC_DUFN_DUFN_D = 'D'
###^\d{8}_保证金参数表
THOST_FTDC_DUFN_DUFN_M = 'M'
###^\d{8}_期权执行表
THOST_FTDC_DUFN_DUFN_S = 'S'

#########################################################################
###TFtdcSHFEUploadFileNameType是一个上期所结算文件名类型
#########################################################################
###^\d{4}_\d{8}_\d{8}_DailyFundChg
THOST_FTDC_SUFN_SUFN_O = 'O'
###^\d{4}_\d{8}_\d{8}_Trade
THOST_FTDC_SUFN_SUFN_T = 'T'
###^\d{4}_\d{8}_\d{8}_SettlementDetail
THOST_FTDC_SUFN_SUFN_P = 'P'
###^\d{4}_\d{8}_\d{8}_Capital
THOST_FTDC_SUFN_SUFN_F = 'F'

#########################################################################
###TFtdcCFFEXUploadFileNameType是一个中金所结算文件名类型
#########################################################################
###^\d{4}_SG\d{1}_\d{8}_\d{1}_Trade
THOST_FTDC_CFUFN_SUFN_T = 'T'
###^\d{4}_SG\d{1}_\d{8}_\d{1}_SettlementDetail
THOST_FTDC_CFUFN_SUFN_P = 'P'
###^\d{4}_SG\d{1}_\d{8}_\d{1}_Capital
THOST_FTDC_CFUFN_SUFN_F = 'F'
###^\d{4}_SG\d{1}_\d{8}_\d{1}_OptionExec
THOST_FTDC_CFUFN_SUFN_S = 'S'

#########################################################################
###TFtdcCombDirectionType是一个组合指令方向类型
#########################################################################
###申请组合
THOST_FTDC_CMDR_Comb = '0'
###申请拆分
THOST_FTDC_CMDR_UnComb = '1'
