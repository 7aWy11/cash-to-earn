import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/router/route_names.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/task_model.dart';
import 'task_list_card.dart';

/// Widget for displaying the list of tasks
class TasksList extends StatelessWidget {
  final List<TaskModel> tasks;

  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: TaskListCard(
            task: task,
            onTap: () {
              context.push(RouteNames.taskDetails, extra: task);
            },
          ),
        );
      },
    );
  }
}
