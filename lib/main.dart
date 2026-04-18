import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/core/theme/app_theme.dart';
import 'package:user_app/data/service/get_it_services.dart';
import 'package:user_app/feature/home/view/home_page.dart';
import 'package:user_app/utils/generated/l10n.dart';

void main() {
  setupSl();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392, 872),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          supportedLocales: S.delegate.supportedLocales,
          title: 'Flutter  practice ',
          theme: appLightTheme,
          home: child,
        );
      },
      child: HomePage(),
    );
  }
}
