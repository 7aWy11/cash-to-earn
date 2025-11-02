import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

/// Reusable Section Card Widget with icon and title
class TaskSectionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget content;
  final EdgeInsetsGeometry? padding;

  const TaskSectionCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.content,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(AppConstants.defaultPadding.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius.r),
        border: Border.all(color: AppColors.border),
      ),
      child: content,
    );
  }
}
