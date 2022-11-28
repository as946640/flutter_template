import 'package:get/get.dart';
import 'dart:async';
import 'package:yzbtkj.cn.salessecretary/api/user/index.dart';
import 'package:yzbtkj.cn.salessecretary/util/toast.dart';

///用户信息 model
class UserInfoModel extends GetxController {
  /// 用户信息
  late Map<String, dynamic> userInfo = {};

  /// 更新用户信息
  void setUserInfo(Map<String, dynamic> data) {
    userInfo = data;
    update();
  }

  /// 获取用户信息
  get getInfo => userInfo;

  /// 用户登录
  Future<void> loginUser(Map<String, dynamic> data) async {
    try {
      final result = await login(data);

      Map<String, dynamic> userInfo = result.data['data'];

      setUserInfo(userInfo);
    } catch (e) {
      Toasts.error('登录失败');
    }
  }
}
