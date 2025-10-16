import 'package:cash_to_earn/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

class AccountCreationPrompt extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String buttonText;

  const AccountCreationPrompt({
    super.key,
    required this.onPressed,
    required this.text,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.bodyMediumSecondary.copyWith(
            color: AppColors.white.withValues(alpha: 0.7),
          ),
        ),
        SizedBox(width: 4.w),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            buttonText,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
