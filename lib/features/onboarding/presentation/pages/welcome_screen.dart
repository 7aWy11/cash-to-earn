import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/glassmorphism_button.dart';

/// Welcome/Consent screen - First onboarding screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),

              // Title
              FadeInDown(
                duration: const Duration(milliseconds: 600),
                child: Text(
                  StringConstants.appName,
                  style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 24.h),

              // Subtitle
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 600),
                child: Text(
                  'Welcome to ${StringConstants.appName}',
                  style: AppTextStyles.h5,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 40.h),

              // Features List with Glassmorphism
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 600),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.white.withOpacity(0.1),
                            AppColors.white.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFeatureItem(
                            title: 'Get paid for testing apps & games',
                          ),
                          SizedBox(height: 20.h),
                          _buildFeatureItem(
                            title: 'Complete surveys and earn rewards',
                          ),
                          SizedBox(height: 20.h),
                          _buildFeatureItem(
                            title: 'Turn your free time into real cash',
                          ),
                          SizedBox(height: 20.h),
                          _buildFeatureItem(
                            title: 'Earn up to \$50 daily for free',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              // Disclaimer
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 600),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    'Thousands are already cashing out daily - don\'t get left '
                    'behind. This is your moment to earn BIG!',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const Spacer(),

              // Buttons
              FadeInUp(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 600),
                child: Row(
                  children: [
                    Expanded(
                      child: GlassmorphismButton(
                        text: 'Decline',
                        onPressed: () {
                          // Show exit dialog or go back
                        },
                        borderRadius: 12.r,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomButton(
                        text: 'Accept',
                        onPressed: () {
                          context.go(RouteNames.landing);
                        },
                        textColor: AppColors.primaryPurple,
                        backgroundColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Privacy Policy
              FadeIn(
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 600),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text.rich(
                    TextSpan(
                      text: 'By signing up you agree to our ',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms and conditions',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textPrimary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const TextSpan(text: ' as well as '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textPrimary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({required String title}) {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryPurple, width: 2),
          ),
          child: Icon(
            Icons.check,
            color: AppColors.primaryPurple.withValues(alpha: 0.5),
            size: 16.sp,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
