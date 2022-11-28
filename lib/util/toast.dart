import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yzbtkj.cn.salessecretary/util/globalColor.dart';

/// Toast
class Toasts {
  static final Toasts _instance = Toasts._interanl();

  factory Toasts() => _instance;

  Toasts._interanl() {
    init();
  }

  /// FToast
  late FToast _fToast;

  init() {
    _fToast = FToast();
  }

  /// 成功提示
  static success(String msg) {
    showToast(msg, GlobalColor.success);
  }

  /// 失败提示
  static error(String msg) {
    showToast(msg, GlobalColor.error);
  }

  /// 警告提示
  static warning(String msg) {
    showToast(msg, GlobalColor.warning);
  }

  /// 辅助 info 提示
  static info(String msg) {
    showToast(msg, GlobalColor.info);
  }

  /// 自定义提示
  showLoading(
    BuildContext context,
    Widget child,
  ) {
    _fToast.init(context);
    _fToast.showToast(
      child: child,
      gravity: ToastGravity.CENTER,
    );
  }
}

showToast(String msg, Color color) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
    webPosition: 'top',
  );
}
