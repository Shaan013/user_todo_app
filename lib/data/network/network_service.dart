import 'package:dio/dio.dart';
import 'package:user_app/data/network/api_endpoint.dart';
import 'package:user_app/data/network/dio_client.dart';

class NetworkService {
  Future<Response> getAllUsers() async {
    DioClient dioClient = DioClient();
    Response response = await dioClient.dio.get(ApiEndpoint.users);
    return response;
  }
}
