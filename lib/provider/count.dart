// 计数器 最简单的方式
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CountController extends GetxController {
  final count = 0.obs;

  int counts = 0;

  void increment() {
    counts++;
    update(); // 当调用增量时，使用update()来更新用户界面上的计数器变量。
  }
}
