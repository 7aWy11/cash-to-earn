import 'package:equatable/equatable.dart';

/// Entity representing a user in the leaderboard
class LeaderboardUser extends Equatable {
  final String id;
  final String username;
  final String? avatarUrl;
  final int rank;
  final double totalEarnings;
  final int completedOffers;
  final String? country;

  const LeaderboardUser({
    required this.id,
    required this.username,
    this.avatarUrl,
    required this.rank,
    required this.totalEarnings,
    required this.completedOffers,
    this.country,
  });

  bool get isTopThree => rank <= 3;
  bool get isFirstPlace => rank == 1;

  @override
  List<Object?> get props => [
    id,
    username,
    avatarUrl,
    rank,
    totalEarnings,
    completedOffers,
    country,
  ];
}
