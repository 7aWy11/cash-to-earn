import '../../data/models/task_model.dart';
import '../../presentation/enums/task_filter_type.dart';

/// Extension methods for List<TaskModel>
extension TaskListExtension on List<TaskModel> {
  /// Filter tasks based on the selected filter type
  List<TaskModel> filterByType(TaskFilterType filterType) {
    if (filterType == TaskFilterType.all) {
      return this;
    }

    final statusValue = filterType.statusValue;
    if (statusValue == null) return this;

    return where((task) => task.status == statusValue).toList();
  }
}
