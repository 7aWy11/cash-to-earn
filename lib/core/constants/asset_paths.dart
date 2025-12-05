/// Asset paths for images, icons, and other resources
/// Centralized management of all app assets
class AppImages {
  AppImages._();

  // Base paths
  static const String _imagesBase = 'assets/images';
  static const String _iconsBase = 'assets/icons';
  static const String _activeBottomNavIcons = 'assets/icons/active_icons';
  static const String _inactiveBottomNavIcons = 'assets/icons/inactive_icons';

  // ===== Images =====
  /// Main background image
  static const String background = '$_imagesBase/Background.png';

  /// invite friends illustration
  static const String inviteFriends = '$_imagesBase/invite.jpg';
  // ===== Icons =====
  /// Coin icon.
  static const String coin = '$_iconsBase/coin.png';

  /// pending icon.
  static const String pending = '$_iconsBase/sandclock.png';

  /// frinds icon.
  static const String friends = '$_iconsBase/friend.png';

  /// Gold medal icon.
  static const String goldMedal = '$_iconsBase/gold.png';

  /// Silver medal icon.
  static const String silverMedal = '$_iconsBase/silver.png';

  /// Bronze medal icon.
  static const String bronzeMedal = '$_iconsBase/bronze.png';

  /// Crown icon for first place
  static const String crown = '$_iconsBase/crown.png';

  ///Whatapp icon.
  static const String whatsapp = '$_iconsBase/whatsapp_logo.png';

  ///Telegram icon.
  static const String telegram = '$_iconsBase/telegram_logo.png';

  /// Brand/App icon
  static const String brandIcon = '$_iconsBase/bran_icon.png';

  /// Google icon for authentication
  static const String google = '$_iconsBase/google.png';

  /// Facebook icon for authentication
  static const String facebook = '$_iconsBase/facebook.png';

  /// Vector icon
  static const String vector = '$_iconsBase/Vector.svg';

  /// Completed icon
  static const String completedIcon = '$_iconsBase/completed.svg';

  /// Leaderboard icon
  static const String leaderboardIcon = '$_iconsBase/leaderboard.svg';

  ///support icon
  static const String supportIcon = '$_iconsBase/support.svg';

  ///shortcuts icon
  static const String shortcutsIcon = '$_iconsBase/shortcut.svg';

  /// Link icon
  static const String linkIcon = '$_iconsBase/link_icon.svg';

  /// Female gender icon/avatar
  static const String female = '$_iconsBase/female.png';

  /// Male gender icon/avatar
  static const String male = '$_iconsBase/male.png';

  /// Notification icon
  static const String notification = '$_iconsBase/direct-notification.svg';

  /// money icon
  static const String money = '$_iconsBase/money.svg';

  /// active navbottom icon
  /// earn icon
  static const String earnIcon = '$_activeBottomNavIcons/earn.svg';

  /// my offers icon
  static const String myOffersIcon = '$_activeBottomNavIcons/my_offars.svg';

  /// cashout icon
  static const String cashoutIcon = '$_activeBottomNavIcons/cash_out.svg';

  /// profile icon
  static const String profileIcon = '$_activeBottomNavIcons/profile.svg';

  /// inactive navbottom icon
  /// earn icon
  static const String inactiveEarnIcon = '$_inactiveBottomNavIcons/earn.svg';

  /// my offers icon
  static const String inactiveMyOffersIcon =
      '$_inactiveBottomNavIcons/my_offars.svg';

  /// cashout icon
  static const String inactiveCashoutIcon =
      '$_inactiveBottomNavIcons/cash_out.svg';

  /// profile icon
  static const String inactiveProfileIcon =
      '$_inactiveBottomNavIcons/profile.svg';

  ///Profile placeholder image
  static const String profilePlaceholder = '$_imagesBase/profile.png';

  // ===== Helper Methods =====
  /// Get gender icon based on gender string
  static String getGenderIcon(String? gender) {
    if (gender?.toLowerCase() == 'female') {
      return female;
    } else if (gender?.toLowerCase() == 'male') {
      return male;
    }
    return brandIcon; // Default fallback
  }
}
