import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:user_app/data/network/api_base_url.dart';

class DioClient {
  static BaseOptions _baseOptions(String baseUrl) {
    return BaseOptions(
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );
  }

  static Dio get userDio => Dio(_baseOptions(ApiBaseUrl.json));

  static Dio get todoDio => Dio(_baseOptions(ApiBaseUrl.dummyJson))..interceptors.add(PrettyDioLogger());
}
