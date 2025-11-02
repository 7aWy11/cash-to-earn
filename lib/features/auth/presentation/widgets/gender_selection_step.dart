import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';

/// Gender selection step widget
class GenderSelectionStep extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String> onGenderSelected;

  const GenderSelectionStep({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGenderOption(
          iconPath: AppImages.male,
          label: 'Male',
          value: 'male',
        ),
        SizedBox(height: 12.h),
        _buildGenderOption(
          iconPath: AppImages.female,
          label: 'Female',
          value: 'female',
        ),
      ],
    );
  }

  Widget _buildGenderOption({
    required String iconPath,
    required String label,
    required String value,
  }) {
    final isSelected = selectedGender == value;

    return InkWell(
      onTap: () => onGenderSelected(value),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryPurpleDark.withValues(alpha: 0.4)
              : AppColors.primaryPurpleDark.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryPurple
                : Colors.white.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 20.w,
              height: 20.h,
              color: AppColors.white,
            ),
            SizedBox(width: 12.w),
            Text(
              label,
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
            ),
            const Spacer(),
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryPurple
                      : Colors.white.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryPurple,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
