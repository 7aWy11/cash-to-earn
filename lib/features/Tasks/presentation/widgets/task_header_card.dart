import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../data/models/task_model.dart';
import 'task_info_chip.dart';
import 'task_status_badge.dart';

/// Task Header Card Widget
class TaskHeaderCard extends StatelessWidget {
  final TaskModel task;

  const TaskHeaderCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
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
            color: AppColors.black.withValues(alpha: 0.3),
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
            task.title,
            style: AppTextStyles.h3.copyWith(color: AppColors.infoCyan),
          ),
          SizedBox(height: 12.h),

          // Task ID and Reward
          Row(
            children: [
              TaskInfoChip(
                text: '${StringConstants.taskId}: #${task.id}',
                color: AppColors.errorRed,
              ),
              SizedBox(width: 8.w),
              TaskInfoChip(
                text:
                    '${StringConstants.reward}: ${task.reward.toStringAsFixed(2)} ${StringConstants.coins}',
                color: AppColors.warningOrange,
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Status Badge
          TaskStatusBadge(status: task.status),
        ],
      ),
    );
  }
}
