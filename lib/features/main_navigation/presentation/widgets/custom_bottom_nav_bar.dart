import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/constants/asset_paths.dart';

/// Custom bottom navigation bar
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, 'Earn', 'Earn'),
              _buildNavItem(1, 'My Offers', 'My Offers'),
              _buildNavItem(2, 'Cashout', 'Cashout'),
              _buildNavItem(3, 'Profile', 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconType, String label) {
    final isSelected = currentIndex == index;

    // Get the appropriate SVG icon path based on selection state
    String iconPath;
    switch (iconType) {
      case 'Earn':
        iconPath = isSelected ? AppImages.earnIcon : AppImages.inactiveEarnIcon;
        break;
      case 'My Offers':
        iconPath = isSelected
            ? AppImages.myOffersIcon
            : AppImages.inactiveMyOffersIcon;
        break;
      case 'Cashout':
        iconPath = isSelected
            ? AppImages.cashoutIcon
            : AppImages.inactiveCashoutIcon;
        break;
      case 'Profile':
        iconPath = isSelected
            ? AppImages.profileIcon
            : AppImages.inactiveProfileIcon;
        break;
      default:
        iconPath = AppImages.inactiveEarnIcon; // fallback
    }

    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.primaryPurple.withValues(alpha: 0.8)
                    : AppColors.textTertiary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.primaryPurple
                    : AppColors.textTertiary,
                fontSize: 11.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
