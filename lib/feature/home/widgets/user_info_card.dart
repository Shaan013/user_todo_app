import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/core/theme/app_colors.dart';
import 'package:user_app/data/demo_data/demo_user.dart';
import 'package:user_app/data/model/User_model.dart';

import '../../../utils/generated/l10n.dart';

class UserInfoCardWidget extends StatelessWidget {
  final UserModel user;

  const UserInfoCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final demo = getDemoUse();
    final str = S.of(context);
    return Container(
      margin: EdgeInsets.all(18).r,
      width: .maxFinite,
      padding: EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        color: AppColors.white,
      ),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: .start,
        children: [
          Text(
            user.name ?? S.of(context).errorUnknown,
            style: textTheme.headlineLarge,
          ),
          Text("@${user.username}", style: textTheme.titleLarge),
          buildCompanyInfo(colorScheme, context, textTheme),

          buildInfoRow(
            context,
            textTheme,
            icons: Icons.email,
            key: S.of(context).titleDigitalCorrespondence,
            value: user.email,
          ),
          buildInfoRow(
            context,
            textTheme,
            icons: Icons.call,
            key: S.of(context).titleDirectLine,
            value: user.phone,
          ),
          buildInfoRow(
            context,
            textTheme,
            icons: Icons.email,
            key: S.of(context).titlePrimaryOffice,
            value: "${user.address?.street}",
          ),
          buildInfoRow(
            context,
            textTheme,
            icons: Icons.public,
            key: S.of(context).titleWebsite,
            value: user.website,
          ),
        ],
      ),
    );
  }

  Row buildInfoRow(
    BuildContext context,
    TextTheme textTheme, {
    required IconData icons,
    required String key,
    required String? value,
  }) {
    return Row(
      spacing: 8.w,
      children: [
        CircleAvatar(child: Icon(icons)),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(key),
            Text(
              value ?? S.of(context).errorUnknown,
              style: textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }

  Container buildCompanyInfo(
    ColorScheme colorScheme,
    BuildContext context,
    TextTheme textTheme,
  ) {
    return Container(
      padding: EdgeInsets.all(12.r),
      color: colorScheme.surface,
      child: Column(
        children: [
          Row(
            spacing: 4.w,
            children: [
              Icon(Icons.corporate_fare, color: colorScheme.primary),
              Text(
                user.company?.name ?? S.of(context).errorUnknown,
                style: textTheme.headlineSmall,
              ),
            ],
          ),
          Text(user.company?.catchPhrase ?? S.of(context).errorUnknown),
          Text(
            user.company?.bs ?? S.of(context).errorUnknown,
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
