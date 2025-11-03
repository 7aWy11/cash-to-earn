import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/string_constants.dart';

/// Task Description Section Widget
class TaskDescriptionSection extends StatelessWidget {
  final String description;

  const TaskDescriptionSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.defaultPadding.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.description, color: AppColors.infoCyan, size: 20.sp),
              SizedBox(width: 8.w),
              Text(StringConstants.description, style: AppTextStyles.h6),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            style: AppTextStyles.bodyMediumSecondary.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }
}
