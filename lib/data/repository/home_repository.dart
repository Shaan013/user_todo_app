import 'package:dio/dio.dart';
import 'package:user_app/data/model/User_model.dart';
import 'package:user_app/data/network/network_service.dart';

class HomeRepository {
  Future<UserModel?> getAllUserModel() async {
    NetworkService networkService = NetworkService();
    Response response = await networkService.getAllUsers();
    if (response.statusCode != 200) {
      return null;
    }
    UserModel userModel = UserModel.fromJson(response.data);
    return userModel;
  }
}
