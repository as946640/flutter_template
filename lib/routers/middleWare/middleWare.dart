import 'package:get/get.dart';
import 'package:yzbtkj.cn.salessecretary/routers/router.dart';
import 'package:yzbtkj.cn.salessecretary/util/JCensus.dart';

/// 当前路由名 防止 返回问题
String currentName = '';

void MiddleWare(routing) {
  print('路由监听');

  print(routing);

  // /// 是否 弹窗 底部弹窗 返回按钮
  // if (routing.isDialog == false && routing.isBottomSheet == false) {
  //   // previous 存在 离开页面
  //   if (routing.previous != "") {
  //     /// 这里会有 bug 当用户通过返回 当前的页面和上一次页面就会一致；
  //     if (routing.isBack) {
  //       print('离开' + currentName);
  //       UmSdk.pageEnd(currentName);
  //     } else {
  //       print('离开' + routing.previous);
  //       UmSdk.pageEnd(routing.previous);
  //     }
  //   }
  //
  //   //当前页面 不等于 上一个页面
  //   if (routing.current != routing.previous) {
  //     print('进入' + routing.current);
  //
  //     currentName = routing.current;
  //     UmSdk.setPage(routing.current);
  //   }
  // }

  /// 如果要这样判断,那就不能使用 ? 携带参数,因为这样 current 就会变成 /login?id=2
  print(routing.current == '/login');

  print(routing);
}
