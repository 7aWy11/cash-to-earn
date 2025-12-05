import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_switch.dart';
import '../../../../core/widgets/custom_logout_dialog.dart';
import '../widgets/profile_card.dart';
import '../widgets/profile_listitems.dart';

/// Profile Screen - Complete Example
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,

        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header Section
              Text(
                'Profile',
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),

              // User Profile Card
              ProfileCard(
                name: 'CashToEarn User',
                username: '@cashtoearnuser',
                avatarUrl: null, // Will show gradient with initial
                onTap: () {
                  // Navigate to edit profile
                },
              ),
              SizedBox(height: 16.h),
              Text(
                'Proflie',
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),

              // Profile Items
              ProfileListItem(
                title: 'Email Address',
                subtitle: 'user@example.com',
                rightWidget: CustomButton(
                  text: 'Verify',
                  onPressed: () {
                    // Handle verify email
                  },
                  width: 70.w,
                  height: 36.h,
                  padding: EdgeInsets.zero,
                  textStyle: AppTextStyles.buttonSmall,
                ),
              ),

              ProfileListItem(
                title: 'Notifications',
                subtitle: 'Manage your notification preferences',
                rightWidget: CustomToggleSwitch(
                  initialValue: isNotificationEnabled,
                  onChanged: (value) {
                    setState(() {
                      isNotificationEnabled = value;
                    });
                    // Handle notification toggle
                  },
                ),
              ),

              ProfileListItem(
                title: 'User ID',
                subtitle: 'CTE-12345789',
                rightWidget: TextButton(
                  onPressed: () {
                    Clipboard.setData(
                      const ClipboardData(text: 'CTE-12345789'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User ID copied')),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryPurple,
                    minimumSize: Size(50.w, 36.h),
                  ),
                  child: const Text('Copy'),
                ),
              ),

              ProfileListItem(
                title: 'Password',
                subtitle: 'Change your account password',
                onTap: () {
                  // Navigate to change password
                },
              ),

              // Statistics Section
              Text(
                'Statistics',
                style: AppTextStyles.h6.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              ProfileListItem(
                title: 'Account Activities',
                subtitle: 'View your account statistics and withdrawal history',

                onTap: () {
                  // Navigate to account activities
                },
              ),

              ProfileListItem(
                title: 'Referrals',
                subtitle: 'Invite friends and earn rewards',

                onTap: () {
                  // Navigate to referrals
                  context.push(RouteNames.referral);
                },
              ),

              ProfileListItem(
                title: 'Rewards',
                subtitle: 'Check your reward progress',

                onTap: () {
                  // Navigate to rewards
                  context.push(RouteNames.tasksList);
                },
              ),

              ProfileListItem(
                title: 'Leaderboard',
                subtitle: 'See top earning users',

                onTap: () {
                  // Navigate to leaderboard
                  context.push(RouteNames.leaderboard);
                },
              ),

              // More Section
              Text(
                'More',
                style: AppTextStyles.h6.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),

              ProfileListItem(
                title: 'Two-Factor Authentication',
                subtitle: 'Further secure your account for safety',

                onTap: () {
                  // Navigate to 2FA settings
                },
              ),

              ProfileListItem(
                title: 'Help & Support',
                subtitle: 'Get help when you need it',

                onTap: () {
                  // Navigate to help & support
                },
              ),

              ProfileListItem(
                title: 'About App',
                subtitle: 'Version 1.0.0 - Learn more about CashToEarn',

                onTap: () {
                  // Navigate to about app
                },
              ),

              SizedBox(height: 24.h),

              // Logout Button
              CustomButton(
                height: 45.h,
                text: 'Log Out',
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
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
                width: double.infinity,
                backgroundColor: AppColors.errorRed,
                textColor: AppColors.white,
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
