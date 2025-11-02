import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/app_colors.dart';
import '../config/theme/app_text_styles.dart';

/// Section Header with title and optional "View All" button
class CustomSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;
  final bool showViewAll;
  final EdgeInsetsGeometry? padding;

  const CustomSectionHeader({
    super.key,
    required this.title,
    this.onViewAllTap,
    this.showViewAll = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
          ),
          if (showViewAll)
            GestureDetector(
              onTap: onViewAllTap,
              child: Text(
                'View all',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
