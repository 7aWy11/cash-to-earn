import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import 'custom_checkbox.dart';

class TermsAndConditionsCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const TermsAndConditionsCheckbox({super.key, required this.onChanged});

  @override
  TermsAndConditionsCheckboxState createState() =>
      TermsAndConditionsCheckboxState();
}

class TermsAndConditionsCheckboxState
    extends State<TermsAndConditionsCheckbox> {
  bool isTermsAccept = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          onChecked: (value) {
            isTermsAccept = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccept,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.7),
                fontSize: 14.sp,
              ),
              children: [
                TextSpan(text: 'I agree to the '),
                TextSpan(
                  text: 'Terms of Service',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
