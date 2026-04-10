import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Better than cupertino for debugPrint
import 'package:user_app/data/network/api_endpoint.dart';
import 'package:user_app/data/network/dio_client.dart';

class NetworkService {
  Future<Response> getAllUsers() async {
    try {
      Dio dioClient = DioClient.userDio;
      final response = await dioClient.get(ApiEndpoint.users);
      return response;
    } on DioException catch (e) {
      debugPrint("Dio API Error: ${e.message}");
      rethrow;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      rethrow;
    }
  }

  Future<Response> getAllTodos() async {
    try {
      // Dio dio = DioClient.todoDio;
      final response = await DioClient.todoDio.get(ApiEndpoint.todos);
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
