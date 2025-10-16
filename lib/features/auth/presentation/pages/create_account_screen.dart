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
import '../widgets/terms_and_conditions_checkbox.dart';
import '../widgets/account_creation_prompt.dart';

/// Create Account screen (UI Only)
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Create Account', centerTitle: true),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background),
            fit: BoxFit.cover,
          ),
        ),
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
                TermsAndConditionsCheckbox(
                  onChanged: (value) {
                    setState(() {
                      _isTermsAccepted = value;
                    });
                  },
                ),

                SizedBox(height: 32.h),

                // Create Account Button
                CustomButton(
                  text: 'Create My Account',
                  onPressed: _isTermsAccepted
                      ? () => showPersonalizationDialog(context)
                      : null,
                  width: double.infinity,
                  backgroundColor: _isTermsAccepted
                      ? AppColors.white
                      : AppColors.white.withValues(alpha: 0.3),
                  textColor: _isTermsAccepted
                      ? AppColors.primaryPurple
                      : AppColors.primaryPurple.withValues(alpha: 0.5),
                ),

                SizedBox(height: 16.h),

                // Sign In Link
                Center(
                  child: AccountCreationPrompt(
                    text: 'Already earning with us?',
                    buttonText: 'Sign in',
                    onPressed: () {
                      // TODO: Navigate to sign in screen
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
