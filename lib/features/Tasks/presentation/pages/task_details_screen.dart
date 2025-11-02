import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/task_model.dart';

/// Task Details Screen - Shows full task information with submission
class TaskDetailsScreen extends StatefulWidget {
  final TaskModel? task;

  const TaskDetailsScreen({super.key, this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(StringConstants.taskDetails, style: AppTextStyles.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Header Card
            _buildTaskHeaderCard(),

            SizedBox(height: AppConstants.defaultPadding.h),

            // Task Description Card
            _buildDescriptionCard(),

            SizedBox(height: AppConstants.defaultPadding.h),

            // Instructions Card
            _buildInstructionsCard(),

            SizedBox(height: AppConstants.defaultPadding.h),

            // Submission Card
            _buildSubmissionCard(),

            SizedBox(height: 24.h),

            // Submit Button
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskHeaderCard() {
    final task = widget.task;
    final taskTitle = task?.title ?? StringConstants.taskTitleExample;
    final taskId = task?.id ?? '20';
    final taskReward = task?.reward ?? 500.0;
    final taskStatus = task?.status ?? 'active';

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.vibrantBlueDark, AppColors.primaryPurpleDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Task Title
          Text(
            taskTitle,
            style: AppTextStyles.h3.copyWith(color: AppColors.infoCyan),
          ),
          SizedBox(height: 12.h),

          // Task ID and Reward
          Row(
            children: [
              _buildInfoChip(
                '${StringConstants.taskId}: #$taskId',
                AppColors.errorRed,
              ),
              SizedBox(width: 8.w),
              _buildInfoChip(
                '${StringConstants.reward}: ${taskReward.toStringAsFixed(2)} ${StringConstants.coins}',
                AppColors.warningOrange,
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Status Badge
          _buildStatusBadge(taskStatus),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (status.toLowerCase()) {
      case AppConstants.offerStatusCompleted:
        statusColor = AppColors.successGreen;
        statusIcon = Icons.check_circle;
        statusText = 'Completed';
        break;
      case AppConstants.offerStatusInProgress:
        statusColor = AppColors.warningOrange;
        statusIcon = Icons.pending;
        statusText = 'In Progress';
        break;
      case AppConstants.offerStatusPending:
        statusColor = AppColors.infoCyan;
        statusIcon = Icons.hourglass_empty;
        statusText = 'Pending';
        break;
      case 'active':
        statusColor = AppColors.successGreen;
        statusIcon = Icons.check_circle;
        statusText = StringConstants.active;
        break;
      default:
        statusColor = AppColors.successGreen;
        statusIcon = Icons.check_circle;
        statusText = StringConstants.active;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: statusColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusIcon, color: statusColor, size: 16.sp),
          SizedBox(width: 4.w),
          Text(
            statusText,
            style: AppTextStyles.captionBold.copyWith(color: statusColor),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        text,
        style: AppTextStyles.captionBold.copyWith(color: color),
      ),
    );
  }

  Widget _buildDescriptionCard() {
    final description =
        widget.task?.description ?? StringConstants.taskDescriptionExample;

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
              Icon(Icons.description, color: AppColors.infoCyan, size: 20.sp),
              SizedBox(width: 8.w),
              Text(StringConstants.description, style: AppTextStyles.h6),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            style: AppTextStyles.bodyMediumSecondary.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionsCard() {
    final instructions =
        widget.task?.instructions ??
        [
          StringConstants.instructionStep1,
          StringConstants.instructionStep2,
          StringConstants.instructionStep3,
          StringConstants.instructionStep4,
        ];
    final installLink = widget.task?.installLink;

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
            (index) => _buildInstructionStep(index + 1, instructions[index]),
          ),
          if (installLink != null) ...[
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () {
                // TODO: Implement navigation to install link
                // You can use url_launcher package here
              },
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

  Widget _buildInstructionStep(int number, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: AppColors.warningOrange.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.warningOrange),
            ),
            child: Center(
              child: Text(
                '$number',
                style: AppTextStyles.captionBold.copyWith(
                  color: AppColors.warningOrange,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(child: Text(text, style: AppTextStyles.bodySmallSecondary)),
        ],
      ),
    );
  }

  Widget _buildSubmissionCard() {
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

          // Upload Button
          GestureDetector(
            onTap: _pickImage,
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
                    _selectedImage == null
                        ? StringConstants.chooseFile
                        : StringConstants.fileSelected,
                    style: AppTextStyles.bodyMediumSecondary,
                  ),
                ],
              ),
            ),
          ),

          // Preview selected image
          if (_selectedImage != null) ...[
            SizedBox(height: 12.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.file(
                _selectedImage!,
                height: 150.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return CustomButton(
      text: StringConstants.submitTask,
      onPressed: _selectedImage != null
          ? () {
              // TODO: Implement task submission logic
            }
          : null,
      width: double.infinity,
      height: 50.h,
      backgroundColor: _selectedImage != null
          ? AppColors.vibrantBlue
          : AppColors.textDisabled,
    );
  }
}
