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
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.goldYellow, width: 1),
      ),
      child: Row(
        children: [
          // Icon placeholder
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: AppColors.goldYellow,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.star, color: AppColors.white, size: 20.sp),
          ),

          SizedBox(width: 12.w),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(description, style: AppTextStyles.bodySmallSecondary),
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
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('Max Reward', style: AppTextStyles.bodySmallSecondary),
            ],
          ),
        ],
      ),
    );
  }
}
