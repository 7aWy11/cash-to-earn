import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/string_constants.dart';
import 'instruction_step_widget.dart';

/// Task Instructions Section Widget
class TaskInstructionsSection extends StatelessWidget {
  final List<String> instructions;
  final String? installLink;
  final VoidCallback? onInstallLinkTap;

  const TaskInstructionsSection({
    super.key,
    required this.instructions,
    this.installLink,
    this.onInstallLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.defaultPadding.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.list_alt, color: AppColors.warningOrange, size: 20.sp),
              SizedBox(width: 8.w),
              Text(StringConstants.instructions, style: AppTextStyles.h6),
            ],
          ),
          SizedBox(height: 12.h),
          ...List.generate(
            instructions.length,
            (index) => InstructionStepWidget(
              number: index + 1,
              text: instructions[index],
            ),
          ),
          if (installLink != null) ...[
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: onInstallLinkTap,
              child: Text(
                StringConstants.clickHereToInstall,
                style: AppTextStyles.link,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
