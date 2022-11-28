import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Http {
  // 单例模式
  static final Http _instance = Http._internal();

  factory Http() => _instance;

  Http._internal() {
    init();
  }

  late Dio _dio;

  // 初始化请求配置
  init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "http://47.107.50.115/nnapi",
      connectTimeout: 5000,
    );

    _dio = Dio(baseOptions);

    /// 配置代理 方便抓包等
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.findProxy = (uri) {
    //     return "PROXY 192.168.137.1:8889";
    //   };
    // };

    /// 请求拦截
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('dio 请求拦截');
      options.headers['token'] = '1234';
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('dio 响应拦截');

      /// code 判断
      int code = response.data['code'];
      if (code != 200) {
        if (code == 401) {
          print('重定向登录页面');
        } else {
          print(response.data.message);
        }
      }

      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
  }

  /// 请求
  Future requets(
    String url, {
    String method = 'get',
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
  }) async {
    Options options = Options(method: method);
    try {
      final result = await _dio.request(url,
          data: data, queryParameters: params, options: options);
      return result;
    } on DioError catch (err) {
      print('请求出错');
      print(err);
    }
  }
}

enum Resultex { code, message, data }
