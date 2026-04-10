import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          baseUrl: "https://jsonplaceholder.typicode.com",
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
        ),
      ) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,

        responseBody: false,
        error: true,
        compact: true,
      ),
    );
  }
}
