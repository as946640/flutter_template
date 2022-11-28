import 'package:jverify/jverify.dart';
import 'package:yzbtkj.cn.salessecretary/util/Config.dart';
import 'package:yzbtkj.cn.salessecretary/util/toast.dart';
import './JverifyUi.dart';

/// 一键登录
class JverifyLogin {
  /// 统一 key
  final String f_result_key = "result";

  /// 错误码
  final String f_code_key = "code";

  /// 回调的提示信息，统一返回 flutter 为 message
  final String f_msg_key = "message";

  /// 运营商信息
  final String f_opr_key = "operator";

  ///网络环境是否支持
  bool isSafe = false;

  /// 一键登录
  late Jverify jverify;

  /// 一键登录 UI 配置
  late JverifyUi _jverifyUi;

  /// 一键登录 回调函数
  late Function CallBack;

  JverifyLogin(context, callBack) {
    init(context);
    CallBack = callBack;
  }

  /// 初始化
  init(context) {
    jverify = Jverify();

    // 初始化 SDK 之前添加监听
    jverify.addSDKSetupCallBackListener((JVSDKSetupEvent event) {
      print("receive sdk setup call back event :${event.toMap()}");
    });

    jverify.setDebugMode(true); // 打开调试模式

    // 初始化sdk,  appKey 和 channel 只对ios设置有效
    jverify.setup(
      appKey: Config.jAppKey,
      channel: 'AppStore',
    );

    print('----------一键登录初始化');

    checkVerifyEnable();

    _jverifyUi = JverifyUi(context);
  }

  /// 判断当前网络环境是否可以发起认证
  void checkVerifyEnable() {
    jverify.checkVerifyEnable().then((map) {
      isSafe = map[f_result_key];
    });
  }

  ///预登陆
  void preLogin() {
    if (isSafe) {
      jverify.preLogin().then((map) {
        print("预取号接口回调：${map.toString()}");
        int code = map[f_code_key];
        String message = map[f_msg_key];

        if (code != 7000) {
          Toasts.error(message);
        }
      });
    } else {
      Toasts.info('当前网络环境不支持认证');
    }
  }

  ///  一键登录
  void loginAuth() {
    if (!isSafe) {
      Toasts.info('当前网络环境不支持认证');
      return;
    }

    /// 步骤 1：调用接口设置 UI
    jverify.setCustomAuthorizationView(
      true,
      _jverifyUi.uiConfig,
      landscapeConfig: _jverifyUi.uiConfig,
      widgets: _jverifyUi.widgetList,
    );

    /// 监听事件
    jverify.addLoginAuthCallBackListener((event) {
      if (CallBack != null) {
        print(event);

        CallBack({
          "code": event.code,
          "message": event.message,
          "operator": event.operator
        });
      }
    });

    /// 再，执行同步的一键登录接口
    jverify.loginAuthSyncApi(autoDismiss: true);
  }
}
