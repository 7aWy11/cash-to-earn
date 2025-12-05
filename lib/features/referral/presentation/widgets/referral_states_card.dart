import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';

/// Referral Stats Card - Premium 3-Column Design with Images
class ReferralStatsCard extends StatelessWidget {
  final int totalReferrals;
  final int pendingReferrals;
  final double totalEarned;

  const ReferralStatsCard({
    super.key,
    required this.totalReferrals,
    required this.pendingReferrals,
    required this.totalEarned,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Total Referrals Card
        Expanded(
          child: _StatCard(
            imagePath: AppImages.friends,
            label: 'Total Referrals',
            value: totalReferrals.toString(),
            color: AppColors.vibrantBlue,
          ),
        ),

        SizedBox(width: 12.w),

        // Pending Card
        Expanded(
          child: _StatCard(
            imagePath: AppImages.pending,
            label: 'Pending',
            value: pendingReferrals.toString(),
            color: AppColors.warningOrange,
          ),
        ),

        SizedBox(width: 12.w),

        // Coins Earned Card
        Expanded(
          child: _StatCard(
            imagePath: AppImages.coin,
            label: 'Coins Earned',
            value: totalEarned.toInt().toString(),
            color: AppColors.goldYellow,
          ),
        ),
      ],
    );
  }
}

/// Single Stat Card with glassmorphism effect and image
class _StatCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.imagePath,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image with gradient background
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withValues(alpha: 0.3),
                  color.withValues(alpha: 0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: color.withValues(alpha: 0.4), width: 2),
            ),
            child: Image.asset(
              imagePath,
              width: 28.sp,
              height: 28.sp,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 12.h),

          // Value with bold text
          Text(
            value,
            style: AppTextStyles.h3.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 6.h),

          // Label
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
