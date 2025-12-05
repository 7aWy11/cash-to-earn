import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/cstom_empty_page.dart';
import '../../data/mock/mock_tasks_data.dart';
import '../../data/models/task_model.dart';
import '../enums/task_filter_type.dart';
import '../../domain/extensions/task_list_extension.dart';
import '../widgets/task_filter_chips.dart';
import '../widgets/tasks_list.dart';

/// Tasks List Screen - Shows all available tasks
class TaskesScreen extends StatefulWidget {
  const TaskesScreen({super.key});

  @override
  State<TaskesScreen> createState() => _TaskesScreenState();
}

class _TaskesScreenState extends State<TaskesScreen> {
  late final List<TaskModel> _tasks;
  TaskFilterType _selectedFilter = TaskFilterType.all;

  @override
  void initState() {
    super.initState();
    // TODO: Replace with API call
    _tasks = MockTasksData.getSampleTasks();
  }

  List<TaskModel> get _filteredTasks => _tasks.filterByType(_selectedFilter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Available Tasks', style: AppTextStyles.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          // Filter Chips
          TaskFilterChips(
            selectedFilter: _selectedFilter,
            onFilterChanged: (filter) {
              setState(() {
                _selectedFilter = filter;
              });
            },
          ),

          SizedBox(height: 16.h),

          // Tasks List
          Expanded(
            child: _filteredTasks.isEmpty
                ? const EmptyPage(
                    icon: Icons.task_alt,
                    title: 'No tasks found',
                    subtitle: 'Try changing the filter',
                  )
                : TasksList(tasks: _filteredTasks),
          ),
        ],
      ),
    );
  }
}
