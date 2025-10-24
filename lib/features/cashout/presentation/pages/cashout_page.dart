import 'package:cash_to_earn/core/widgets/custom_section%20_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/widgets/custom_app_header.dart';
import '../../../main_navigation/presentation/widgets/side_drawer.dart';
import '../widgets/payment_method_dialog.dart';
import '../widgets/payment_method_gridview.dart';
import '../../data/models/payment_method_data.dart';
import '../../../../core/config/router/route_names.dart';

class CashoutScreen extends StatelessWidget {
  const CashoutScreen({super.key});

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
      drawer: const SideDrawer(),
      backgroundColor: AppColors.backgroundDark,

      body: SafeArea(
        child: Column(
          children: [
            CustomAppHeader(balance: 0.05),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Cashout', style: AppTextStyles.h5),
                        const Spacer(),
                        Container(
                          width: 118.w,
                          height: 31.h,
                          decoration: BoxDecoration(
                            color: AppColors.myoffersGreenBlur,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: AppColors.myoffersGreen.withValues(
                                alpha: 0.2,
                              ),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'My Withdrawals',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.myoffersGreen,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Redeem your CashToEarn earnings directly to PayPal, Amazon, Bitcoin and more! Withdraw to your crypto wallet starting at just \$1.00',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.white,
                        overflow: TextOverflow.visible,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColors.primaryPurple.withValues(alpha: 0.2),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.earnIcon,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Balance',
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: AppColors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  '\$0.05',
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: AppColors.primaryPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '50 Coins',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textPrimary,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomSectionHeader(
                      title: 'Withdraw',
                      showViewAll: true,
                      padding: EdgeInsets.zero,
                      onViewAllTap: () {
                        context.push(RouteNames.allWithdrawMethods);
                      },
                    ),
                    SizedBox(height: 10.h),
                    PaymentMethodGridView(
                      padding: EdgeInsets.zero,
                      paymentMethods: PaymentMethodData.limitedWithdrawMethods,
                      onMethodTap: (method) {
                        _showPaymentDialog(context, method);
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomSectionHeader(
                      title: 'Crypto',
                      showViewAll: true,
                      padding: EdgeInsets.zero,
                      onViewAllTap: () {
                        context.push(RouteNames.allCryptoMethods);
                      },
                    ),
                    SizedBox(height: 10.h),
                    PaymentMethodGridView(
                      padding: EdgeInsets.zero,
                      paymentMethods: PaymentMethodData.limitedCryptoMethods,
                      onMethodTap: (method) {
                        _showPaymentDialog(context, method);
                      },
                    ),
                    SizedBox(height: 16.h),
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
