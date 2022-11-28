import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jverify/jverify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 自定义授权的 UI 界面，以下设置的图片必须添加到资源文件里，
/// android项目将图片存放至drawable文件夹下，可使用图片选择器的文件名,例如：btn_login.xml,入参为"btn_login"。
/// ios项目存放在 Assets.xcassets。

class JverifyUi {
  bool isiOS = Platform.isIOS;

  JVUIConfig uiConfig = JVUIConfig();

  /// 添加自定义的 控件 到授权界面
  List<JVCustomWidget> widgetList = [];

  JverifyUi(context) {
    init(context);
  }

  /// 初始化
  init(context) {
    // uiConfig.authBGGifPath = "main_gif";
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    //导航栏
    //uiConfig.navHidden = true;
    // uiConfig.navColor = Colors.red.value;
    uiConfig.navText = "登录";
    uiConfig.navTextColor = Colors.blue.value;
    uiConfig.navReturnImgPath = "return_bg"; //图片必须存在

    //logo
    uiConfig.logoWidth = 100;
    uiConfig.logoHeight = 80;
    //uiConfig.logoOffsetX = isiOS ? 0 : null;//(screenWidth/2 - uiConfig.logoWidth/2).toInt();
    uiConfig.logoOffsetY = 10;
    uiConfig.logoVerticalLayoutItem = JVIOSLayoutItem.ItemSuper;
    uiConfig.logoHidden = false;
    uiConfig.logoImgPath = "logo";

    //号码
    uiConfig.numberFieldWidth = 200;
    uiConfig.numberFieldHeight = 40;
    //uiConfig.numFieldOffsetX = isiOS ? 0 : null;//(screenWidth/2 - uiConfig.numberFieldWidth/2).toInt();
    uiConfig.numFieldOffsetY = isiOS ? 20 : 120;
    uiConfig.numberVerticalLayoutItem = JVIOSLayoutItem.ItemLogo;
    uiConfig.numberColor = Colors.blue.value;
    uiConfig.numberSize = 18;

    //标语
    uiConfig.sloganOffsetY = isiOS ? 20 : 160;
    uiConfig.sloganVerticalLayoutItem = JVIOSLayoutItem.ItemNumber;
    uiConfig.sloganTextColor = Colors.black.value;
    uiConfig.sloganTextSize = 15;
//        uiConfig.slogan
    //uiConfig.sloganHidden = 0;

    uiConfig.logBtnWidth = 220;
    uiConfig.logBtnHeight = 50;
    uiConfig.logBtnOffsetY = isiOS ? 20 : 230;
    uiConfig.logBtnVerticalLayoutItem = JVIOSLayoutItem.ItemSlogan;
    uiConfig.logBtnText = "登录按钮";
    uiConfig.logBtnTextColor = Colors.white.value;
    uiConfig.logBtnTextSize = 16;
    // uiConfig.loginBtnNormalImage = "login_btn_normal"; //图片必须存在
    // uiConfig.loginBtnPressedImage = "login_btn_press"; //图片必须存在
    // uiConfig.loginBtnUnableImage = "login_btn_unable"; //图片必须存在

    //没用同意隐私 提醒
    uiConfig.privacyHintToast = true;
    uiConfig.privacyOffsetX = isiOS ? 20 : 22;
    uiConfig.privacyState = false; //设置默认勾选
    uiConfig.privacyCheckboxSize = 20;
    // uiConfig.checkedImgPath = "check_image"; //选中的图片
    // uiConfig.uncheckedImgPath = "uncheck_image"; //没用选中的图片
    uiConfig.privacyCheckboxInCenter = true;

    // uiConfig.privacyOffsetY = 15; // 距离底部距离
    uiConfig.privacyVerticalLayoutItem = JVIOSLayoutItem.ItemNone;

    uiConfig.clauseName = "协议1";
    uiConfig.clauseUrl = "http://www.baidu.com";
    uiConfig.clauseBaseColor = Colors.black.value;
    uiConfig.clauseNameTwo = "协议二";
    uiConfig.clauseUrlTwo = "http://www.hao123.com";
    uiConfig.clauseColor = Colors.red.value;
    uiConfig.privacyText = ["1极", "2光", "3认", "4证"];
    uiConfig.privacyTextSize = 13;
    uiConfig.privacyCheckboxInCenter = false;
    uiConfig.privacyTextCenterGravity = true;
    uiConfig.privacyWithBookTitleMark = true;
    uiConfig.privacyCheckboxInCenter = true;
    uiConfig.authStatusBarStyle = JVIOSBarStyle.StatusBarStyleDarkContent;
    uiConfig.privacyStatusBarStyle = JVIOSBarStyle.StatusBarStyleDefault;
    uiConfig.modelTransitionStyle = JVIOSUIModalTransitionStyle.FlipHorizontal;

    uiConfig.statusBarColorWithNav = true;
    uiConfig.virtualButtonTransparent = true;

    uiConfig.privacyStatusBarColorWithNav = true;
    uiConfig.privacyVirtualButtonTransparent = true;

    uiConfig.needStartAnim = true;
    uiConfig.needCloseAnim = true;
    uiConfig.enterAnim = "activity_slide_enter_bottom";
    uiConfig.exitAnim = "activity_slide_exit_bottom";

    uiConfig.privacyNavColor = Colors.red.value;
    uiConfig.privacyNavTitleTextColor = Colors.blue.value;
    uiConfig.privacyNavTitleTextSize = 16;

    uiConfig.privacyNavTitleTitle = "ios lai le"; //only ios
    uiConfig.privacyNavTitleTitle1 = "协议11 web页标题";
    uiConfig.privacyNavTitleTitle2 = "协议22 web页标题";
    uiConfig.privacyNavReturnBtnImage = "return_bg"; //图片必须存在;

    //弹框模式
    JVPopViewConfig popViewConfig = JVPopViewConfig();
    popViewConfig.width = width.toInt();
    popViewConfig.height = (height / 1.5).toInt();
    popViewConfig.isBottom = true;

    uiConfig.popViewConfig = popViewConfig;

    final String btn_widgetId = "jv_add_custom_button"; // 标识控件 id
    JVCustomWidget buttonWidget =
        JVCustomWidget(btn_widgetId, JVCustomWidgetType.button);
    buttonWidget.title = "其他登录方式";
    buttonWidget.left = (width / 2 - 72).toInt();
    buttonWidget.top = 400;
    buttonWidget.width = 150;
    buttonWidget.height = 40;
    buttonWidget.titleColor = Colors.blue.value;
    buttonWidget.isShowUnderline = true;
    buttonWidget.textAlignment = JVTextAlignmentType.center;
    buttonWidget.backgroundColor = Colors.brown.value;

    widgetList.add(buttonWidget);

    // 添加点击事件监听  Jverify 是 单例模式
    Jverify().addClikWidgetEventListener(btn_widgetId, (eventId) {
      print("receive listener - click widget event :$eventId");
      if (btn_widgetId == eventId) {
        Jverify().dismissLoginAuthView();
      }
    });
  }
}
