import 'package:yzbtkj.cn.salessecretary/util/requets.dart';

Future login(data) {
  return Http()
      .requets('/Identity/MobileNumberLogin', method: 'post', data: data);
}
