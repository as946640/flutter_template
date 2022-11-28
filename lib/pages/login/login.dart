import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yzbtkj.cn.salessecretary/components/button/button.dart';
import 'package:yzbtkj.cn.salessecretary/components/input.dart';
import 'package:yzbtkj.cn.salessecretary/util/jverifyLogin.dart';
import 'package:yzbtkj.cn.salessecretary/util/toast.dart';
import 'package:yzbtkj.cn.salessecretary/provider/user/userInfoModel.dart';
import 'package:yzbtkj.cn.salessecretary/util/util.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final String id;

  late JverifyLogin _jverifyLogin;

  final userController = Get.put<UserInfoModel>(UserInfoModel());

  String phone = '18210251163';

  /// 一键登录
  void loginCallBack(result) {
    print('====================');
    print(result);
    int code = result['code'];
    if (code == 6000) {
    } else if (code == 6002) {
      Toasts.info('取消一键登录');
    } else {
      Toasts.info(result.message);
    }
  }

  @override
  void initState() {
    super.initState();
    // 获取路由参数
    id = Get.parameters['id'].toString();

    Future.delayed(
      Duration.zero,
      () {
        _jverifyLogin = JverifyLogin(context, loginCallBack);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('登录页面'),
            Text('我接受到上个页面的参数 id: $id'),
            GetBuilder<UserInfoModel>(builder: (user) {
              return Text('用户信息：${user.userInfo}');
            }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Input(
                onChange: (String value) {
                  loginChange(value);
                },
                type: TextInputType.number,
              ),
            ),
            Button(
              onPressed: () {
                _jverifyLogin.loginAuth();
              },
              text: '一键登录',
            ),
            Button(
              onPressed: () {
                login();
              },
              text: '手机号登录',
            )
          ],
        ),
      ),
    );
  }

  /// 登录
  login() async {
    showLoading(context);

    await userController.loginUser({'phone': phone});
    print('userController - end');
    Get.back();
  }

  loginChange(value) {
    phone = value;
  }
}
