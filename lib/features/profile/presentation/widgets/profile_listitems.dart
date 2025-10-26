import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

class ProfileListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? rightWidget;
  final Widget? leadingWidget;
  final VoidCallback? onTap;
  final Color? backgroundColor;
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
    this.mainAxisAlignment,
    this.reverseLayout = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.primaryPurple.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.border.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment:
                    mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
                textDirection: reverseLayout
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                children: [
                  if (leadingWidget != null) ...[
                    leadingWidget!,
                    SizedBox(width: 12.w),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: reverseLayout
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.bodyLarge,
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
                            textDirection: reverseLayout
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (rightWidget != null) ...[
                    SizedBox(width: 12.w),
                    rightWidget!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
