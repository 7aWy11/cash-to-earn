import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_section _header.dart';
import '../../data/models/trending_offer.dart';
import '../widgets/trending_offers_list.dart';

class AllOffersScreen extends StatelessWidget {
  const AllOffersScreen({super.key});

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
        title: Text('All Trending Offers', style: AppTextStyles.h4),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // Section Header
              CustomSectionHeader(
                title: 'All Trending Offers',
                showViewAll: false,
              ),

              SizedBox(height: 12.h),

              // All Offers List
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TrendingOffersList(
                  offers: TrendingOffer.sampleOffers,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  onOfferTap: (offer) {
                    context.push('${RouteNames.offerDetails}/${offer.id}');
                  },
                ),
              ),

              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
