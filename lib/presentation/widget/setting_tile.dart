import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;
  final Widget? trailing;

  const SettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColor.primaryColor1,
          fontSize: 16,
        ).merge(
          AppTextTheme.secondoryTextStyleMedium,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: AppColor.primaryColor1.withOpacity(0.5),
          fontSize: 12,
        ).merge(AppTextTheme.secondoryTextStyleMedium),
      ),
      onTap: () {
        onTap();
      },
      dense: true,
      trailing: trailing,
    );
  }
}
