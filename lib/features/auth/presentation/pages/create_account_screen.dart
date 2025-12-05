import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../widgets/account_creation_prompt.dart';
import '../widgets/personalization_dialog.dart';
import '../widgets/social_login_button.dart';
import '../widgets/terms_and_conditions_checkbox.dart';

/// Create Account screen (UI Only)
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isTermsAccepted = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleCreateAccount() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isTermsAccepted) {
        // TODO: Implement create account logic
        final name = _nameController.text;
        final email = _emailController.text;
        final password = _passwordController.text;

        print(
          'Create account with name: $name, email: $email, password: $password',
        );

        showPersonalizationDialog(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Button
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),

                    SizedBox(height: 16.h),
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
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.white.withValues(alpha: 0.3),
                            thickness: 1.h,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Center(
                          child: Text(
                            'or create with email',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Divider(
                            color: AppColors.white.withValues(alpha: 0.3),
                            thickness: 1.h,
                          ),
                        ),
                      ],
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
                      controller: _nameController,
                      borderRadius: BorderRadius.circular(12.r),
                      hintText: 'Enter your full name',
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          Validators.validateRequired(value, 'Name'),
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
                      controller: _emailController,
                      borderRadius: BorderRadius.circular(12.r),
                      hintText: 'Enter your email address',
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.validateEmail,
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
                      controller: _passwordController,
                      borderRadius: BorderRadius.circular(12.r),
                      hintText: 'Create a secure password',
                      obscureText: true,
                      validator: Validators.validatePassword,
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
                      onPressed: _isTermsAccepted ? _handleCreateAccount : null,
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
                          context.pushReplacement(RouteNames.login);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
