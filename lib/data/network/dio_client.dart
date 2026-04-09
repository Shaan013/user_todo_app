import 'package:dio/dio.dart';
import 'package:dio_pretty_logger/dio_pretty_logger.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "User-Agent": "Mozilla/5.0",
          },
          baseUrl: "https://jsonplaceholder.typicode.com",
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
        ),
      ) {
    dio.interceptors.add(prettyInterceptorsWrapper);
  }
}
