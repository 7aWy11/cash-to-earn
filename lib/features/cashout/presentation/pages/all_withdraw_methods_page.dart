import 'package:cash_to_earn/core/widgets/custom_section%20_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_app_header.dart';
import '../widgets/payment_method_gridview.dart';
import '../widgets/payment_method_dialog.dart';
import '../../data/models/payment_method_data.dart';

class AllWithdrawMethodsPage extends StatelessWidget {
  const AllWithdrawMethodsPage({super.key});

  void _showPaymentDialog(BuildContext context, String methodName) {
    // Get method details from data
    Map<String, dynamic>? methodDetails = PaymentMethodData.getMethodDetails(
      methodName,
    );

    if (methodDetails == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PaymentMethodDialog(
          paymentMethod: methodDetails['name'],
          minimumAmount: methodDetails['minimum'],
          fee: methodDetails['fee'],
          methodColor: methodDetails['color'],
          currentBalance: 0.05,
          currentCoins: 50,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'All Withdraw Methods',
          style: AppTextStyles.h6.copyWith(color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose your preferred withdrawal method',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomSectionHeader(
                      title: 'Traditional Methods',
                      showViewAll: false,
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(height: 10.h),
                    PaymentMethodGridView(
                      padding: EdgeInsets.zero,
                      paymentMethods: PaymentMethodData.withdrawMethods,
                      onMethodTap: (method) {
                        _showPaymentDialog(context, method);
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
