import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

/// Reusable Profile List Item Widget
/// Simple and flexible - accepts any widget on the right side
class ProfileListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? rightWidget;
  final Widget? leadingWidget;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final MainAxisAlignment? mainAxisAlignment;
  final bool reverseLayout;

  const ProfileListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.rightWidget,
    this.leadingWidget,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.showBorder = true,
    this.mainAxisAlignment,
    this.reverseLayout = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            margin: margin ?? EdgeInsets.only(bottom: 12.h),
            padding: padding ?? EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color:
                  backgroundColor ??
                  AppColors.primaryPurpleSecondary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12.r),
              border: showBorder
                  ? Border.all(
                      color: AppColors.border.withValues(alpha: .5),
                      width: 1,
                    )
                  : null,
            ),
            child: Row(
              mainAxisAlignment:
                  mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
              textDirection: reverseLayout
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              children: [
                // Leading widget (optional)
                if (leadingWidget != null) ...[
                  leadingWidget!,
                  SizedBox(width: 12.w),
                ],

                // Title and Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: reverseLayout
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: reverseLayout
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                      ),
                      if (subtitle != null) ...[
                        SizedBox(height: 4.h),
                        Text(
                          subtitle!,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textDirection: reverseLayout
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                        ),
                      ],
                    ],
                  ),
                ),

                // Right widget (optional)
                if (rightWidget != null) ...[
                  SizedBox(width: 12.w),
                  rightWidget!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
