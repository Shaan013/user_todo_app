import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Better than cupertino for debugPrint
import 'package:user_app/data/network/api_endpoint.dart';

import '../service/get_it_services.dart';

class NetworkService {

  static void _dioExceptionSwitch(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
      // debugPrint("No internet connection. Showing cached data.");
        throw Exception("No internet connection. Showing cached data.");
      case DioExceptionType.connectionTimeout:
        debugPrint("Connection Time out. Please try again");
        throw Exception("Connection Time out. Please try again");
    // break;
      case DioExceptionType.receiveTimeout:
        debugPrint("Request timed out. Please try again.");
        throw Exception("Request timed out. Please try again.");
    // break;
      case DioExceptionType.badResponse:
        debugPrint(
          "Server error (${e.response?.statusCode}).  Please try again.",
        );
        throw Exception(
          "Server error (${e.response?.statusCode}).  Please try again.",
        );
    // break;
      default:
        throw Exception("Something went wrong. Please try again.");
    // debugPrint("Something went wrong. Please try again.");
    }
  }


  Future<Response> getAllUsers() async {
    try {
      Dio dioClient = sl<Dio>(instanceName: "user_dio");
      final response = await dioClient.get(ApiEndpoint.users);
      return response;
    } on DioException catch (e) {
      debugPrint("Dio API Error: ${e.message}");
      _dioExceptionSwitch(e);
      rethrow;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      rethrow;
    }
  }

  Future<Response> getAllTodos() async {
    try {
      // Dio dio = DioClient.todoDio;
      final Dio dio = sl<Dio>(instanceName: "todo_dio");
      final response = await dio.get(ApiEndpoint.todos);
      return response;
    } on DioException catch (e) {
      debugPrint("Dio API Error: ${e.message}");
      _dioExceptionSwitch(e);
      rethrow;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      rethrow;
    }
  }
}
