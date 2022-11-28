import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yzbtkj.cn.salessecretary/provider/count.dart';
import 'package:yzbtkj.cn.salessecretary/api/login.dart';
import 'package:yzbtkj.cn.salessecretary/util/JCensus.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  /// 实例化  CountController 类
  CountController countcountController = CountController();

  // final _LoginProvider = LoginProvider();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // The application is not currently visible to the user, not responding to
      // user input, and running in the background.
      // 不可见，不可操作

      print('home 页面 不可见 不可操作');
    }
    if (state == AppLifecycleState.resumed) {
      // The application is visible and responding to user input.
      // 可见，可操作
      print('home 页面 可见 可操作');
    }
    if (state == AppLifecycleState.inactive) {
      // The application is in an inactive state and is not receiving user input.
      // 可见，不可操作
      print('home 页面 可见 不可操作');
    }
    if (state == AppLifecycleState.detached) {
      // The application is still hosted on a flutter engine but is detached from any host views.
      // 虽然还在运行，但已经没有任何存在的界面。
      print('home 页面虽然还在运行，但已经没有任何存在的界面。');
    }
  }

  @override
  void initState() {
    super.initState();

    // 页面统计
    JCensus.setPage(widget.runtimeType.toString());

    // 注册统计
    JCensus.register('phone', extra: {'phone': '18210251163'});

    // 登录统计
    JCensus.login('phone', extra: {'id': '1'});

    ///倒计时 3秒 统计 首页离开测试
    Future.delayed(Duration(minutes: 3), () {
      print('离开首页 统计测试');
      JCensus.pageEnd(widget.runtimeType.toString());
    });

    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.toNamed("/login?id=2");
              },
              child: const Text('我是首页 点我跳转登录'),
            ),
            TextButton(
              onPressed: () {
                Get.defaultDialog(
                    onConfirm: () {
                      Get.back();
                    },
                    middleText: "Dialog made in 3 lines of code");
              },
              child: const Text('点我打开 getx 的弹窗'),
            ),
            TextButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    /// 因为设置了黑夜主题，所以背景色要动态读取
                    color: Theme.of(context).bottomAppBarColor,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.wb_sunny_outlined),
                          title: const Text(
                            "白天模式",
                          ),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.wb_sunny),
                          title: const Text("黑夜模式"),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
              child: const Text('点我打开 getx 的底部弹窗'),
            ),

            // getx 的 状态管理
            /// 当你需要对更新的内容进行，精细的控制时，GetX() 可以帮助你
            GetX<CountController>(
              init: countcountController,
              builder: (controller) {
                print("count 1 rebuild");
                return Text(
                  '我是状态管理 计数器 count： ' +
                      countcountController.count.value.toString(),
                );
              },
            ),

            /// getx 简便写法 针对一个单独变量 性能 比 Getx 好 但是没有 GetBuilder好
            test(
              count: countcountController.count.value.toString(),
            ),

            /// 当你执行一个操作时，你的所有变量都会被修改，那么就使用`GetBuilder`
            /// 做得很简单，对CPU的影响最小，只是为了完成一个单一的目的
            GetBuilder<CountController>(
              init: countcountController,
              builder: (controller) {
                print("count 1 rebuild");
                return Text(
                  '我是状态管理 GetBuilder count： ' + controller.counts.toString(),
                );
              },
            ),

            TextButton(
              onPressed: () {
                countcountController.count.value++;

                setState(() {});
              },
              child: const Text('点我 增加 状态管理 count'),
            ),
            TextButton(
              onPressed: () {
                countcountController.increment();
              },
              child: const Text('点我 增加 状态管理 GetBuilder count'),
            ),

            TextButton(
              onPressed: () async {
                Map<String, dynamic> params = {"phone": 18210251163};
                final result = await login(params);

                print(result);
              },
              child: const Text('点我 发起请求 登录'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed("/comms");
              },
              child: const Text('点我 查看 input 组件'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed("/form");
              },
              child: const Text('点我 查看 form'),
            ),

            TextButton(
              onPressed: () {
                Get.toNamed("/button");
              },
              child: const Text('点我 查看 button'),
            ),

            TextButton(
              onPressed: () {
                JCensus.onEvent('eventId', extMap: {'userId': '10'});
                print('test umSDK');
              },
              child: const Text('发送 极光 自定义 统计事件'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/share');
              },
              child: const Text('极光分享'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('123123123');

    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}

class test extends StatelessWidget {
  final count;
  const test({Key? key, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("我是状态管理简单写法 计数器 count：$count");
  }
}
