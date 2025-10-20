import 'package:cash_to_earn/core/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_icon_builder.dart';

/// Side drawer menu
class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerBackground,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(24.w),
              child: Row(
                children: [
                  Text('CashToEarn', style: AppTextStyles.h4),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),

            Divider(color: AppColors.border, height: 1.h),

            // Menu Items
            _buildMenuItem('Referrals', AppImages.linkIcon),
            _buildMenuItem('Leaderboard', AppImages.leaderboardIcon),
            _buildMenuItem('Shortcut', AppImages.shortcutsIcon),
            _buildMenuItem('Reward', AppImages.myOffersIcon),
            _buildMenuItem('Support', AppImages.supportIcon),

            const Spacer(),

            // Logout Button
            Padding(
              padding: EdgeInsets.all(24.w),
              child: CustomButton(
                borderRadius: BorderRadius.circular(16.r),
                text: 'Logout',
                onPressed: () {},
                backgroundColor: AppColors.primaryPurple,
                textColor: AppColors.primaryPurpleSecondary,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, String? svgIconPath) {
    return ListTile(
      leading: SizedBox(
        width: 24.sp,
        height: 24.sp,
        child: CustomIconBuilder(
          svgIconPath: svgIconPath,
          color: AppColors.textPrimary,
          size: 24.sp,
        ),
      ),
      title: Text(title, style: AppTextStyles.bodyLarge),
      onTap: () {},
    );
  }
}
