import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

/// Progress indicator for multi-step dialogs
class DialogProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const DialogProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Question $currentStep of $totalSteps',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.white.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 16.h),
        LinearProgressIndicator(
          value: currentStep / totalSteps,
          backgroundColor: Colors.white.withOpacity(0.2),
          valueColor: const AlwaysStoppedAnimation<Color>(
            AppColors.primaryPurple,
          ),
          minHeight: 4.h,
          borderRadius: BorderRadius.circular(2.r),
        ),
      ],
    );
  }
}
