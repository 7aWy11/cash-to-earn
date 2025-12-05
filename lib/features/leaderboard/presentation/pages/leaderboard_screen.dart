import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../data/mock_leaderboard_data.dart';
import '../../domain/entities/leaderboard_user.dart';
import '../enums/time_frame.dart';
import '../widgets/leaderboard_app_bar.dart';
import '../widgets/leaderboard_info_dialog.dart';
import '../widgets/leaderboard_list_item.dart';
import '../widgets/time_frame_filter.dart';
import '../widgets/top_three_podium.dart';

/// Main leaderboard screen showing top 3 users and full ranking list
class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  TimeFrame _currentTimeFrame = TimeFrame.allTime;
  List<LeaderboardUser> _users = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _users = MockLeaderboardData.getUsers();
    });
  }

  List<LeaderboardUser> get _topThreeUsers =>
      _users.where((u) => u.rank <= 3).toList();

  List<LeaderboardUser> get _otherUsers =>
      _users.where((u) => u.rank > 3).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: LeaderboardAppBar(
        onInfoPressed: () => LeaderboardInfoDialog.show(context),
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        color: AppColors.primaryPurple,
        backgroundColor: AppColors.backgroundCard,
        child: CustomScrollView(
          slivers: [
            _buildTimeFrameFilter(),
            _buildTopThreePodium(),
            _buildSectionHeader(),
            _buildUserList(),
            _buildBottomSpacing(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeFrameFilter() {
    return SliverToBoxAdapter(
      child: TimeFrameFilter(
        currentTimeFrame: _currentTimeFrame,
        onTimeFrameChanged: (timeFrame) {
          setState(() => _currentTimeFrame = timeFrame);
        },
      ),
    );
  }

  Widget _buildTopThreePodium() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Text(
            'Top Earners',
            style: AppTextStyles.h5.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 8.h),
          TopThreePodium(topThreeUsers: _topThreeUsers),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: AppColors.border, thickness: 1.h),
            SizedBox(height: 16.h),
            Text(
              'All Rankings',
              style: AppTextStyles.h6.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final user = _otherUsers[index];
          final isCurrentUser =
              MockLeaderboardData.currentUserRank == user.rank;
          return LeaderboardListItem(user: user, isCurrentUser: isCurrentUser);
        }, childCount: _otherUsers.length),
      ),
    );
  }

  Widget _buildBottomSpacing() {
    return SliverToBoxAdapter(child: SizedBox(height: 20.h));
  }
}
