import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_text_styles.dart';

/// Reusable Info Chip Widget for displaying task information
class TaskInfoChip extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;

  const TaskInfoChip({
    super.key,
    required this.text,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: color, size: 14.sp),
            SizedBox(width: 4.w),
          ],
          Text(text, style: AppTextStyles.captionBold.copyWith(color: color)),
        ],
      ),
    );
  }
}
