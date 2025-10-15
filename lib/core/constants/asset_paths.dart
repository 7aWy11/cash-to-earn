/// Asset paths for images, icons, and other resources
/// Centralized management of all app assets
class AppImages {
  AppImages._();

  // Base paths
  static const String _imagesBase = 'assets/images';
  static const String _iconsBase = 'assets/icons';

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

  /// Female gender icon/avatar
  static const String female = '$_iconsBase/female.png';

  /// Male gender icon/avatar
  static const String male = '$_iconsBase/male.png';

  /// Notification icon
  static const String notification = '$_iconsBase/direct-notification.svg';
  
  /// money icon
  static const String money = '$_iconsBase/money.svg';

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
