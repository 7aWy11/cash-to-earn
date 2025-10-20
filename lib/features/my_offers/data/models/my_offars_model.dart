/// Activity Item Model - Represents a completed offer/task
class ActivityItem {
  final String id;
  final String title;
  final String category;
  final String timeAgo;
  final String reward;
  final String status;
  final String? imageUrl;

  const ActivityItem({
    required this.id,
    required this.title,
    required this.category,
    required this.timeAgo,
    required this.reward,
    required this.status,
    this.imageUrl,
  });

  // Sample data
  static List<ActivityItem> sampleActivities = [
    ActivityItem(
      id: '1',
      title: 'Notik - Mini Games: Calm & Relax',
      category: 'Game',
      timeAgo: '2 hours ago',
      reward: '\$565555.40',
      status: 'Completed',
      imageUrl: null,
    ),
    ActivityItem(
      id: '2',
      title: 'Notik - Mini Games: Calm & Relax',
      category: 'Game',
      timeAgo: '2 hours ago',
      reward: '\$56.40',
      status: 'Completed',
      imageUrl: null,
    ),
    ActivityItem(
      id: '3',
      title: 'Survey Master - Quick Poll',
      category: 'Survey',
      timeAgo: '5 hours ago',
      reward: '\$12.50',
      status: 'Completed',
      imageUrl: null,
    ),
    ActivityItem(
      id: '4',
      title: 'Daily Check-in Bonus',
      category: 'Task',
      timeAgo: '1 day ago',
      reward: '\$0.50',
      status: 'Completed',
      imageUrl: null,
    ),
    ActivityItem(
      id: '5',
      title: 'Gaming Challenge Level 10',
      category: 'Game',
      timeAgo: '2 days ago',
      reward: '\$25.00',
      status: 'Completed',
      imageUrl: null,
    ),
    ActivityItem(
      id: '6',
      title: 'Product Review Survey',
      category: 'Survey',
      timeAgo: '3 days ago',
      reward: '\$8.75',
      status: 'Completed',
      imageUrl: null,
    ),
    ActivityItem(
      id: '7',
      title: 'Product Review Survey',
      category: 'Survey',
      timeAgo: '3 days ago',
      reward: '\$8.75',
      status: 'Completed',
      imageUrl: null,
    ),
    ActivityItem(
      id: '8',
      title: 'Product Review Survey',
      category: 'Survey',
      timeAgo: '3 days ago',
      reward: '\$8.75',
      status: 'Completed',
      imageUrl: null,
    ),
    ActivityItem(
      id: '9',
      title: 'Product Review Survey',
      category: 'Survey',
      timeAgo: '3 days ago',
      reward: '\$8.75',
      status: 'Completed',
      imageUrl: null,
    ),
  ];
}
