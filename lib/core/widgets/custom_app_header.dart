import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../config/theme/app_colors.dart';
import '../config/theme/app_gradients.dart';
import '../config/theme/app_text_styles.dart';
import '../constants/asset_paths.dart';
import 'custom_button.dart';

class CustomAppHeader extends StatelessWidget {
  final double balance;

  const CustomAppHeader({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryPurpleSecondary.withValues(alpha: 0.8),
                AppColors.primaryPurpleSecondary.withValues(alpha: 0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border(
              bottom: BorderSide(
                color: AppColors.primaryPurple.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              // Hamburger menu - Use Builder for correct context
              Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.white, size: 24.sp),
                ),
              ),

              const Spacer(),

              // Balance pill (with blur)
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryPurple.withValues(alpha: 0.3),
                          AppColors.primaryPurpleDark.withValues(alpha: 0.2),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: AppColors.primaryPurple.withValues(alpha: 0.4),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AppImages.earnIcon),
                        SizedBox(width: 6.w),
                        Text(
                          '\$${balance.toStringAsFixed(2)}',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Gift icon (with blur)
              CustomIconButton(
                svgPath: AppImages.notification,
                onPressed: () {},
                gradient: AppGradients.glassHeader,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
