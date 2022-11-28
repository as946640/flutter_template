import 'package:yzbtkj.cn.salessecretary/util/requets.dart';

/// 登录
login(data) {
  return Http()
      .requets('/Identity/MobileNumberLogin', method: 'post', data: data);
}
