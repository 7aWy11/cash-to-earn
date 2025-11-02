import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_section _header.dart';
import '../../data/models/in_app_task.dart';
import '../widgets/in_app_taskes_card.dart';

class AllInAppTasksScreen extends StatelessWidget {
  const AllInAppTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'In-App Tasks', elevation: 0),
      backgroundColor: AppColors.backgroundDark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),

            // Section Header
            CustomSectionHeader(title: 'All In-App Tasks', showViewAll: false),

            SizedBox(height: 12.h),

            // Grid view of all in-app tasks
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 176.w / 220.h,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                ),
                itemCount: InAppTask.sampleTasks.length,
                itemBuilder: (context, index) {
                  final task = InAppTask.sampleTasks[index];
                  return GestureDetector(
                    onTap: () {
                      log('Task tapped: ${task.title}');
                      log('Task ID: ${task.id}');
                      log('Task Description: ${task.description}');
                      log('Task Reward: ${task.reward}');
                      log('Task Category: ${task.category}');
                    },
                    child: InAppTaskesCard(
                      title: task.title,
                      description: task.description,
                      reward: task.reward,
                      imageUrl: task.imageUrl,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
