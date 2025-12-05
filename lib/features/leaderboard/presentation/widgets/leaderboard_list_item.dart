import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../domain/entities/leaderboard_user.dart';

/// Widget to display a single leaderboard user item
class LeaderboardListItem extends StatelessWidget {
  final LeaderboardUser user;
  final bool isCurrentUser;

  const LeaderboardListItem({
    super.key,
    required this.user,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? AppColors.primaryPurple.withValues(alpha: 0.1)
            : AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isCurrentUser
              ? AppColors.primaryPurple.withValues(alpha: 0.5)
              : AppColors.border,
          width: isCurrentUser ? 2.w : 1.w,
        ),
      ),
      child: Row(
        children: [
          // Rank number
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: _getRankColor().withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: _getRankColor(), width: 1.w),
            ),
            child: Center(
              child: Text(
                '#${user.rank}',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _getRankColor(),
                ),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Avatar
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isCurrentUser
                    ? AppColors.primaryPurple
                    : AppColors.border,
                width: 2.w,
              ),
            ),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.backgroundCardElevated,
              backgroundImage: user.avatarUrl != null
                  ? NetworkImage(user.avatarUrl!)
                  : null,
              child: user.avatarUrl == null
                  ? Text(
                      user.username[0].toUpperCase(),
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
          ),

          SizedBox(width: 12.w),

          // Username and offers
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        user.username,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isCurrentUser
                              ? AppColors.primaryPurple
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                    if (isCurrentUser) ...[
                      SizedBox(width: 4.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryPurple,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          'You',
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 9.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  '${user.completedOffers} offers completed',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          // Earnings
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${user.totalEarnings.toStringAsFixed(2)}',
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.successGreen,
                ),
              ),
              SizedBox(height: 2.h),
              if (user.country != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundCardElevated,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: AppColors.border, width: 1.w),
                  ),
                  child: Text(
                    user.country!,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 9.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getRankColor() {
    if (user.rank <= 5) {
      return AppColors.goldYellow;
    } else if (user.rank <= 10) {
      return AppColors.vibrantBlue;
    } else {
      return AppColors.textSecondary;
    }
  }
}
