class Config {
  static final Config _instance = Config._interanl();

  factory Config() => _instance;

  Config._interanl() {
    init();
  }

  init() {
    print('Config 初始化');
  }

  /// 友盟 android appkey
  // static String umAndriodAppKey = '6237e3a4317aa87760a66d9e';
  // static String umIosAppKey = '623adfd1424cf47c54a83ff3';

  /// 极光参数
  static String jAppKey = '21dc3d9ef2485350ffb81e26';

  /// 渠道 参数
  static const APP_CHANNEL = String.fromEnvironment('APP_CHANNEL');
  static const OTHER_VAR = String.fromEnvironment('OTHER_VAR');

  /// 开发环境
  static const isProd = bool.fromEnvironment('dart.vm.product');

  /// api
  static String baseUrl = isProd ? '' : 'http://47.107.50.115/nnapi';
}
