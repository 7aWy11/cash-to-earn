import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/enums/task_filter_type.dart';

/// Widget for displaying task filter chips
class TaskFilterChips extends StatelessWidget {
  final TaskFilterType selectedFilter;
  final ValueChanged<TaskFilterType> onFilterChanged;

  const TaskFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
      child: Row(
        children: TaskFilterType.values
            .map(
              (filter) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: _buildFilterChip(filter),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildFilterChip(TaskFilterType filter) {
    final isSelected = selectedFilter == filter;
    return FilterChip(
      label: Text(filter.label),
      selected: isSelected,
      onSelected: (_) => onFilterChanged(filter),
      backgroundColor: AppColors.backgroundCard,
      selectedColor: AppColors.primaryPurple,
      checkmarkColor: AppColors.white,
      labelStyle: AppTextStyles.bodySmall.copyWith(
        color: isSelected ? AppColors.white : AppColors.textSecondary,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.primaryPurple : AppColors.border,
      ),
    );
  }
}
