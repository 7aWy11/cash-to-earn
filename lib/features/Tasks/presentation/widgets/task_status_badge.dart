import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

/// Status Badge Widget for displaying task status
class TaskStatusBadge extends StatelessWidget {
  final String status;

  const TaskStatusBadge({super.key, required this.status});

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case AppConstants.offerStatusCompleted:
        return AppColors.successGreen;
      case AppConstants.offerStatusInProgress:
        return AppColors.warningOrange;
      case AppConstants.offerStatusPending:
        return AppColors.infoCyan;
      case AppConstants.offerStatusRejected:
        return AppColors.errorRed;
      case AppConstants.offerStatusPaid:
        return AppColors.goldYellow;
      default:
        return AppColors.successGreen;
    }
  }

  IconData _getStatusIcon() {
    switch (status.toLowerCase()) {
      case AppConstants.offerStatusCompleted:
        return Icons.check_circle;
      case AppConstants.offerStatusInProgress:
        return Icons.pending;
      case AppConstants.offerStatusPending:
        return Icons.hourglass_empty;
      case AppConstants.offerStatusRejected:
        return Icons.cancel;
      case AppConstants.offerStatusPaid:
        return Icons.paid;
      default:
        return Icons.check_circle;
    }
  }

  String _getStatusText() {
    switch (status.toLowerCase()) {
      case AppConstants.offerStatusCompleted:
        return 'Completed';
      case AppConstants.offerStatusInProgress:
        return 'In Progress';
      case AppConstants.offerStatusPending:
        return 'Pending';
      case AppConstants.offerStatusRejected:
        return 'Rejected';
      case AppConstants.offerStatusPaid:
        return 'Paid';
      default:
        return 'Active';
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: statusColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getStatusIcon(), color: statusColor, size: 16.sp),
          SizedBox(width: 4.w),
          Text(
            _getStatusText(),
            style: AppTextStyles.captionBold.copyWith(color: statusColor),
          ),
        ],
      ),
    );
  }
}
