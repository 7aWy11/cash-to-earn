import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

class WithdrawDialogHeader extends StatelessWidget {
  final int currentStep;

  const WithdrawDialogHeader({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Text(
            'Withdraw Funds',
            style: AppTextStyles.h4.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          _buildStepIndicator(),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStepCircle(1, 'Amount', currentStep >= 1),
        SizedBox(width: 16.w),
        _buildStepCircle(2, 'Confirm', currentStep >= 2),
        SizedBox(width: 16.w),
        _buildStepCircle(3, 'Complete', currentStep >= 3),
      ],
    );
  }

  Widget _buildStepCircle(int stepNumber, String label, bool isActive) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 21.w,
          height: 21.h,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primaryPurple
                : AppColors.primaryPurple.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              stepNumber.toString(),
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
            ),
          ),
        ),
        SizedBox(width: 3.w),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: isActive ? AppColors.white : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
