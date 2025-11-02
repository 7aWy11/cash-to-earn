import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_section _header.dart';
import '../../data/models/top_game_offer.dart';
import '../widgets/top_game_offer_card.dart';

class AllTopGamesScreen extends StatelessWidget {
  const AllTopGamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.textPrimary,
            size: 20.sp,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text('All Top Games', style: AppTextStyles.h4),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // Section Header
              CustomSectionHeader(title: 'All Top Games', showViewAll: false),

              SizedBox(height: 12.h),

              // Grid view of all top games
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.60,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                  ),
                  itemCount: TopGameOffer.sampleOffers.length,
                  itemBuilder: (context, index) {
                    final offer = TopGameOffer.sampleOffers[index];
                    return GestureDetector(
                      onTap: () {
                        context.push('${RouteNames.offerDetails}/${offer.id}');
                      },
                      child: TopGameOfferCard(
                        title: offer.title,
                        reward: offer.reward,
                        rating: offer.rating,
                        imageUrl: offer.imageUrl,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
