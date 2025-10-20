class InAppTask {
  final String id;
  final String title;
  final String description;
  final String reward;
  final String? imageUrl;
  final String? category;
  final bool isCompleted;

  const InAppTask({
    required this.id,
    required this.title,
    required this.description,
    required this.reward,
    this.imageUrl,
    this.category,
    this.isCompleted = false,
  });

  // Sample data for demonstration
  static List<InAppTask> get sampleTasks => [
    const InAppTask(
      id: '1',
      title: 'Daily Check-in',
      description: 'Login daily to earn bonus',
      reward: '\$0.50',
      category: 'Daily',
    ),
    const InAppTask(
      id: '2',
      title: 'Play 3 Games',
      description: 'Complete gaming challenges',
      reward: '\$2.00',
      category: 'Gaming',
    ),
    const InAppTask(
      id: '3',
      title: 'Watch 5 Ads',
      description: 'Watch video advertisements',
      reward: '\$1.25',
      category: 'Watching',
    ),
    const InAppTask(
      id: '4',
      title: 'Complete Survey',
      description: 'Answer questions about products',
      reward: '\$3.50',
      category: 'Survey',
    ),
    const InAppTask(
      id: '5',
      title: 'Share on Social',
      description: 'Share app on social media',
      reward: '\$0.75',
      category: 'Social',
    ),
    const InAppTask(
      id: '6',
      title: 'Refer Friend',
      description: 'Invite friends to join',
      reward: '\$5.00',
      category: 'Referral',
    ),
    const InAppTask(
      id: '7',
      title: 'Install App',
      description: 'Download and open app',
      reward: '\$1.50',
      category: 'Installation',
    ),
    const InAppTask(
      id: '8',
      title: 'Write Review',
      description: 'Leave app store review',
      reward: '\$2.50',
      category: 'Review',
    ),
  ];
}

