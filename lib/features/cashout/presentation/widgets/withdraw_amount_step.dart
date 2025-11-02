import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/widgets/custom_button.dart';

class WithdrawAmountStep extends StatelessWidget {
  final double currentBalance;
  final int currentCoins;
  final int amountCoins;
  final double amountInDollars;
  final String paymentMethod;
  final String minimumAmount;
  final String fee;
  final Color methodColor;
  final TextEditingController amountController;
  final VoidCallback onBack;
  final VoidCallback onContinue;
  final ValueChanged<String> onAmountChanged;

  const WithdrawAmountStep({
    super.key,
    required this.currentBalance,
    required this.currentCoins,
    required this.amountCoins,
    required this.amountInDollars,
    required this.paymentMethod,
    required this.minimumAmount,
    required this.fee,
    required this.methodColor,
    required this.amountController,
    required this.onBack,
    required this.onContinue,
    required this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420.h, // Fixed height for all steps
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Balance Card
          _buildBalanceCard(),
          SizedBox(height: 20.h),

          // Amount Input
          _buildAmountInput(),
          SizedBox(height: 20.h),

          // Payment Method
          _buildPaymentMethod(),

          // Spacer to push buttons to bottom
          const Spacer(),

          // Action Buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primaryPurple.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.primaryPurple.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppImages.earnIcon,
                width: 20.w,
                height: 20.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryPurple,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'Balance',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                '\$${currentBalance.toStringAsFixed(2)}',
                style: AppTextStyles.h5.copyWith(
                  color: AppColors.primaryPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '$currentCoins Coins',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amount (in coins)',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
          decoration: InputDecoration(
            hintText: 'Enter amount',
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
          onChanged: onAmountChanged,
        ),
        SizedBox(height: 4.h),
        Text(
          '$amountCoins coins = \$${amountInDollars.toStringAsFixed(2)}',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
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
                  Center(
                    child: SvgPicture.asset(
                      AppImages
                          .completedIcon, // Replace with a suitable variable or conditional if supporting multiple payment methods
                      width: 18.w,
                      height: 18.h,
                    ),
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
