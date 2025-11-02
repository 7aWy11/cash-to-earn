import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/widgets/custom_button.dart';

class WithdrawCompleteStep extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onComplete;

  const WithdrawCompleteStep({
    super.key,
    required this.onClose,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h, // Fixed height for all steps
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Success Icon
          _buildSuccessIcon(),
          SizedBox(height: 20.h),

          // Success Message
          _buildSuccessMessage(),

          // Spacer to push buttons to bottom
          const Spacer(),

          // Action Buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.myoffersGreen.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        AppImages.completedIcon,
        width: 20.w,
        height: 20.h,
        colorFilter: const ColorFilter.mode(
          AppColors.successGreen,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Column(
      children: [
        Text(
          'Withdrawal Request Submitted!',
          style: AppTextStyles.h5.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          'Your withdrawal request has been submitted successfully. You will receive your funds within 24-48 hours.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Close',
            backgroundColor: AppColors.backgroundDarkSecondary,
            textColor: AppColors.white,
            onPressed: onClose,
            height: 48.h,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CustomButton(
            text: 'Complete',
            backgroundColor: AppColors.primaryPurple,
            textColor: AppColors.white,
            onPressed: onComplete,
            height: 48.h,
          ),
        ),
      ],
    );
  }
}
