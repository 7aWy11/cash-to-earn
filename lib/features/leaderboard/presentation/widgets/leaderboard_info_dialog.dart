import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

class LeaderboardInfoDialog extends StatelessWidget {
  const LeaderboardInfoDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const LeaderboardInfoDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        'About Leaderboard',
        style: AppTextStyles.h5.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoItem(
            icon: Icons.emoji_events,
            color: AppColors.goldYellow,
            text: 'Top 3 users get special recognition',
          ),
          SizedBox(height: 12.h),
          _InfoItem(
            icon: Icons.trending_up,
            color: AppColors.successGreen,
            text: 'Rankings based on total earnings',
          ),
          SizedBox(height: 12.h),
          _InfoItem(
            icon: Icons.refresh,
            color: AppColors.vibrantBlue,
            text: 'Updated in real-time',
          ),
          SizedBox(height: 12.h),
          _InfoItem(
            icon: Icons.star,
            color: AppColors.primaryPurple,
            text: 'Complete more offers to climb up',
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            'Got it',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primaryPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _InfoItem({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
