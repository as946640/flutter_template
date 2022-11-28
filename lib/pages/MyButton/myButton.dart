import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:yzbtkj.cn.salessecretary/components/button/button.dart';
import 'package:yzbtkj.cn.salessecretary/util/toast.dart';
import 'package:yzbtkj.cn.salessecretary/util/util.dart';
// import 'package:yzbtkj.cn.salessecretary/components/toast/index.dart';

class MyButton extends StatefulWidget {
  MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Button(
              onPressed: () {
                showLoading(context);

                Timer(const Duration(seconds: 2), () {
                  Navigator.of(context).pop();
                });
              },
              text: '显示加载框',
              icon: Icon(Icons.ac_unit_sharp),
              shape: 'circle',
              borderColor: Colors.red,
              bgc: Colors.amber,
            ),
            Button(
              onPressed: () {
                print('我是按钮');
              },
              text: '我是按钮',
              icon: Icon(Icons.ac_unit_sharp),
              shadowColor: Colors.red,
              elevation: 10,
            ),
            Button(
              onPressed: () {
                print('我是按钮');

                Toasts.success('我是成功提示哦 ');
              },
              text: '显示 tost',
              shadowColor: Colors.amberAccent,
              elevation: 2,
              borderColor: Colors.red,
              // disabled: true,
            ),
            // Toast()
          ],
        ),
      ),
    );
  }
}
