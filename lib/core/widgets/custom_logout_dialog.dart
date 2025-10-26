import 'package:cash_to_earn/core/config/theme/app_colors.dart';
import 'package:cash_to_earn/core/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomLogoutDialog extends StatelessWidget {
  final VoidCallback? onLogout;
  final String title;
  final String message;

  const CustomLogoutDialog({
    super.key,
    this.onLogout,
    this.title = 'Logout',
    this.message = 'Are you sure you want to logout?',
  });

  static Future<void> show(
    BuildContext context, {
    VoidCallback? onLogout,
    String title = 'Logout',
    String message = 'Are you sure you want to logout?',
  }) {
    return showDialog(
      context: context,
      builder: (context) => CustomLogoutDialog(
        onLogout: onLogout,
        title: title,
        message: message,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundCard,
      title: Text(
        title,
        style: AppTextStyles.h6.copyWith(color: AppColors.white),
      ),
      content: Text(
        message,
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (onLogout != null) {
              onLogout!();
            }
          },
          child: Text('Logout', style: TextStyle(color: AppColors.errorRed)),
        ),
      ],
    );
  }
}
