import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_gradients.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../domain/entities/leaderboard_user.dart';

/// Widget to display the top 3 users in podium style
class TopThreePodium extends StatelessWidget {
  final List<LeaderboardUser> topThreeUsers;

  const TopThreePodium({super.key, required this.topThreeUsers});

  @override
  Widget build(BuildContext context) {
    // Ensure we have exactly 3 users, or fill with nulls
    final first = topThreeUsers.firstWhere((u) => u.rank == 1);
    final second = topThreeUsers.firstWhere((u) => u.rank == 2);
    final third = topThreeUsers.firstWhere((u) => u.rank == 3);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        children: [
          // Crown and Trophy Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Second Place
              _buildPodiumItem(
                user: second,
                rank: 2,
                height: 140.h,
                medalIcon: AppImages.silverMedal,
                medalColor: const Color(0xFFC0C0C0),
              ),

              SizedBox(width: 12.w),

              // First Place (Highest)
              _buildPodiumItem(
                user: first,
                rank: 1,
                height: 180.h,
                medalIcon: AppImages.goldMedal,
                medalColor: AppColors.goldYellow,
                hasCrown: true,
              ),

              SizedBox(width: 12.w),

              // Third Place
              _buildPodiumItem(
                user: third,
                rank: 3,
                height: 120.h,
                medalIcon: AppImages.bronzeMedal,
                medalColor: const Color(0xFFCD7F32),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPodiumItem({
    required LeaderboardUser user,
    required int rank,
    required double height,
    required String medalIcon,
    required Color medalColor,
    bool hasCrown = false,
  }) {
    return Expanded(
      child: Column(
        children: [
          // Crown for first place
          if (hasCrown) ...[
            Image.asset(
              AppImages.crown,
              width: 32.w,
              height: 32.h,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.emoji_events,
                  color: AppColors.goldYellow,
                  size: 32.sp,
                );
              },
            ),
            SizedBox(height: 8.h),
          ] else ...[
            SizedBox(height: 40.h), // Space to keep alignment
          ],

          // Avatar with medal
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // Avatar
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: rank == 1
                      ? AppGradients.gold
                      : rank == 2
                      ? AppGradients.purpleBlue
                      : AppGradients.greenSuccess,
                  border: Border.all(color: medalColor, width: 3.w),
                ),
                child: CircleAvatar(
                  radius: rank == 1 ? 36.r : 32.r,
                  backgroundColor: AppColors.backgroundCard,
                  backgroundImage: user.avatarUrl != null
                      ? NetworkImage(user.avatarUrl!)
                      : null,
                  child: user.avatarUrl == null
                      ? Text(
                          user.username[0].toUpperCase(),
                          style: AppTextStyles.h3.copyWith(
                            color: AppColors.white,
                          ),
                        )
                      : null,
                ),
              ),

              // Medal badge
              Positioned(
                bottom: -8.h,
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundCard,
                    shape: BoxShape.circle,
                    border: Border.all(color: medalColor, width: 2.w),
                  ),
                  child: Image.asset(
                    medalIcon,
                    width: 20.w,
                    height: 20.h,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.workspace_premium,
                        color: medalColor,
                        size: 20.sp,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Username
          Text(
            user.username,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: rank == 1 ? 14.sp : 12.sp,
            ),
          ),

          SizedBox(height: 4.h),

          // Earnings
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              gradient: rank == 1
                  ? AppGradients.gold
                  : rank == 2
                  ? AppGradients.blueCyan
                  : AppGradients.greenSuccess,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              '\$${user.totalEarnings.toStringAsFixed(0)}',
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontSize: rank == 1 ? 13.sp : 11.sp,
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // Podium
          Container(
            height: height,
            decoration: BoxDecoration(
              gradient: rank == 1
                  ? AppGradients.gold
                  : rank == 2
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFC0C0C0).withValues(alpha: 0.8),
                        const Color(0xFFA8A8A8).withValues(alpha: 0.6),
                      ],
                    )
                  : LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFCD7F32).withValues(alpha: 0.8),
                        const Color(0xFFB86F28).withValues(alpha: 0.6),
                      ],
                    ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
              border: Border.all(
                color: medalColor.withValues(alpha: 0.3),
                width: 1.w,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '#$rank',
                  style: AppTextStyles.h2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    fontSize: rank == 1 ? 32.sp : 24.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${user.completedOffers} offers',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white.withValues(alpha: 0.9),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
