import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/widgets/custom_list_view_builder.dart';
import '../../data/models/in_app_task.dart';
import 'in_app_taskes_card.dart';

class InAppTasksList extends StatelessWidget {
  final List<InAppTask> tasks;
  final double height;
  final Function(InAppTask)? onTaskTap;
  final EdgeInsetsGeometry? padding;
  final double spacing;

  const InAppTasksList({
    super.key,
    required this.tasks,
    this.height = 220,
    this.onTaskTap,
    this.padding,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return _buildEmptyState();
    }

    return CustomListViewBuilder.horizontal(
      itemCount: tasks.length > 2 ? 2 : tasks.length,
      height: height,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return SizedBox(
          width: 176.w,
          child: GestureDetector(
            onTap: () => onTaskTap?.call(task),
            child: InAppTaskesCard(
              title: task.title,
              description: task.description,
              reward: task.reward,
              imageUrl: task.imageUrl,
            ),
          ),
        );
      },
      spacing: spacing,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.task_alt_outlined,
              color: AppColors.textSecondary,
              size: 48.sp,
            ),
            SizedBox(height: 12.h),
            Text(
              'No tasks available',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
