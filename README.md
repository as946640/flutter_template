# flutter_channel

------

介绍： flutter_channel 是一个快速开发模板 基于 Getx Dio 搭建。 帮到各位的话请给一个 Star 吧。

### 目前实现了

- 路由
- 状态管理
- Dio 请求
- sh 脚本 一键多渠道打包
- TextField 封装 方便使用 
- TextFormField 的封装
- ElevatedButton 的简单封装
- fluttertoast 的 封装  toast信息提示
- 自定义 加载框
- 闪屏页面 隐私政策 提示；
- 本地存储 get_storage 的封装 方便使用
- 全局 颜色 封装  后期可以封装为 主题色里面
- 极光统计 和 极光推送 
- 极光认证 一键登录 

### Vscode 运行调试配置文件

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Flutter",
            "request": "launch",
            "type": "dart",
	          // 这里是新加的命令参数
            "args": [
                "--dart-define",
                "APP_CHANNEL=Flutter",
                "--dart-define",
                "OTHER_VAR=Dart"
            ]
        },
	      // 这里是配置多个渠道
        {
            "name": "Mi",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define",
                "APP_CHANNEL=Mi",
                "--dart-define",
                "OTHER_VAR=安卓之光"
            ]
        }
    ]
}
```



### 打包配置  

1. 生成 证书

2. ```java
   /// 这个是 需要 java jdk的 如果你没有的话 请安装 jdk
   keytool -genkey -alias alias -keyalg RSA -keysize 2048 -validity 36500 -keystore app.keystore
       
   /// 有时候我们安装了 jdk 但是，却提示 keytool 不是可运行的，我们只要去 javaJdk 的安装目录 找到 keytool 工具所在的目录执行 打开 cmd 运行就行了】
       
   keytool -genkey -alias 签名的别名 -keyalg RSA -keysize 证书长度 -validity 有效天数 -keystore 签名的文件名.keystore
   ```

3. 配置 key.properties 文件 让 flutter 打包识别到

4. ```dart
   /// 博主这边已经配置了 打包配置 所以我们只需要在 android 目录下创建 key.properties 文件
   
   ///文件内容
   # 密匙库口令
   storePassword=您的 证书密码
   # key密匙口令
   keyPassword=您的 证书密码
   # key别名
   keyAlias=证书的别名
   # key路径
   storeFile=证书的 绝对路径
   ```

5. 执行 打包

6. ```dart
   /// 打包需要 sh 环境 我们此时可以 shell 目录位置打开 git 自带的 Git Bash Here
   /// 执行命令 注意 我们需要 给予脚本文件权限 chmod u+x fapkc.sh
   
   sh build.sh
       
   /// 此时就会进行 自动脚本打包 记得配置 build.sh 渠道信息
   /// 这个多渠道打包 是 参考 https://www.cnblogs.com/ZeroFlutter/p/14653307.html 这个大佬的 我只是个分享者
   ```

7. IOS 打包

8. ```dart
   /// 执行 打包命令
   flutter build ios --dart-define=APP_CHANNEL=AppStore --dart-define=OTHER_VAR=Dart
   /// 然后自行 Xcode 上传 博主没有 mac 所以没有测试过
   ```

   

​	

