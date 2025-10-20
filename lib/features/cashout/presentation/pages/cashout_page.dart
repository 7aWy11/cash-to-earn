import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_app_header.dart';
import '../../../main_navigation/presentation/widgets/side_drawer.dart';

class CashoutScreen extends StatelessWidget {
  const CashoutScreen({super.key});

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
            Padding(
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
                          color: AppColors.successGreen.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            'My Withdrawals',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.partnerGreen,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
