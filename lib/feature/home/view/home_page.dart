import 'package:flutter/material.dart';
import 'package:user_app/core/theme/app_colors.dart';
import 'package:user_app/data/demo_data/demo_user.dart';
import 'package:user_app/feature/home/widgets/user_info_card.dart';

import '../../../utils/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          S.of(context).titleExecutiveDirectory,
          style: textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          Text(S.of(context).titleCreateNetwork, style: textTheme.titleMedium),
          Text(
            S.of(context).headingExecutiveNetwork,
            style: textTheme.headlineMedium,
          ),
          UserInfoCardWidget(user: getDemoUse()),
        ],
      ),
    );
  }
}
