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
import '../widgets/social_login_button.dart';

/// Login screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Implement login logic
      final email = _emailController.text;
      final password = _passwordController.text;

      // Call your login API here
      print('Login with email: $email, password: $password');

      // Navigate to main screen after successful login
      context.go(RouteNames.main);
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
                      'Welcome Back!',
                      style: AppTextStyles.h3.copyWith(color: AppColors.white),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Sign in to continue earning',
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
                      onPressed: () {
                        // TODO: Implement Google login
                      },
                    ),
                    SizedBox(height: 12.h),
                    SocialLoginButton(
                      iconPath: AppImages.vector,
                      text: 'Continue with Facebook',
                      color: const Color(0xFF1877F2),
                      onPressed: () {
                        // TODO: Implement Facebook login
                      },
                    ),

                    SizedBox(height: 24.h),

                    // Divider
                    Center(
                      child: Text(
                        'or sign in with email',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

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
                      hintText: 'Enter your password',
                      obscureText: true,
                      validator: Validators.validatePassword,
                    ),

                    SizedBox(height: 12.h),

                    // Forgot Password Link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Navigate to forgot password screen
                        },
                        child: Text(
                          'Forgot Password?',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Sign In Button
                    CustomButton(
                      text: 'Sign In',
                      onPressed: _handleLogin,
                      width: double.infinity,
                      backgroundColor: AppColors.white,
                      textColor: AppColors.primaryPurple,
                    ),

                    SizedBox(height: 16.h),

                    // Create Account Link
                    Center(
                      child: AccountCreationPrompt(
                        text: 'Don\'t have an account?',
                        buttonText: 'Create Account',
                        onPressed: () {
                          context.pushReplacement(RouteNames.createAccount);
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
