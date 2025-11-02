import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../data/models/task_model.dart';
import 'task_status_badge.dart';

/// Task List Card Widget - Displays task information in list
class TaskListCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onTap;

  const TaskListCard({super.key, required this.task, required this.onTap});

  Color _getStatusColor() {
    switch (task.status.toLowerCase()) {
      case AppConstants.offerStatusCompleted:
        return AppColors.successGreen;
      case AppConstants.offerStatusInProgress:
        return AppColors.warningOrange;
      case AppConstants.offerStatusPending:
        return AppColors.infoCyan;
      case AppConstants.offerStatusRejected:
        return AppColors.errorRed;
      case 'active':
        return AppColors.vibrantBlue;
      default:
        return AppColors.vibrantBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius.r),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row with Status Badge
            Row(
              children: [
                // Task ID
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getStatusColor().withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    '#${task.id}',
                    style: AppTextStyles.captionBold.copyWith(
                      color: _getStatusColor(),
                    ),
                  ),
                ),
                const Spacer(),
                TaskStatusBadge(status: task.status),
              ],
            ),

            SizedBox(height: 12.h),

            // Task Title
            Text(
              task.title,
              style: AppTextStyles.h6,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 8.h),

            // Task Description
            Text(
              task.description,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 12.h),

            // Reward and Deadline Row
            Row(
              children: [
                // Reward
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.goldYellow.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.goldYellow.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.toll,
                        color: AppColors.goldYellow,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${task.reward.toStringAsFixed(0)} ${StringConstants.coins}',
                        style: AppTextStyles.captionBold.copyWith(
                          color: AppColors.goldYellow,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Deadline
                if (task.deadline != null)
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: AppColors.textTertiary,
                        size: 14.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        _formatDeadline(task.deadline!),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            // Divider
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(color: AppColors.border, height: 1.h),
            ),

            // Footer with Steps Count and Arrow
            Row(
              children: [
                Icon(
                  Icons.list_alt,
                  color: AppColors.textTertiary,
                  size: 16.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  '${task.instructions.length} steps',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textTertiary,
                  size: 14.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDeadline(DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now);

    if (difference.isNegative) {
      return 'Expired';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d left';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h left';
    } else {
      return '${difference.inMinutes}m left';
    }
  }
}
