import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

class PayoutItem extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String amount;
  final String paymentMethod;

  const PayoutItem({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.amount,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(timeAgo, style: AppTextStyles.bodySmallSecondary),
                SizedBox(height: 2.h),
                Text(paymentMethod, style: AppTextStyles.bodySmallSecondary),
              ],
            ),
          ),

          // Amount
          Text(amount, style: AppTextStyles.priceTag),
        ],
      ),
    );
  }
}
