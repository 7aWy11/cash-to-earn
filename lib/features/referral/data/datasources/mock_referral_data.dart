import '../models/referral_model.dart';
import '../models/referral_stats_model.dart';

/// Mock Referral Data for UI Development
///
/// TODO for Backend Developer:
/// - Replace this entire file with actual API calls
/// - Required API Endpoints:
///   * GET /api/referral/stats - Get user's referral statistics
///   * GET /api/referral/history - Get list of referrals with pagination
///   * POST /api/referral/share - Track share actions (optional for analytics)
///
/// - Expected Headers:
///   * Authorization: Bearer {token}
///   * Content-Type: application/json
///
/// - Error Handling:
///   * 401 - Unauthorized (token expired)
///   * 404 - User not found
///   * 500 - Server error
class MockReferralData {
  /// Mock Stats Data
  /// TODO: Replace with API call to GET /api/referral/stats
  static ReferralStatsModel getMockStats() {
    return ReferralStatsModel(
      referralCode: 'CASH2EARN123',
      referralLink: 'https://cashto.earn/ref/CASH2EARN123',
      totalReferrals: 15,
      pendingReferrals: 3,
      totalEarned: 750.0, // 15 * 50 coins
      rewardPerReferral: 50.0,
    );
  }

  /// Mock Referral History
  /// TODO: Replace with API call to GET /api/referral/history?page=1&limit=10
  static List<ReferralModel> getMockReferrals() {
    return [
      ReferralModel(
        id: '1',
        userName: 'Ahmed Mohamed',
        userAvatar: 'https://i.pravatar.cc/150?img=1',
        joinedDate: DateTime.now().subtract(const Duration(days: 2)),
        earnedReward: 50.0,
        status: 'completed',
      ),
      ReferralModel(
        id: '2',
        userName: 'Sara Ali',
        userAvatar: 'https://i.pravatar.cc/150?img=5',
        joinedDate: DateTime.now().subtract(const Duration(days: 5)),
        earnedReward: 50.0,
        status: 'completed',
      ),
      ReferralModel(
        id: '3',
        userName: 'Mohamed Hassan',
        userAvatar: 'https://i.pravatar.cc/150?img=3',
        joinedDate: DateTime.now().subtract(const Duration(days: 1)),
        earnedReward: 0.0,
        status: 'pending',
      ),
      ReferralModel(
        id: '4',
        userName: 'Fatima Zahra',
        userAvatar: 'https://i.pravatar.cc/150?img=9',
        joinedDate: DateTime.now().subtract(const Duration(days: 7)),
        earnedReward: 50.0,
        status: 'completed',
      ),
      ReferralModel(
        id: '5',
        userName: 'Omar Khaled',
        userAvatar: 'https://i.pravatar.cc/150?img=12',
        joinedDate: DateTime.now().subtract(const Duration(days: 10)),
        earnedReward: 50.0,
        status: 'completed',
      ),
      ReferralModel(
        id: '6',
        userName: 'Nour Ahmed',
        userAvatar: 'https://i.pravatar.cc/150?img=16',
        joinedDate: DateTime.now().subtract(const Duration(hours: 5)),
        earnedReward: 0.0,
        status: 'pending',
      ),
    ];
  }

  /// Simulate API delay
  /// TODO: Remove this when using real API
  static Future<void> simulateDelay() async {
    await Future.delayed(const Duration(milliseconds: 800));
  }
}
