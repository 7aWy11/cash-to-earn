import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/theme/app_colors.dart';

/// Utility class for sharing and copying functionality
/// Used across the app for consistent share/copy behavior
class ShareUtils {
  ShareUtils._(); // Private constructor to prevent instantiation

  /// Copy text to clipboard with success message
  static void copyToClipboard(
    BuildContext context,
    String text, {
    String? successMessage,
  }) {
    Clipboard.setData(ClipboardData(text: text));
    _showSuccessSnackBar(context, successMessage ?? 'Copied to clipboard!');
  }

  /// Share text via system share sheet
  static Future<void> shareText(String text, {String? subject}) async {
    await Share.share(text, subject: subject);
  }

  /// Share referral via WhatsApp
  static Future<void> shareViaWhatsApp(String referralLink) async {
    final message =
        'Join me on Cash2Earn and start earning! Use my referral link: $referralLink';
    final url = Uri.parse(
      'https://wa.me/?text=${Uri.encodeComponent(message)}',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  /// Share referral via Telegram
  static Future<void> shareViaTelegram(String referralLink) async {
    final message =
        'Join me on Cash2Earn and start earning! Use my referral link: $referralLink';
    final url = Uri.parse(
      'https://t.me/share/url?url=${Uri.encodeComponent(referralLink)}&text=${Uri.encodeComponent(message)}',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  /// Share referral via Messenger
  static Future<void> shareViaMessenger(String referralLink) async {
    final message =
        'Join me on Cash2Earn and start earning! Use my referral link: $referralLink';

    // Try Messenger app first
    final messengerAppUrl = Uri.parse(
      'fb-messenger://share?link=${Uri.encodeComponent(referralLink)}',
    );

    // Fallback to Messenger web
    final messengerWebUrl = Uri.parse(
      'https://www.facebook.com/dialog/send?link=${Uri.encodeComponent(referralLink)}&app_id=YOUR_APP_ID&redirect_uri=${Uri.encodeComponent(referralLink)}',
    );

    try {
      if (await canLaunchUrl(messengerAppUrl)) {
        await launchUrl(messengerAppUrl, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(messengerWebUrl)) {
        await launchUrl(messengerWebUrl, mode: LaunchMode.externalApplication);
      } else {
        // If all fails, use system share sheet
        await Share.share(message, subject: 'Join Cash2Earn');
      }
    } catch (e) {
      // Fallback to system share
      await Share.share(message, subject: 'Join Cash2Earn');
    }
  }

  /// Share via Facebook
  static Future<void> shareViaFacebook(String referralLink) async {
    // Try Facebook app first
    final facebookAppUrl = Uri.parse(
      'fb://facewebmodal/f?href=${Uri.encodeComponent(referralLink)}',
    );

    // Fallback to web share
    final facebookWebUrl = Uri.parse(
      'https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(referralLink)}',
    );

    try {
      if (await canLaunchUrl(facebookAppUrl)) {
        await launchUrl(facebookAppUrl, mode: LaunchMode.externalApplication);
      } else {
        // If Facebook app is not installed, use web share
        await launchUrl(facebookWebUrl, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // If all fails, use system share sheet
      final message =
          'Join me on Cash2Earn and start earning! Use my referral link: $referralLink';
      await Share.share(message, subject: 'Join Cash2Earn');
    }
  }

  /// Show success SnackBar with consistent styling
  static void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.successGreen,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Show error SnackBar
  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.errorRed,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
