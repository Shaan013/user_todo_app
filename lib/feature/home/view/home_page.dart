import 'package:flutter/material.dart';
import 'package:user_app/core/theme/app_colors.dart';
import 'package:user_app/data/model/User_model.dart';
import 'package:user_app/data/repository/home_repository.dart';
import 'package:user_app/feature/home/widgets/user_info_card.dart';
import 'package:user_app/feature/todo/view/todo_page.dart';

import '../../../utils/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<UserModel>?> _listUser;

  @override
  void initState() {
    super.initState();
    _listUser = apiCall();
  }

  Future<List<UserModel>?> apiCall() async {
    final List<UserModel>? listUser = await HomeRepository.getAllUserModel();
    return listUser;
  }

  @override
  Widget build(BuildContext context) {
    apiCall();
    final textTheme = TextTheme.of(context);
    // final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: buildAppBar(context, textTheme),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              S.of(context).titleCreateNetwork,
              style: textTheme.titleMedium,
            ),
            Text(
              S.of(context).headingExecutiveNetwork,
              style: textTheme.headlineMedium,
            ),
            buildFutureBuilder(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, TextTheme textTheme) {
    return AppBar(
      actionsPadding: EdgeInsets.all(12),
      backgroundColor: AppColors.white,
      title: Text(
        S.of(context).titleExecutiveDirectory,
        style: textTheme.headlineLarge,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TodoPage()),
            );
          },
          child: Icon(Icons.task),
        ),
      ],
    );
  }

  FutureBuilder<List<UserModel>?> buildFutureBuilder() {
    return FutureBuilder(
      future: _listUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "${S.of(context).msgApiCouldNotFetchDate} ${snapshot.error.toString()}",
            ),
          );
        }

        if (snapshot.hasData) {
          final List<UserModel>? userList = snapshot.data;
          if (userList == null) {
            return Center(child: Text(S.of(context).erroryouDateIsNull));
          } else {
            return buildListView(userList);
          }
        }
        return Center(child: Text(S.of(context).errorSomethingWentWrong));
      },
    );
  }

  ListView buildListView(List<UserModel> userList) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: userList.length,
      itemBuilder: (context, index) {
        final user = userList[index];
        return UserInfoCardWidget(user: user);
      },
    );
  }
}
