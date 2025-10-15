import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/glassmorphism_button.dart';

/// Landing screen for authentication (UI Only)
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // App Name
              Text(
                StringConstants.appName,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 22.h),
              // Smart Earning Card with Glassmorphism
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 600),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFF2D2D3A).withOpacity(0.6),
                            const Color(0xFF1A1A24).withOpacity(0.6),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: AppColors.white.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brand Icon
                          SizedBox(height: 16.h),
                          Image.asset(AppImages.brandIcon, fit: BoxFit.contain),
                          SizedBox(height: 16.h),
                          // Title
                          Text(
                            'Smart Earning',
                            style: AppTextStyles.h5.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12.h),

                          // Description
                          Text(
                            'AI-powered task matching finds you the highest paying opportunities',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.white.withOpacity(0.7),
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 16.h),

                          // Pagination dots
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildDot(isActive: true),
                              SizedBox(width: 6.w),
                              _buildDot(isActive: false),
                              SizedBox(width: 6.w),
                              _buildDot(isActive: false),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Action Buttons
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 600),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Join the Earning Revolution',
                      onPressed: () => context.push(RouteNames.createAccount),
                      width: double.infinity,
                      backgroundColor: AppColors.white,
                      textColor: AppColors.primaryPurple,
                    ),
                    SizedBox(height: 12.h),
                    GlassmorphismButton(
                      text: 'I Already Have an Account',
                      onPressed: () {},
                      width: double.infinity,
                      textColor: AppColors.textPrimary,
                      borderRadius: 12.r,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Terms
              FadeIn(
                delay: const Duration(milliseconds: 500),
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

  Widget _buildDot({required bool isActive}) {
    return Container(
      width: isActive ? 24.w : 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: isActive ? AppColors.white : AppColors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
