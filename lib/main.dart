import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yzbtkj.cn.salessecretary/routers/middleWare/middleWare.dart';
import 'package:yzbtkj.cn.salessecretary/routers/router.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      initialRoute: '/first',
      getPages: router,
      routingCallback: (routing) {
        MiddleWare(routing);
      },
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
    ),
  );
}
