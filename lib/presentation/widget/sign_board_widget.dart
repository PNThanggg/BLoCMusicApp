import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';

class SignBoardWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const SignBoardWidget({
    super.key,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: AppColor.primaryColor2.withOpacity(0.7),
                  size: 40,
                ),
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextTheme.tertiaryTextStyle.merge(
                  TextStyle(
                    color: AppColor.primaryColor2.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
