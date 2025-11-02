import '../../../../core/constants/app_constants.dart';
import '../models/task_model.dart';

/// Mock data for tasks (to be replaced with API calls)
class MockTasksData {
  static List<TaskModel> getSampleTasks() {
    return [
      TaskModel(
        id: '1',
        title: 'Install our Android app',
        description:
            'Install Gamers Universe app from the Play Store and take a screenshot of the installed app.',
        reward: 500.0,
        status: 'active',
        instructions: [
          'Click on the link below',
          'Install the Gamers Universe app',
          'Take a screenshot of the app',
          'Upload the screenshot below',
        ],
        installLink: 'https://play.google.com/store',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        deadline: DateTime.now().add(const Duration(days: 5)),
      ),
      TaskModel(
        id: '2',
        title: 'Watch promotional video',
        description:
            'Watch our 2-minute promotional video and answer a simple question.',
        reward: 200.0,
        status: AppConstants.offerStatusInProgress,
        instructions: [
          'Click on the video link',
          'Watch the entire video',
          'Answer the quiz question',
          'Submit your answer',
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        deadline: DateTime.now().add(const Duration(days: 3)),
      ),
      TaskModel(
        id: '3',
        title: 'Complete survey',
        description:
            'Complete a short 5-minute survey about your app usage preferences.',
        reward: 350.0,
        status: 'active',
        instructions: [
          'Click on survey link',
          'Answer all questions honestly',
          'Submit the survey',
          'Take screenshot of completion',
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 12)),
        deadline: DateTime.now().add(const Duration(days: 7)),
      ),
      TaskModel(
        id: '4',
        title: 'Sign up for free trial',
        description:
            'Sign up for a free trial of our partner service and verify your email.',
        reward: 750.0,
        status: 'active',
        instructions: [
          'Visit partner website',
          'Sign up with your email',
          'Verify your email address',
          'Take screenshot of confirmation',
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
        deadline: DateTime.now().add(const Duration(days: 10)),
      ),
      TaskModel(
        id: '5',
        title: 'Share on social media',
        description:
            'Share our app on your social media and get your friends to download.',
        reward: 1000.0,
        status: AppConstants.offerStatusCompleted,
        instructions: [
          'Share app link on social media',
          'Tag at least 3 friends',
          'Take screenshot of post',
          'Upload the screenshot',
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        deadline: DateTime.now().subtract(const Duration(days: 1)),
      ),
      TaskModel(
        id: '6',
        title: 'Rate us on Play Store',
        description:
            'Rate our app 5 stars on the Google Play Store and leave a review.',
        reward: 300.0,
        status: AppConstants.offerStatusPending,
        instructions: [
          'Open Play Store',
          'Find our app',
          'Rate 5 stars',
          'Write a positive review',
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        deadline: DateTime.now().add(const Duration(days: 14)),
      ),
    ];
  }
}
