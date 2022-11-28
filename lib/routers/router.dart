import 'package:get/get.dart';
import 'package:yzbtkj.cn.salessecretary/pages/MyButton/myButton.dart';
import 'package:yzbtkj.cn.salessecretary/pages/agreement/agreement.dart';
import 'package:yzbtkj.cn.salessecretary/pages/comms/index.dart';
import 'package:yzbtkj.cn.salessecretary/pages/flashScreen/flashScreen.dart';
import 'package:yzbtkj.cn.salessecretary/pages/form/index.dart';
import 'package:yzbtkj.cn.salessecretary/pages/home/home.dart';
import 'package:yzbtkj.cn.salessecretary/pages/login/login.dart';
import 'package:yzbtkj.cn.salessecretary/pages/share/index.dart';

List<GetPage<dynamic>> router = [
  GetPage(
    name: '/first',
    page: () => const FlashScreen(),
    transition: Transition.noTransition,
  ),
  GetPage(name: '/', page: () => Home()),
  GetPage(
    name: '/login',
    page: () => Login(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: '/agreement',
    page: () => const Agrenement(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: '/comms',
    page: () => Comms(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: '/form',
    page: () => MyForm(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: '/button',
    page: () => MyButton(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: '/share',
    page: () => Share(),
    transition: Transition.rightToLeft,
  ),
];
