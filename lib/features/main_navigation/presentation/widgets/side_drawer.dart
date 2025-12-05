import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_icon_builder.dart';
import '../../../../core/widgets/custom_logout_dialog.dart';

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
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close, color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),

            Divider(color: AppColors.border, height: 1.h),

            // Menu Items
            _buildMenuItem(context, 'Referral', AppImages.linkIcon, () {
              context.pop();
              context.push(RouteNames.referral);
            }),
            _buildMenuItem(
              context,
              'Leaderboard',
              AppImages.leaderboardIcon,
              () {
                context.pop();
                context.push(RouteNames.leaderboard);
              },
            ),
            _buildMenuItem(context, 'Reward', AppImages.myOffersIcon, () {
              context.pop();
              context.push(RouteNames.tasksList);
            }),
            _buildMenuItem(context, 'Support', AppImages.supportIcon, null),

            const Spacer(),

            // Logout Button
            Padding(
              padding: EdgeInsets.all(24.w),
              child: CustomButton(
                borderRadius: BorderRadius.circular(16.r),
                text: 'Logout',
                onPressed: () {
                  // Show logout confirmation dialog
                  CustomLogoutDialog.show(
                    context,
                    onLogout: () {
                      // Handle actual logout logic here
                      // For example: clear user data, navigate to login screen, etc.
                    },
                  );
                },
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

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    String? svgIconPath,
    VoidCallback? onTap,
  ) {
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
      onTap: onTap ?? () {},
    );
  }
}
