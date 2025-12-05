import '../config/theme/app_colors.dart';
import '../config/theme/app_text_styles.dart';
import '../utils/extensions.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String title;
  final String subtitle;
  final double? iconSize;
  final Color? iconColor;

  const EmptyPage({
    super.key,
    this.icon,
    this.imagePath,
    this.title = 'No data found',
    this.subtitle = 'Try changing the filter',
    this.iconSize,
    this.iconColor,
  }) : assert(
         icon != null || imagePath != null,
         'Either icon or imagePath must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display either icon or image
          if (imagePath != null)
            Image.asset(
              imagePath!,
              width: iconSize ?? 80.sp,
              height: iconSize ?? 80.sp,
              fit: BoxFit.contain,
            )
          else if (icon != null)
            Icon(
              icon!,
              size: iconSize ?? 80.sp,
              color: iconColor ?? AppColors.textTertiary,
            ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: AppTextStyles.h5.copyWith(color: AppColors.textSecondary),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
