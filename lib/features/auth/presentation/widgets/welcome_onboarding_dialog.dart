import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';

/// Welcome onboarding dialog with 4 steps
class WelcomeOnboardingDialog extends StatefulWidget {
  const WelcomeOnboardingDialog({super.key});

  @override
  State<WelcomeOnboardingDialog> createState() =>
      _WelcomeOnboardingDialogState();
}

class _WelcomeOnboardingDialogState extends State<WelcomeOnboardingDialog> {
  int currentStep = 0;
  final PageController _pageController = PageController();

  final List<OnboardingStep> steps = [
    OnboardingStep(
      title: "Welcome to CashToEarn!",
      description:
          "Turn your free time into real cash by completing offers, playing games, and watching videos.",
    ),
    OnboardingStep(
      title: "Earn Money Daily",
      description:
          "Browse through recommended offers and gaming tasks to start earning immediately.",
    ),
    OnboardingStep(
      title: "Track Your Progress",
      description:
          "Monitor all your completed offers and earnings in the My Offers section.",
    ),
    OnboardingStep(
      title: "Cash Out Anytime",
      description:
          "Redeem your earnings via PayPal, crypto, or gift cards with instant payouts.",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (currentStep < steps.length - 1) {
      setState(() {
        currentStep++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _skipOnboarding() {
    _finishOnboarding();
  }

  void _finishOnboarding() {
    Navigator.pop(context);
    // Just close the dialog since we're already in home screen
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: FadeInUp(
        duration: const Duration(milliseconds: 300),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 340.w,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E).withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Content
                  SizedBox(
                    height: 280.h,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentStep = index;
                        });
                      },
                      itemCount: steps.length,
                      itemBuilder: (context, index) {
                        return _buildStepContent(steps[index]);
                      },
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Pagination indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      steps.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == currentStep
                              ? const Color(0xFF9B59B6)
                              : const Color(0xFF5A3B6B),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Action buttons
                  if (currentStep == 0)
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'Skip Guide',
                            onPressed: _skipOnboarding,
                            backgroundColor: AppColors.primaryPurple.withValues(
                              alpha: 0.1,
                            ),
                            textColor: AppColors.textDisabled,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: CustomButton(
                            text: 'Next',
                            onPressed: _nextStep,
                            backgroundColor: AppColors.primaryPurple,
                            textColor: AppColors.primaryPurpleSecondary
                                .withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    )
                  else
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: 'Next',
                        onPressed: _nextStep,
                        backgroundColor: AppColors.primaryPurple,
                        textColor: AppColors.primaryPurpleSecondary.withValues(
                          alpha: 0.6,
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

  Widget _buildStepContent(OnboardingStep step) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          Text(
            step.title,
            style: AppTextStyles.h4.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 16.h),

          // Description
          Text(
            step.description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OnboardingStep {
  final String title;
  final String description;

  OnboardingStep({required this.title, required this.description});
}

/// Helper function to show the welcome onboarding dialog
void showWelcomeOnboardingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const WelcomeOnboardingDialog(),
  );
}
