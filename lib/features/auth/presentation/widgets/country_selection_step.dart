import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

/// Country selection step widget
class CountrySelectionStep extends StatelessWidget {
  final Country? selectedCountry;
  final ValueChanged<Country> onCountrySelected;

  const CountrySelectionStep({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is your country?',
          style: AppTextStyles.h6.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 12.h),
        InkWell(
          onTap: () => _showCountryPicker(context),
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.primaryPurpleDark.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppColors.primaryPurple.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                if (selectedCountry != null) ...[
                  Text(
                    selectedCountry!.flagEmoji,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(width: 12.w),
                ],
                Expanded(
                  child: Text(
                    selectedCountry?.name ?? 'Select your country',
                    style: TextStyle(
                      color: selectedCountry != null
                          ? AppColors.white
                          : AppColors.white,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: AppColors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showCountryPicker(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      countryListTheme: CountryListThemeData(
        backgroundColor: const Color(0xFF1A1A2E),
        textStyle: const TextStyle(color: Colors.white),
        searchTextStyle: const TextStyle(color: Colors.white),
        inputDecoration: InputDecoration(
          hintText: 'Search country',
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(Icons.search, color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      onSelect: onCountrySelected,
    );
  }
}
