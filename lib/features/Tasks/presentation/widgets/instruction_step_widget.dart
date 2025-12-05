import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

/// Instruction Step Widget for displaying numbered steps
class InstructionStepWidget extends StatelessWidget {
  final int number;
  final String text;
  final Color? color;

  const InstructionStepWidget({
    super.key,
    required this.number,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final stepColor = color ?? AppColors.warningOrange;

    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: stepColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              border: Border.all(color: stepColor),
            ),
            child: Center(
              child: Text(
                '$number',
                style: AppTextStyles.captionBold.copyWith(color: stepColor),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(child: Text(text, style: AppTextStyles.bodySmallSecondary)),
        ],
      ),
    );
  }
}
