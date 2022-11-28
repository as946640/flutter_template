/// 极光推送集成
///
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:yzbtkj.cn.salessecretary/util/Config.dart';

class JGPush {
  final JPush jpush = new JPush();

  Future<void> init() async {
    String? platformVersion;

    try {
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        /// 收到通知
        ///
        print("flutter onReceiveNotification: $message");
      }, onOpenNotification: (Map<String, dynamic> message) async {
        /// 用户点击推送消息
        ///
        print("flutter onOpenNotification: $message");
        print(message['extras']);
        print(message['extras']['cn.jpush.android.EXTRA']);
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      }, onReceiveNotificationAuthorization:
              (Map<String, dynamic> message) async {
        print("flutter onReceiveNotificationAuthorization: $message");
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    print('当前 app 渠道' + Config.APP_CHANNEL);

    jpush.setup(
      appKey: "21dc3d9ef2485350ffb81e26", //你自己应用的 AppKey
      channel: Config.APP_CHANNEL,
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    // Platform messages may fail, so we use a try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      print("flutter get registration id : $rid");
    });

    // 如果在异步平台
    // 消息正在传输中，我们希望放弃回复，而不是打电话
    // 设置状态以更新我们不存在的外观。
    // if (!mounted) return;
  }
}
