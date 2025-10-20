import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/widgets/custom_list_view_builder.dart';
import 'top_game_offer_card.dart';
import '../../data/models/top_game_offer.dart';

class TopGamesOffersList extends StatelessWidget {
  final List<TopGameOffer> offers;
  final double height;
  final Function(TopGameOffer)? onOfferTap;
  final EdgeInsetsGeometry? padding;
  final double spacing;

  const TopGamesOffersList({
    super.key,
    required this.offers,
    this.height = 140,
    this.onOfferTap,
    this.padding,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    if (offers.isEmpty) {
      return _buildEmptyState();
    }

    return CustomListViewBuilder.horizontal(
      itemCount: offers.length > 4 ? 4 : offers.length,
      height: height,
      itemBuilder: (context, index) {
        final offer = offers[index];
        return GestureDetector(
          onTap: () => onOfferTap?.call(offer),
          child: TopGameOfferCard(
            title: offer.title,
            reward: offer.reward,
            rating: offer.rating,
            imageUrl: offer.imageUrl,
          ),
        );
      },
      spacing: spacing,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      height: height,
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.games_outlined,
            size: 48.sp,
            color: AppColors.textTertiary,
          ),
          SizedBox(height: 16.h),
          Text(
            'No games available',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Check back later for new games',
            style: AppTextStyles.bodySmallSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
