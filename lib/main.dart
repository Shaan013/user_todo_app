import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/core/theme/app_theme.dart';
import 'package:user_app/feature/home/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392, 872),
      child: MaterialApp(
        title: 'Flutter  practice ',
        theme: appLightTheme,
        home: HomePage(),
      ),
    );
  }
}
