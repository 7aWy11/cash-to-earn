import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_icon_builder.dart';

/// Performance Analytics Card
class PerformanceCard extends StatelessWidget {
  final IconData? icon;
  final String? svgIconPath;
  final String value;
  final String label;
  final String? changeText;
  final String? actionText;
  final Color backgroundColor;
  final bool isWide;
  final VoidCallback? onActionTap;

  const PerformanceCard({
    super.key,
    this.icon,
    this.svgIconPath,
    required this.value,
    required this.label,
    this.changeText,
    this.actionText,
    required this.backgroundColor,
    this.isWide = false,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onActionTap,
      child: Container(
        height: isWide ? 105.h : 90.h,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: isWide ? _buildWideLayout() : _buildCompactLayout(),
      ),
    );
  }

  Widget _buildCompactLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon at the top
        CustomIconBuilder(
          centerIcon: false,
          icon: icon,
          svgIconPath: svgIconPath,
          size: 23.sp,
          color: Colors.white,
          borderRadius: 8.r,
          padding: EdgeInsets.all(8.w),
        ),

        // Row with icon and double number
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Value
              Flexible(
                child: Text(
                  value,
                  style: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Change text
              if (changeText != null)
                Text(
                  changeText!,
                  style: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
                ),
            ],
          ),
        ),

        // Text (label) at the bottom
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildWideLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon at the top
        CustomIconBuilder(
          centerIcon: false,
          icon: icon,
          svgIconPath: svgIconPath,
          size: 24.sp,
          color: Colors.white,
          padding: EdgeInsets.all(8.w),
        ),
        SizedBox(height: 8.h),
        // Bottom section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Value
            Text(
              value,
              style: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
            ),

            // Action Text on the right
            if (actionText != null)
              Text(actionText!, style: AppTextStyles.bodyLarge),
          ],
        ),

        SizedBox(height: 6.h),

        // Label below the row
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}
