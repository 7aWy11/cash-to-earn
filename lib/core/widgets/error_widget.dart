import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/app_colors.dart';
import '../config/theme/app_text_styles.dart';
import 'custom_button.dart';

/// Custom error widget
class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData? icon;

  const CustomErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: 64.w,
              color: AppColors.errorRed,
            ),
            SizedBox(height: 16.h),
            Text('Oops!', style: AppTextStyles.h4),
            SizedBox(height: 8.h),
            Text(
              message,
              style: AppTextStyles.bodyMediumSecondary,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              SizedBox(height: 24.h),
              CustomButton(text: 'Try Again', onPressed: onRetry, width: 200.w),
            ],
          ],
        ),
      ),
    );
  }
}

/// Empty state widget
class EmptyStateWidget extends StatelessWidget {
  final String message;
  final String? subtitle;
  final IconData? icon;
  final Widget? action;

  const EmptyStateWidget({
    super.key,
    required this.message,
    this.subtitle,
    this.icon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.inbox_outlined,
              size: 64.w,
              color: AppColors.textTertiary,
            ),
            SizedBox(height: 16.h),
            Text(message, style: AppTextStyles.h5, textAlign: TextAlign.center),
            if (subtitle != null) ...[
              SizedBox(height: 8.h),
              Text(
                subtitle!,
                style: AppTextStyles.bodyMediumSecondary,
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[SizedBox(height: 24.h), action!],
          ],
        ),
      ),
    );
  }
}
