import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yzbtkj.cn.salessecretary/components/input.dart';

class Comms extends StatefulWidget {
  Comms({Key? key}) : super(key: key);

  @override
  State<Comms> createState() => _CommsState();
}

class _CommsState extends State<Comms> {
  var inputValue = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('封装了一些小组件'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Input(
              placeholder: '请输入',
              suffixIcon: SizedBox(
                height: 16,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('点我'),
                ),
              ),
              onChange: (String value) {
                inputValue.value = value;
                print('123' + value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Input(
              placeholder: '请输入',
              password: true,
              onChange: (String value) {
                inputValue.value = value;
                print('123' + value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Input(
              placeholder: '请输入',
              shape: 'circle',
              prefixIcon: const Icon(Icons.airplay),
              onChange: (String value) {
                inputValue.value = value;
                print('123' + value);
              },
            ),
          ),
          TextButton(
            onPressed: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
            child: Obx(() => Text('点我测试失去焦点和 value 内容输出 $inputValue')),
          )
        ],
      ),
    );
  }
}
