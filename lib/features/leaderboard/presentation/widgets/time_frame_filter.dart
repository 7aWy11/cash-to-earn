import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../enums/time_frame.dart';

class TimeFrameFilter extends StatelessWidget {
  final TimeFrame currentTimeFrame;
  final ValueChanged<TimeFrame> onTimeFrameChanged;

  const TimeFrameFilter({
    super.key,
    required this.currentTimeFrame,
    required this.onTimeFrameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: TimeFrame.values
            .map((timeFrame) => _buildFilterChip(timeFrame))
            .toList(),
      ),
    );
  }

  Widget _buildFilterChip(TimeFrame timeFrame) {
    final isSelected = timeFrame == currentTimeFrame;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTimeFrameChanged(timeFrame),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryPurple : AppColors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text(
              timeFrame.label,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.white : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
