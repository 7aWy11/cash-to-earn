import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

class PremiumPartnerCard extends StatelessWidget {
  final String name;
  final String description;
  final String maxReward;

  const PremiumPartnerCard({
    super.key,
    required this.name,
    required this.description,
    required this.maxReward,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.goldYellowBlur,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.goldYellow.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.goldYellow,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.goldYellow.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),

          // Max reward
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                maxReward,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.goldYellow,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Max Reward',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.goldYellow.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
