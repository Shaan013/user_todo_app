import 'package:dio/dio.dart';
import 'package:user_app/data/network/api_endpoint.dart';
import 'package:user_app/data/network/dio_client.dart';

class NetworkService {
  Future<Response> getAllUsers() async {
    DioClient dioClient = DioClient();
    try {
      Response response = await dioClient.dio.get(ApiEndpoint.users);
      print('object  : ${response.statusCode}');
      print("object : ${response.data.runtimeType}");
      return response;
    } on DioException catch (e) {
      print("Dio Error: ${e.response?.statusCode}");
      print("Message: ${e.message}");
      throw e;
    } catch (e) {
      print("API Error: $e");
      throw Exception(e);
    }
  }
}
