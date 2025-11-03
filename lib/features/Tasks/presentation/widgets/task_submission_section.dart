import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/widgets/image_picker_widget.dart';

/// Task Submission Section Widget
class TaskSubmissionSection extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onPickImage;

  const TaskSubmissionSection({
    super.key,
    required this.selectedImage,
    required this.onPickImage,
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
              Icon(
                Icons.upload_file,
                color: AppColors.successGreen,
                size: 20.sp,
              ),
              SizedBox(width: 8.w),
              Text(StringConstants.uploadProof, style: AppTextStyles.h6),
            ],
          ),
          SizedBox(height: 12.h),

          // Image Picker Widget
          ImagePickerWidget(
            selectedImage: selectedImage,
            onPickImage: onPickImage,
            emptyStateText: StringConstants.chooseFile,
            selectedStateText: StringConstants.fileSelected,
          ),
        ],
      ),
    );
  }
}
