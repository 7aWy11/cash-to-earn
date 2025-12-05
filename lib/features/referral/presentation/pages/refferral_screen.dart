import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/utils/share_utils.dart';
import '../../data/datasources/mock_referral_data.dart';
import '../widgets/referral_code_card.dart';
import '../widgets/referral_hearder_section.dart';
import '../widgets/referral_states_card.dart';
import '../widgets/share_options_section.dart';

/// Referral Screen - UI Only (for development)
///
/// TODO for Backend Developer:
/// - Convert to StatefulWidget
/// - Replace MockReferralData with actual API calls
/// - Implement state management (Bloc/Cubit/Provider)
/// - Add pull-to-refresh functionality
/// - Add pagination for referral history
/// - Handle loading/error states properly
class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  void _handleShare(String referralLink) {
    ShareUtils.shareText(referralLink, subject: 'Join Cash2Earn App');
  }

  @override
  Widget build(BuildContext context) {
    // Load mock data directly for UI development
    final stats = MockReferralData.getMockStats();

    return Scaffold(
      backgroundColor: AppColors.primaryPurpleSecondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Referral', style: AppTextStyles.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Header Section
            ReferralHeaderSection(rewardPerReferral: stats.rewardPerReferral),

            SizedBox(height: 16.h),

            // Referral Code Card
            ReferralCodeCard(
              referralCode: stats.referralCode,
              onShare: () => _handleShare(stats.referralLink),
            ),

            SizedBox(height: 16.h),

            // Stats Card
            ReferralStatsCard(
              totalReferrals: stats.totalReferrals,
              pendingReferrals: stats.pendingReferrals,
              totalEarned: stats.totalEarned,
            ),

            SizedBox(height: 16.h),

            // Share Options
            ShareOptionsSection(referralLink: stats.referralLink),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
