import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/widgets/custom_button.dart';

class WithdrawConfirmStep extends StatelessWidget {
  final String paymentMethod;
  final String minimumAmount;
  final String fee;
  final Color methodColor;
  final String email;
  final TextEditingController emailController;
  final VoidCallback onBack;
  final VoidCallback onContinue;
  final VoidCallback onChangePaymentDetails;
  final ValueChanged<String> onEmailChanged;

  const WithdrawConfirmStep({
    super.key,
    required this.paymentMethod,
    required this.minimumAmount,
    required this.fee,
    required this.methodColor,
    required this.email,
    required this.emailController,
    required this.onBack,
    required this.onContinue,
    required this.onChangePaymentDetails,
    required this.onEmailChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h, // Fixed height for all steps
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Payment Method
          _buildPaymentMethod(),
          SizedBox(height: 16.h),

          // Change Payment Details Button
          _buildChangePaymentButton(),
          SizedBox(height: 20.h),

          // Email Input
          _buildEmailInput(),

          // Spacer to push buttons to bottom
          const Spacer(),

          // Action Buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: methodColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon at the top
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.completedIcon,
                    width: 20.w,
                    height: 20.h,
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              // Bottom section with name, minimum, and fee
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row with name and minimum
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Name
                      Flexible(
                        child: Text(
                          paymentMethod,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      // Minimum
                      Text(
                        'Min: $minimumAmount',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  // Fee
                  Text(
                    fee,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChangePaymentButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryPurple),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: GestureDetector(
        onTap: onChangePaymentDetails,
        child: Text(
          'Change payment details',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.primaryPurple,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildEmailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$paymentMethod Email Address',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
          decoration: InputDecoration(
            hintText: 'user@paypal.com',
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            filled: true,
            fillColor: AppColors.backgroundDarkSecondary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
          ),
          onChanged: onEmailChanged,
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Back',
            backgroundColor: AppColors.backgroundDarkSecondary,
            textColor: AppColors.white,
            onPressed: onBack,
            height: 48.h,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CustomButton(
            text: 'continue',
            backgroundColor: AppColors.primaryPurple,
            textColor: AppColors.white,
            onPressed: onContinue,
            height: 48.h,
          ),
        ),
      ],
    );
  }
}
