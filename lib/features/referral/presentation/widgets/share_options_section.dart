import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/constants/asset_paths.dart';
import '../../../../core/utils/share_utils.dart';

/// Share Options Section - Premium Circular Button Design
///
/// TODO for Backend Developer:
/// - Track share actions in analytics (optional)
/// - Deep linking setup for referral links
/// - Configure app links for iOS/Android
class ShareOptionsSection extends StatelessWidget {
  final String referralLink;
  final VoidCallback? onWhatsAppTap;
  final VoidCallback? onTelegramTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onCopyLinkTap;
  final VoidCallback? onMoreTap;

  const ShareOptionsSection({
    super.key,
    required this.referralLink,
    this.onWhatsAppTap,
    this.onTelegramTap,
    this.onFacebookTap,
    this.onCopyLinkTap,
    this.onMoreTap,
  });

  void _copyLink(BuildContext context) {
    ShareUtils.copyToClipboard(
      context,
      referralLink,
      successMessage: 'Referral link copied!',
    );
  }

  void _shareViaWhatsApp() async {
    await ShareUtils.shareViaWhatsApp(referralLink);
  }

  void _shareViaTelegram() async {
    await ShareUtils.shareViaTelegram(referralLink);
  }

  void _shareViaFacebook() async {
    await ShareUtils.shareViaFacebook(referralLink);
  }

  void _shareMore() {
    final message =
        'Join me on Cash2Earn and start earning! Use my referral link: $referralLink';
    ShareUtils.shareText(message, subject: 'Join Cash2Earn App');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title
        Text(
          'Share via',
          style: AppTextStyles.h5.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 16.h),

        // Share Options Row with circular buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ShareOption(
              imagePath: AppImages.whatsapp,
              label: 'WhatsApp',
              backgroundColor: const Color(0xFF25D366),
              onTap: onWhatsAppTap ?? _shareViaWhatsApp,
            ),
            _ShareOption(
              imagePath: AppImages.telegram,
              label: 'Telegram',
              backgroundColor: const Color(0xFF0088CC),
              onTap: onTelegramTap ?? _shareViaTelegram,
            ),
            _ShareOption(
              icon: Icons.facebook_sharp,
              label: 'Facebook',
              backgroundColor: const Color(0xFF1877F2),
              onTap: onFacebookTap ?? _shareViaFacebook,
            ),
            _ShareOption(
              icon: Icons.link_rounded,
              label: 'Copy Link',
              backgroundColor: AppColors.vibrantBlue,
              onTap: onCopyLinkTap ?? () => _copyLink(context),
            ),
            _ShareOption(
              icon: Icons.more_horiz_rounded,
              label: 'More',
              backgroundColor: AppColors.textSecondary,
              onTap: onMoreTap ?? _shareMore,
            ),
          ],
        ),
      ],
    );
  }
}

/// Single Share Option Button - Circular Design
class _ShareOption extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String label;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const _ShareOption({
    this.icon,
    this.imagePath,
    required this.label,
    required this.backgroundColor,
    this.onTap,
  }) : assert(
         icon != null || imagePath != null,
         'Either icon or imagePath must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Column(
        children: [
          // Icon/Image Container
          Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _buildIconOrImage(),
          ),

          SizedBox(height: 6.h),

          // Label
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildIconOrImage() {
    return Container(
      width: 64.w,
      height: 64.w,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: imagePath != null
          ? Padding(
              padding: EdgeInsets.all(12.w),
              child: Image.asset(
                imagePath!,
                width: 40.w,
                height: 40.w,
                fit: BoxFit.contain,
              ),
            )
          : Icon(icon!, color: Colors.white, size: 32.sp),
    );
  }
}
