import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yzbtkj.cn.salessecretary/components/button/button.dart';
import 'package:yzbtkj.cn.salessecretary/pages/flashScreen/PriacyView.dart';
import 'package:yzbtkj.cn.salessecretary/util/JCensus.dart';
import 'package:yzbtkj.cn.salessecretary/util/storage.dart';
import 'package:yzbtkj.cn.salessecretary/util/util.dart';

import '../../util/JGPush.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  final Storage _storage = Storage();

  final String _data = "亲爱的用户，感谢您信任并使用\n" +
      " \n" +
      "xxxx十分重视用户权利及隐私政策并严格按照相关法律法规的要求，对《用户协议》和《隐私政策》进行了更新,特向您说明如下：\n" +
      "1. 为向您提供更优质的服务，我们会收集、使用必要的信息，并会采取业界先进的安全措施保护您的信息安全；\n" +
      "2. 基于您的明示授权，我们可能会获取设备号信息、包括：设备型号、操作系统版本、设备设置、设备标识符、MAC（媒体访问控制）地址、IMEI（移动设备国际身份码）、广告标识符（“IDFA”与“IDFV”）、集成电路卡识别码（“ICCD”）、软件安装列表。我们将使用三方产品（友盟、极光等）统计使用我们产品的设备数量并进行设备机型数据分析与设备适配性分析。（以保障您的账号与交易安全），且您有权拒绝或取消授权；\n" +
      "3. 未经您同意，我们不会从第三方获取、共享或向其提供您的信息；\n" +
      "4. 您可以查询、更正、删除您的个人信息，我们也提供账户注销的渠道。\n" +
      " \n" +
      "请您仔细阅读并充分理解相关条款，其中重点条款已为您黑体加粗标识，方便您了解自己的权利。如您点击“同意”，即表示您已仔细阅读并同意本《用户协议》及《隐私政策》，将尽全力保障您的合法权益并继续为您提供优质的产品和服务。如您点击“不同意”，将可能导致您无法继续使用我们的产品和服务。\n";

  /// 文本点击
  void textTap(String text) {
    print(text);
    if (text == '《用户协议》') {
      Get.toNamed('/agreement?url=https://zt.yzbtkj.cn/deal.html&title=用户协议');
    } else {
      Get.toNamed(
          '/agreement?url=https://www.yzbtkj.cn/privacy.html&title=隐私政策');
    }
  }

  ///首次启动
  Future getFirst() async {
    try {
      final bool isFirst = _storage.getStorageItem('isFirst') ?? false;

      // 首次启动
      if (!isFirst) {
        Future.delayed(Duration.zero, () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return WillPopScope(
                  onWillPop: () async => false,
                  child: Center(
                    child: Container(
                      width: ScreenUtil().setWidth(300),
                      height: ScreenUtil().setHeight(400),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            PrivacyView(
                              data: _data,
                              keys: const ['《用户协议》', '《隐私政策》'],
                              onTapCallback: textTap,
                            ),
                            SizedBox(
                              width: 300,
                              child: Button(
                                onPressed: () {
                                  agree();
                                },
                                text: '同意并继续',
                                bgc: Colors.red,
                                shape: 'circle',
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                exitApp();
                              },
                              child: const Text(
                                '拒绝并退出',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
      } else {
        /// 延迟跳转 不然会报错
        initApp();
        Future.delayed(Duration.zero, () => Get.offNamed('/'));
      }
    } catch (e) {
      print(e);
    }
  }

  /// 用户同意
  void agree() {
    _storage.storageSetItem('isFirst', true);

    initApp();

    Get.offNamed('/');
  }

  // 初始化配置
  void initApp() {
    // 极光推送
    // JGPush().init();
    // // // 友盟统计
    // JCensus();
  }

  @override
  initState() {
    super.initState();
    getFirst();
  }

  @override
  Widget build(BuildContext context) {
    //设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于360dp * 690dp的屏幕
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/LaunchImage.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
