import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yzbtkj.cn.salessecretary/components/loading/index.dart';

/// 退出 App IOS | Andriod
void exitApp() async {
  if (Platform.isIOS) {
    exit(0);
  } else {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}

/// 显示 加载框
void showLoading(
  context, {
  String text = '加载中···',
  Widget? icon,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return WillPopScope(
          child: Loading(text: text), onWillPop: () async => false);
    },
  );
}
