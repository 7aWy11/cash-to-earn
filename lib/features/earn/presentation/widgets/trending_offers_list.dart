import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/widgets/custom_list_view_builder.dart';
import '../../data/models/trending_offer.dart';
import 'trending_offer_card.dart';

class TrendingOffersList extends StatelessWidget {
  final List<TrendingOffer> offers;
  final Function(TrendingOffer)? onOfferTap;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final int? maxItems;
  final VoidCallback? onViewAllTap;
  final bool showViewAllButton;

  const TrendingOffersList({
    super.key,
    required this.offers,
    this.onOfferTap,
    this.shrinkWrap = false,
    this.physics,
    this.maxItems,
    this.onViewAllTap,
    this.showViewAllButton = false,
  });

  @override
  Widget build(BuildContext context) {
    if (offers.isEmpty) {
      return _buildEmptyState();
    }

    final displayOffers = maxItems != null
        ? offers.take(maxItems!).toList()
        : offers;

    final hasMoreOffers = maxItems != null && offers.length > maxItems!;

    return Column(
      children: [
        CustomListViewBuilder.vertical(
          itemCount: displayOffers.length,
          itemBuilder: (context, index) {
            final offer = displayOffers[index];
            return TrendingOfferCard(
              offer: offer,
              onTap: () => onOfferTap?.call(offer),
            );
          },
          shrinkWrap: shrinkWrap,
          physics: physics,
          spacing: 12.h,
        ),
        if (hasMoreOffers && showViewAllButton) ...[
          SizedBox(height: 12.h),
        ],
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          Icon(
            Icons.local_offer_outlined,
            size: 48.sp,
            color: AppColors.textTertiary,
          ),
          SizedBox(height: 16.h),
          Text(
            'No trending offers available',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Check back later for new opportunities',
            style: AppTextStyles.bodySmallSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
