import 'package:janalytics/janalytics.dart';
import './Config.dart';

enum Currencys { CNY, USD }

/// JG Sdk
class JCensus {
  static final JCensus _instance = JCensus._interanl();

  factory JCensus() => _instance;

  JCensus._interanl() {
    init();
  }

  /// 初始化
  init() async {
    print('极光 统计初始化------------');

    Janalytics().setup(
      appKey: Config.jAppKey,
      channel: Config.APP_CHANNEL,
    );

    Janalytics().setDebugMode(true); // 打开调试模式
  }

  /// 进入页面
  static setPage(String pageName) {
    Janalytics().onPageStart(pageName);
  }

  /// 离开页面
  static pageEnd(String pageName) {
    Janalytics().onPageEnd(pageName);
  }

  /// 用户注册
  static register(String registerMethod, {Map<String, String>? extra}) {
    Janalytics().onRegisterEvent(
        registerMethod, // 注册方式
        true, // 是否注册成功
        extMap: extra);
  }

  /// 用户登录
  static login(String loginMethod, {Map<String, String>? extra}) {
    Janalytics().onLoginEvent(
        loginMethod, // 注册方式
        true, // 是否注册成功
        extMap: extra);
  }

  /// 自定义事件统计
  static onEvent(String eventId, {Map<String, String>? extMap}) {
    Janalytics().onCountEvent(eventId, extMap: extMap);
  }

  /// 购买事件
  /// String purchaseGoodsid  商品ID
  /// String purchaseGoodsName, 商品名称
  /// double purchasePrice, 商品价格
  /// bool purchaseSuccess, 是否购买成功
  /// Currency purchaseCurrency,  货币类型
  /// String purchaseGoodsType, 商品类型
  /// int purchaseGoodsCount, 商品数量
  /// {Map<String, String>? extMap} 额外参数
  static void onPurchaseEvent(
      String purchaseGoodsid,
      String purchaseGoodsName,
      double purchasePrice,
      bool purchaseSuccess,
      Currency purchaseCurrency,
      String purchaseGoodsType,
      int purchaseGoodsCount,
      {Map<String, String>? extMap}) {
    Janalytics().onPurchaseEvent(
        purchaseGoodsid,
        //商品ID
        purchaseGoodsName,
        //商品名称
        purchasePrice,
        //商品价格
        purchaseSuccess,
        //商品购买是否成功
        purchaseCurrency,
        //货币类型
        purchaseGoodsType,
        //商品类型
        purchaseGoodsCount,
        // 商品数量
        extMap: extMap);
  }

  /// 其他事件 请自行注册
}
