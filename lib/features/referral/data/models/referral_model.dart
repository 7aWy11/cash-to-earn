/// Referral Model - Represents a single referral
///
/// TODO for Backend Developer:
/// - This model should match your API response structure
/// - Add any additional fields from your backend
/// - Implement fromJson() and toJson() methods for API integration
/// - Example API Response:
///   {
///     "id": "1",
///     "user_name": "Ahmed Mohamed",
///     "user_avatar": "https://example.com/avatar.jpg",
///     "joined_date": "2025-11-01T10:30:00Z",
///     "earned_reward": 50.0,
///     "status": "completed"
///   }
class ReferralModel {
  final String id;
  final String userName;
  final String userAvatar; // Profile picture URL
  final DateTime joinedDate;
  final double earnedReward; // Reward earned from this referral
  final String status; // 'pending', 'completed', 'rejected'

  ReferralModel({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.joinedDate,
    required this.earnedReward,
    required this.status,
  });

  /// TODO: Implement when backend is ready
  /// Factory constructor to create ReferralModel from JSON
  // factory ReferralModel.fromJson(Map<String, dynamic> json) {
  //   return ReferralModel(
  //     id: json['id'] as String,
  //     userName: json['user_name'] as String,
  //     userAvatar: json['user_avatar'] as String,
  //     joinedDate: DateTime.parse(json['joined_date'] as String),
  //     earnedReward: (json['earned_reward'] as num).toDouble(),
  //     status: json['status'] as String,
  //   );
  // }

  /// TODO: Implement when backend is ready
  /// Convert ReferralModel to JSON for API requests
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'user_name': userName,
  //     'user_avatar': userAvatar,
  //     'joined_date': joinedDate.toIso8601String(),
  //     'earned_reward': earnedReward,
  //     'status': status,
  //   };
  // }

  /// Copy with method for immutability
  ReferralModel copyWith({
    String? id,
    String? userName,
    String? userAvatar,
    DateTime? joinedDate,
    double? earnedReward,
    String? status,
  }) {
    return ReferralModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      joinedDate: joinedDate ?? this.joinedDate,
      earnedReward: earnedReward ?? this.earnedReward,
      status: status ?? this.status,
    );
  }
}
