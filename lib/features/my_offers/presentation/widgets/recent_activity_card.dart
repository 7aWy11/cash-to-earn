import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../data/models/my_offars_model.dart';

/// Activity Item Card - Shows completed offer/task with blur effect
class ActivityItemCard extends StatelessWidget {
  final ActivityItem activity;

  const ActivityItemCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.myoffersGreenBlur,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.successGreen.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Icon/Image
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: activity.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        activity.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.videogame_asset,
                            color: Colors.white.withValues(alpha: 0.3),
                            size: 20.sp,
                          );
                        },
                      ),
                    )
                  : Icon(
                      Icons.videogame_asset,
                      color: Colors.white.withValues(alpha: 0.3),
                      size: 20.sp,
                    ),
            ),

            SizedBox(width: 12.w),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        activity.timeAgo,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          activity.category,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),

                  // Status badge
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.myoffersGreen.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Text(
                      activity.status,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.myoffersGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 8.w),

            // Reward
            Container(
              width: 75.w,
              height: 75.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.myoffersGreen.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Center(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  activity.reward,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.price,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
