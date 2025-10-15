import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

/// Side drawer menu
class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundCard,
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
            _buildMenuItem(Icons.share, 'Referrals'),
            _buildMenuItem(Icons.leaderboard, 'Leaderboard'),
            _buildMenuItem(Icons.extension, 'whatsnot'),
            _buildMenuItem(Icons.card_giftcard, 'Reward'),
            _buildMenuItem(Icons.support_agent, 'Support'),
            
            const Spacer(),
            
            // Logout Button
            Padding(
              padding: EdgeInsets.all(24.w),
              child: CustomButton(
                text: 'Logout',
                onPressed: () {},
                backgroundColor: AppColors.errorRed,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary, size: 24.sp),
      title: Text(title, style: AppTextStyles.bodyLarge),
      onTap: () {},
    );
  }
}




