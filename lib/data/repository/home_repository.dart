import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:user_app/data/model/Todos_model.dart';
import 'package:user_app/data/model/User_model.dart';
import 'package:user_app/data/network/network_service.dart';

  class HomeRepository {
  static Future<List<UserModel>?> getAllUserModel() async {
    NetworkService networkService = NetworkService();
    final Response response = await networkService.getAllUsers();
    if (response.statusCode != 200) {
      log(" SUTATUS : ${response.statusCode}");
      return null;
    }
    final List data = response.data;
    final List<UserModel> listOfUser = data
        .map((user) => UserModel.fromJson(user))
        .toList();
    log(data.runtimeType.toString());
    return listOfUser;
  }

  static Future<TodosModel?> getAllTodos() async {
    NetworkService networkService = NetworkService();
    final Response response = await networkService.getAllTodos();
    if (response.statusCode != 200) {
      log(" SUTATUS : ${response.statusCode}");
      return null;
    }
    final TodosModel todosModel = TodosModel.fromJson(response.data);
    return todosModel;
  }
}
