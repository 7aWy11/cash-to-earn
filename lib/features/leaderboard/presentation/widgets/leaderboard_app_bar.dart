import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

class LeaderboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onInfoPressed;

  const LeaderboardAppBar({super.key, required this.onInfoPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.textPrimary,
          size: 20.sp,
        ),
        onPressed: () => context.pop(),
      ),
      title: Text(
        'Leaderboard',
        style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.info_outline,
            color: AppColors.textSecondary,
            size: 24.sp,
          ),
          onPressed: onInfoPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
