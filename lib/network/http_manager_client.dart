import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

/// 网络引擎类，目前采用retrofit架构，也支持get、post直接请求
class HttpManagerClient {
  static late String clientBaseUrl;
  static late Dio clientDio;

  /// 初始化网络参数
  static init({
    required String baseUrl,
    List<InterceptorsWrapper>? interceptorsWrapperList,
    String? proxyIpAddress,
    Map<String, String>? header,
    bool? isPrintLog,
  }) {
    clientBaseUrl = baseUrl;
    clientDio = Dio();

    /// 拦截器
    interceptorsWrapperList?.forEach((element) {
      clientDio.interceptors.add(element);
    });

    /// 配置代理
    if (!TextUtil.isEmpty(proxyIpAddress)) {
      (clientDio.httpClientAdapter as DefaultHttpClientAdapter)
          .onHttpClientCreate = (client) {
        client.findProxy = (ulr) {
          return "PROXY $proxyIpAddress";
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return null;
      };
    }
  }

  /// 支持 自定义 get/post 方法
}
