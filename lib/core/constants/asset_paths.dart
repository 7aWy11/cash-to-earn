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

  // ===== Icons =====
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
