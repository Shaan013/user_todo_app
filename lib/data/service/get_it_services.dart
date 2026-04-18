import 'package:get_it/get_it.dart';
import 'package:user_app/data/network/dio_client.dart';
import 'package:user_app/data/repository/home_repository.dart';

final GetIt sl = GetIt.instance();

void setupSl() {

  sl.registerSingleton(
      ()=>DioClient.userDio,
    instanceName: "user_dio",
  );
  sl.registerSingleton(
      ()=>DioClient.todoDio,
    instanceName: "todo_dio"
  );

  sl.registerSingleton(HomeRepository());
}
