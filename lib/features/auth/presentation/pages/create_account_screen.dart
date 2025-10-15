import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../widgets/social_login_button.dart';
import '../widgets/personalization_dialog.dart';

/// Create Account screen (UI Only)
class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
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
                    'Ready to Earn?',
                    style: AppTextStyles.h3.copyWith(color: AppColors.white),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Join 19,000+ active earners today',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.white.withValues(alpha: 0.7),
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Social Login Buttons
                  SocialLoginButton(
                    iconPath: AppImages.google,
                    text: 'Continue with Google',
                    color: AppColors.white,
                    textColor: AppColors.black,
                    onPressed: () {},
                  ),
                  SizedBox(height: 12.h),
                  SocialLoginButton(
                    iconPath: AppImages.vector,
                    text: 'Continue with Facebook',
                    color: const Color(0xFF1877F2),
                    onPressed: () {},
                  ),

                  SizedBox(height: 24.h),

                  // Divider
                  Center(
                    child: Text(
                      'or create with email',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Name Field with Label
                  Text(
                    'Name',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(12.r),
                    hintText: 'Enter your full name',
                    keyboardType: TextInputType.name,
                  ),

                  SizedBox(height: 16.h),

                  // Email Field with Label
                  Text(
                    'Email',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    borderRadius: BorderRadius.circular(12.r),
                    hintText: 'Enter your email address',
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 16.h),

                  // Password Field with Label
                  Text(
                    'Password',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: TextEditingController(),

                    borderRadius: BorderRadius.circular(12.r),
                    hintText: 'Create a secure password',
                    obscureText: true,
                  ),

                  SizedBox(height: 16.h),

                  // Terms Checkbox
                  Row(
                    children: [
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: AppColors.primaryPurple,
                          side: BorderSide(
                            color: AppColors.white.withValues(alpha: 0.5),
                            width: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: 'I agree to the ',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.white.withValues(alpha: 0.7),
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms of Service',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  // Create Account Button
                  CustomButton(
                    text: 'Create My Account',
                    onPressed: () => showPersonalizationDialog(context),
                    width: double.infinity,
                  ),

                  SizedBox(height: 16.h),

                  // Sign In Link
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Already earning with us? ',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primaryPurple,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
