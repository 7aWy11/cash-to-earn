import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../config/theme/app_colors.dart';
import '../config/theme/app_text_styles.dart';
import '../constants/app_constants.dart';

/// Reusable Image Picker Widget
class ImagePickerWidget extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onPickImage;
  final String? emptyStateText;
  final String? selectedStateText;
  final double? previewHeight;

  const ImagePickerWidget({
    super.key,
    required this.selectedImage,
    required this.onPickImage,
    this.emptyStateText,
    this.selectedStateText,
    this.previewHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Upload Button
        GestureDetector(
          onTap: onPickImage,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppConstants.defaultPadding.w),
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.border,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.cloud_upload,
                  color: AppColors.textTertiary,
                  size: 40.sp,
                ),
                SizedBox(height: 8.h),
                Text(
                  selectedImage == null
                      ? (emptyStateText ?? 'Choose File')
                      : (selectedStateText ?? 'File Selected'),
                  style: AppTextStyles.bodyMediumSecondary,
                ),
              ],
            ),
          ),
        ),

        // Preview selected image
        if (selectedImage != null) ...[
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.file(
              selectedImage!,
              height: previewHeight ?? 150.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ],
    );
  }

  /// Static method to pick image from gallery
  static Future<File?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  /// Static method to pick image from camera
  static Future<File?> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
