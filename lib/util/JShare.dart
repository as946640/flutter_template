import 'package:jshare_flutter_plugin/jshare_flutter_plugin.dart';
import 'package:yzbtkj.cn.salessecretary/util/Config.dart';
import 'dart:async';

class Jshare {
  List<Map<String, dynamic>> platfromList = [
    {
      "name": "微信",
      "icon": "jiguang_socialize_wechat.png",
      "platform": JSharePlatform.wechatSession
    },
    {
      "name": "朋友圈",
      "icon": "jiguang_socialize_wxtimeLine.png",
      "platform": JSharePlatform.wechatTimeLine
    },
    {
      "name": "微信收藏",
      "icon": "jiguang_socialize_wxfavorite.png",
      "platform": JSharePlatform.wechatFavourite
    },
    {
      "name": "QQ",
      "icon": "jiguang_socialize_qq.png",
      "platform": JSharePlatform.qq
    },
    {
      "name": "QQ空间",
      "icon": "jiguang_socialize_qzone.png",
      "platform": JSharePlatform.qZone
    },
    {
      "name": "微博",
      "icon": "jiguang_socialize_sina.png",
      "platform": JSharePlatform.sinaWeibo
    }
  ];

  String _resultString = "显示结果";
  JShareType? shareType;

  late JShare _JShare;

  Future<void> initPlatformState() async {
    _JShare = JShare();
    JShareConfig shareConfig = JShareConfig(appKey: Config.jAppKey);

    /// 填写自己应用的极光 AppKey
    shareConfig.channel = Config.APP_CHANNEL;
    shareConfig.isDebug = true;
    shareConfig.isAdvertisinId = true;
    shareConfig.isProduction = true;

    shareConfig.weChatAppId = "wxc40e16f3ba6ebabc";
    shareConfig.weChatAppSecret = "dcad950cd0633a27e353477c4ec12e7a";

    shareConfig.qqAppId = "100424468";
    shareConfig.qqAppKey = "glFYjkHQGSOCJHMC";

    shareConfig.sinaWeiboAppKey = "374535501";
    shareConfig.sinaWeiboAppSecret = "baccd12c166f1df96736b51ffbf600a2";
    shareConfig.sinaRedirectUri = "https://www.jiguang.cn";

    _JShare.setup(config: shareConfig);
  }
}
