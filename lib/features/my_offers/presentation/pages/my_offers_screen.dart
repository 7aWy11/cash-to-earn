import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/widgets/custom_app_header.dart';
import '../../../../core/widgets/custom_list_view_builder.dart';
import '../../../main_navigation/presentation/widgets/side_drawer.dart';
import '../../data/models/my_offars_model.dart';
import '../../../../core/widgets/custom_section _header.dart';
import '../widgets/performance_card.dart';
import '../widgets/recent_activity_card.dart';

/// My Offers Screen - Shows user's recent activities and performance
class MyOffersScreen extends StatelessWidget {
  const MyOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            CustomAppHeader(balance: 0.05),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),

                    // Recent Activity Section
                    CustomSectionHeader(
                      title: 'Recent Activity',
                      onViewAllTap: () {
                        context.push(RouteNames.allActivities);
                      },
                    ),

                    SizedBox(height: 12.h),

                    // Recent Activity List (Show 3 items)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomListViewBuilder(
                        itemCount: ActivityItem.sampleActivities.length > 2
                            ? 2
                            : ActivityItem.sampleActivities.length,
                        orientation: ListOrientation.vertical,
                        shrinkWrap: true,
                        scrollable: false,
                        itemBuilder: (context, index) {
                          final activity = ActivityItem.sampleActivities[index];
                          return ActivityItemCard(
                            key: ValueKey(activity.id),
                            activity: activity,
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Performance Analytics Section
                    CustomSectionHeader(
                      title: 'Performance Analytics',
                      showViewAll: false,
                      onViewAllTap: () {},
                    ),

                    SizedBox(height: 12.h),

                    // Performance Cards
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          // Top Row: Total Earned & Completed
                          Row(
                            children: [
                              Expanded(
                                child: PerformanceCard(
                                  svgIconPath: AppImages.earnIcon,
                                  value: '\$453.95',
                                  label: 'Total Earned',
                                  changeText: '+12.5%',
                                  backgroundColor: AppColors.myoffersGreen,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: PerformanceCard(
                                  svgIconPath: AppImages.completedIcon,
                                  value: '3',
                                  label: 'Completed',
                                  changeText: '+1 today',
                                  backgroundColor: AppColors.accentBlue,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),

                          // Bottom Row: Referrals (Full width)
                          PerformanceCard(
                            svgIconPath: AppImages.linkIcon,
                            value: '0',
                            label: 'Referrals',
                            actionText: 'Invite friends',
                            backgroundColor: AppColors.warningOrange,
                            isWide: true,
                            onActionTap: () {},
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),
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
