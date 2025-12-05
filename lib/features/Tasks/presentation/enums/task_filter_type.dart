import '../../../../core/constants/app_constants.dart';

/// Enum for task filter types
enum TaskFilterType {
  all,
  active,
  inProgress,
  completed;

  /// Get display label for the filter
  String get label {
    switch (this) {
      case TaskFilterType.all:
        return 'All';
      case TaskFilterType.active:
        return 'Active';
      case TaskFilterType.inProgress:
        return 'In Progress';
      case TaskFilterType.completed:
        return 'Completed';
    }
  }

  /// Get the status value for filtering
  String? get statusValue {
    switch (this) {
      case TaskFilterType.all:
        return null;
      case TaskFilterType.active:
        return 'active';
      case TaskFilterType.inProgress:
        return AppConstants.offerStatusInProgress;
      case TaskFilterType.completed:
        return AppConstants.offerStatusCompleted;
    }
  }
}
