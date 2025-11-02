import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_list_view_builder.dart';
import '../../data/models/my_offars_model.dart';
import 'recent_activity_card.dart';

class AllActivitiesScreen extends StatelessWidget {
  const AllActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.textPrimary,
            size: 20.sp,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text('All Activities', style: AppTextStyles.h4),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // Section Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text('Recent Activity', style: AppTextStyles.h5),
              ),

              SizedBox(height: 12.h),

              // All Activities List
              CustomListViewBuilder(
                itemCount: ActivityItem.sampleActivities.length,
                itemBuilder: (context, index) {
                  final activity = ActivityItem.sampleActivities[index];
                  return GestureDetector(
                    onTap: () {
                      // TODO: Navigate to activity details if needed
                    },
                    child: ActivityItemCard(activity: activity),
                  );
                },
                orientation: ListOrientation.vertical,
                spacing: 8.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),

              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
