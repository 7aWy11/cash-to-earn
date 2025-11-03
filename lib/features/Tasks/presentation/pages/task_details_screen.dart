import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../data/models/task_model.dart';
import '../widgets/task_description_section.dart';
import '../widgets/task_header_card.dart';
import '../widgets/task_instructions_section.dart';
import '../widgets/task_submission_section.dart';

/// Task Details Screen - Shows full task information with submission
class TaskDetailsScreen extends StatefulWidget {
  final TaskModel? task;

  const TaskDetailsScreen({super.key, this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final image = await ImagePickerWidget.pickImageFromGallery();
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _handleInstallLinkTap() {
    // TODO: Implement navigation to install link
  }

  void _handleSubmit() {
    // TODO: Implement task submission logic
  }

  @override
  Widget build(BuildContext context) {
    // Use default values if task is null
    final task =
        widget.task ??
        TaskModel(
          id: '20',
          title: StringConstants.taskTitleExample,
          description: StringConstants.taskDescriptionExample,
          reward: 500.0,
          status: 'active',
          instructions: [
            StringConstants.instructionStep1,
            StringConstants.instructionStep2,
            StringConstants.instructionStep3,
            StringConstants.instructionStep4,
          ],
          createdAt: DateTime.now(),
          deadline: DateTime.now().add(const Duration(days: 7)),
        );

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
            TaskHeaderCard(task: task),

            SizedBox(height: AppConstants.defaultPadding.h),

            // Task Description
            TaskDescriptionSection(description: task.description),

            SizedBox(height: AppConstants.defaultPadding.h),

            // Instructions
            TaskInstructionsSection(
              instructions: task.instructions,
              installLink: task.installLink,
              onInstallLinkTap: _handleInstallLinkTap,
            ),

            SizedBox(height: AppConstants.defaultPadding.h),

            // Submission
            TaskSubmissionSection(
              selectedImage: _selectedImage,
              onPickImage: _pickImage,
            ),

            SizedBox(height: 24.h),

            // Submit Button
            CustomButton(
              text: StringConstants.submitTask,
              onPressed: _selectedImage != null ? _handleSubmit : null,
              width: double.infinity,
              height: 50.h,
              backgroundColor: _selectedImage != null
                  ? AppColors.vibrantBlue
                  : AppColors.textDisabled,
            ),
          ],
        ),
      ),
    );
  }
}
