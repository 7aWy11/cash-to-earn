/// Referral Stats Model - User's referral statistics
///
/// TODO for Backend Developer:
/// - This should come from GET /api/referral/stats endpoint
/// - Update fields based on your backend response
/// - Implement fromJson() for API integration
/// - Example API Response:
///   {
///     "referral_code": "CASH2EARN123",
///     "referral_link": "https://cashto.earn/ref/CASH2EARN123",
///     "total_referrals": 15,
///     "pending_referrals": 3,
///     "total_earned": 750.0,
///     "reward_per_referral": 50.0
///   }
class ReferralStatsModel {
  final String referralCode; // User's unique referral code
  final String referralLink; // Full shareable link
  final int totalReferrals; // Total successful referrals
  final int pendingReferrals; // Pending verification
  final double totalEarned; // Total coins earned from referrals
  final double rewardPerReferral; // Reward amount per successful referral

  ReferralStatsModel({
    required this.referralCode,
    required this.referralLink,
    required this.totalReferrals,
    required this.pendingReferrals,
    required this.totalEarned,
    required this.rewardPerReferral,
  });

  /// TODO: Implement when backend is ready
  /// Factory constructor to create ReferralStatsModel from JSON
  // factory ReferralStatsModel.fromJson(Map<String, dynamic> json) {
  //   return ReferralStatsModel(
  //     referralCode: json['referral_code'] as String,
  //     referralLink: json['referral_link'] as String,
  //     totalReferrals: json['total_referrals'] as int,
  //     pendingReferrals: json['pending_referrals'] as int,
  //     totalEarned: (json['total_earned'] as num).toDouble(),
  //     rewardPerReferral: (json['reward_per_referral'] as num).toDouble(),
  //   );
  // }

  /// TODO: Implement when backend is ready
  /// Convert ReferralStatsModel to JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'referral_code': referralCode,
  //     'referral_link': referralLink,
  //     'total_referrals': totalReferrals,
  //     'pending_referrals': pendingReferrals,
  //     'total_earned': totalEarned,
  //     'reward_per_referral': rewardPerReferral,
  //   };
  // }

  /// Copy with method for immutability
  ReferralStatsModel copyWith({
    String? referralCode,
    String? referralLink,
    int? totalReferrals,
    int? pendingReferrals,
    double? totalEarned,
    double? rewardPerReferral,
  }) {
    return ReferralStatsModel(
      referralCode: referralCode ?? this.referralCode,
      referralLink: referralLink ?? this.referralLink,
      totalReferrals: totalReferrals ?? this.totalReferrals,
      pendingReferrals: pendingReferrals ?? this.pendingReferrals,
      totalEarned: totalEarned ?? this.totalEarned,
      rewardPerReferral: rewardPerReferral ?? this.rewardPerReferral,
    );
  }
}
