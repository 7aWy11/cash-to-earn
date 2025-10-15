import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

/// Username and Avatar selection screen (UI Only)
class UsernameAvatarScreen extends StatelessWidget {
  const UsernameAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Create Account'),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: FadeInUp(
              duration: const Duration(milliseconds: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Choose your username and avatar, and start the adventure! 🚀',
                    style: AppTextStyles.h3.copyWith(color: AppColors.white),
                  ),

                  SizedBox(height: 32.h),

                  // Username Field
                  CustomTextField(
                    hintText: 'Choose your username',
                    borderRadius: BorderRadius.circular(12.r),
                  ),

                  SizedBox(height: 32.h),

                  // Avatar Selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select your avatar',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.refresh, color: AppColors.white, size: 20.sp),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Avatar Grid (6x4 = 24 avatars)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,

                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                    ),
                    itemCount: 40,
                    itemBuilder: (context, index) => _buildAvatarItem(),
                  ),

                  SizedBox(height: 32.h),

                  // Save Button
                  CustomButton(
                    text: 'Save',
                    onPressed: () => context.go(RouteNames.main),
                    width: double.infinity,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.primaryPurple,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarItem() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.2),
          width: 1.5,
        ),
        color: AppColors.white.withValues(alpha: 0.1),
      ),
      child: Center(
        child: Icon(
          Icons.person,
          color: AppColors.white.withValues(alpha: 0.7),
          size: 24.sp,
        ),
      ),
    );
  }
}
