import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_gradients.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/widgets/custom_app_header.dart';
import '../widgets/trending_offers_list.dart';
import '../widgets/top_games_offers_list.dart';
import '../widgets/partner_card.dart';
import '../widgets/premium_partner_card.dart';
import '../widgets/in_app_tasks_list.dart';
import '../widgets/payout_item.dart';
import '../../data/models/trending_offer.dart';
import '../../data/models/top_game_offer.dart';
import '../../data/models/in_app_task.dart';
import '../../../auth/presentation/widgets/welcome_onboarding_dialog.dart';

/// Home screen - Main offers screen matching the design image
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Static variable to track if welcome dialog has been shown in this app session
  static bool _hasShownWelcomeDialog = false;

  @override
  void initState() {
    super.initState();
    // Show welcome dialog only once per app session
    if (!_hasShownWelcomeDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _hasShownWelcomeDialog = true;
            showWelcomeOnboardingDialog(context);
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
            CustomAppHeader(balance: 0.05),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),

                    // Trending Offers Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Trending Offers', style: AppTextStyles.h5),
                          GestureDetector(
                            onTap: () {
                              context.push(RouteNames.allOffers);
                            },
                            child: Text(
                              'View All',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TrendingOffersList(
                        offers: TrendingOffer.sampleOffers,
                        maxItems: 3,
                        showViewAllButton: true,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        onOfferTap: (offer) {
                          log(offer.title);
                          context.push(
                            '${RouteNames.offerDetails}/${offer.id}',
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Top Games Offers Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Top Games Offers', style: AppTextStyles.h5),
                          GestureDetector(
                            onTap: () {
                              context.push(RouteNames.allTopGames);
                            },
                            child: Text(
                              'View All',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TopGamesOffersList(
                      offers: TopGameOffer.sampleOffers,
                      height: 285.h,
                      onOfferTap: (offer) {
                        log(offer.title);
                        context.push('${RouteNames.offerDetails}/${offer.id}');
                      },
                    ),

                    SizedBox(height: 24.h),

                    // Offer Partners Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Offer Partners', style: AppTextStyles.h5),
                          GestureDetector(
                            onTap: () {
                              // TODO: Navigate to all partners screen
                            },
                            child: Text(
                              'View All',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: PartnerCard(
                                  name: 'Theoremreach',
                                  description: '50+ Surveys',
                                  gradient: AppGradients.bluePartner,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: PartnerCard(
                                  name: 'UP Well',
                                  description: 'Gaming Tasks',
                                  gradient: AppGradients.purplePartner,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Expanded(
                                child: PartnerCard(
                                  name: 'Offery',
                                  description: 'Premium Offers',
                                  gradient: AppGradients.greenPartner,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: PartnerCard(
                                  name: 'Monlix',
                                  description: 'High Paying',
                                  gradient: AppGradients.yellowPartner,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Premium Partners Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Premium Partners', style: AppTextStyles.h5),
                          GestureDetector(
                            onTap: () {
                              // TODO: Navigate to all premium partners screen
                            },
                            child: Text(
                              'View All',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          PremiumPartnerCard(
                            name: 'Timewall',
                            description: 'Time-based Rewards',
                            maxReward: 'Up to \$500',
                          ),
                          PremiumPartnerCard(
                            name: 'MyLead',
                            description: 'Exclusive Campaigns',
                            maxReward: 'Up to \$750',
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Survey Partners Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Survey Partners', style: AppTextStyles.h5),
                          GestureDetector(
                            onTap: () {
                              // TODO: Navigate to all survey partners screen
                            },
                            child: Text(
                              'View All',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundCard,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.w,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundCardElevated,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                Icons.poll,
                                color: AppColors.textTertiary,
                                size: 24.sp,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Survey Opportunities',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Complete surveys and earn instantly',
                                    style: AppTextStyles.bodySmallSecondary,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('\$5-\$50', style: AppTextStyles.priceTag),
                                Text(
                                  'Per Survey',
                                  style: AppTextStyles.bodySmallSecondary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // In-App Tasks Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('In-App Tasks', style: AppTextStyles.h5),
                          GestureDetector(
                            onTap: () {
                              context.push(RouteNames.allInAppTasks);
                            },
                            child: Text(
                              'View All',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InAppTasksList(
                      tasks: InAppTask.sampleTasks,
                      height: 220.h,
                      onTaskTap: (task) {
                        log(task.title);
                        // TODO: Navigate to task details screen
                        // context.push('${RouteNames.taskDetails}/${task.id}');
                      },
                    ),

                    SizedBox(height: 24.h),

                    // Live Payouts Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Live Payouts', style: AppTextStyles.h5),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.visibility,
                              color: AppColors.textPrimary,
                              size: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          PayoutItem(
                            username: 'ViciousViper',
                            timeAgo: '6 hours ago',
                            amount: '\$300.01',
                            paymentMethod: 'Payeer',
                          ),
                          PayoutItem(
                            username: 'ViciousViper',
                            timeAgo: '5 hours ago',
                            amount: '\$300.01',
                            paymentMethod: 'Payeer',
                          ),
                          PayoutItem(
                            username: 'ViciousViper',
                            timeAgo: '5 hours ago',
                            amount: '\$300.01',
                            paymentMethod: 'Payeer',
                          ),
                          PayoutItem(
                            username: 'ViciousViper',
                            timeAgo: '5 hours ago',
                            amount: '\$300.01',
                            paymentMethod: 'Payeer',
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
