import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String reward;
  final String rating;
  final Color iconColor;

  const OfferCard({
    super.key,
    required this.title,
    required this.reward,
    required this.rating,
    this.iconColor = AppColors.vibrantBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and Rating
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: iconColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                const Spacer(),
                Icon(Icons.star, color: AppColors.goldYellow, size: 14.sp),
                SizedBox(width: 2.w),
                Text(rating, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          
          // Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              title,
              style: AppTextStyles.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          const Spacer(),
          
          // Reward
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.backgroundCardElevated,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Text(
              reward,
              style: AppTextStyles.priceTag,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}




