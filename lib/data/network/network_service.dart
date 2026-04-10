import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Better than cupertino for debugPrint
import 'package:user_app/data/network/api_endpoint.dart';
import 'package:user_app/data/network/dio_client.dart';

class NetworkService {
  Future<Response> getAllUsers() async {
    try {
      DioClient dioClient = DioClient();
      final response = await dioClient.dio.get(ApiEndpoint.users);
      return response;
    } on DioException catch (e) {
      debugPrint("Dio API Error: ${e.message}");
      rethrow;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      rethrow;
    }
  }
}
