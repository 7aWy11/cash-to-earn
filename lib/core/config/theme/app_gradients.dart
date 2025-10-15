import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App-wide gradient definitions
class AppGradients {
  AppGradients._();

  // Primary Button Gradient
  static const LinearGradient primaryButton = LinearGradient(
    colors: [AppColors.primaryPurple, AppColors.primaryPurpleDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient glassHeader = LinearGradient(
    colors: [AppColors.primaryPurpleSecondary, AppColors.primaryPurpleSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  // Purple to Blue Gradient
  static const LinearGradient purpleBlue = LinearGradient(
    colors: [AppColors.primaryPurple, AppColors.vibrantBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Blue to Cyan Gradient
  static const LinearGradient blueCyan = LinearGradient(
    colors: [AppColors.vibrantBlue, AppColors.infoCyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Green Success Gradient
  static const LinearGradient greenSuccess = LinearGradient(
    colors: [AppColors.successGreen, AppColors.successGreenDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Orange Warning Gradient
  static const LinearGradient orangeWarning = LinearGradient(
    colors: [AppColors.warningOrange, AppColors.warningOrangeDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gold Gradient
  static const LinearGradient gold = LinearGradient(
    colors: [AppColors.goldYellow, AppColors.goldYellowDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Background Gradient (Dark Theme)
  static const LinearGradient darkBackground = LinearGradient(
    colors: [AppColors.backgroundDark, AppColors.backgroundDarkSecondary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Card Gradient
  static const LinearGradient card = LinearGradient(
    colors: [AppColors.backgroundCard, AppColors.backgroundCardElevated],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shimmer Loading Gradient
  static const LinearGradient shimmer = LinearGradient(
    colors: [Color(0xFF1E1E30), Color(0xFF252538), Color(0xFF1E1E30)],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment(-1.0, 0.0),
    end: Alignment(1.0, 0.0),
  );

  // Multi-color Gradients for Special Cards
  static const LinearGradient rainbow = LinearGradient(
    colors: [
      AppColors.primaryPurple,
      AppColors.vibrantBlue,
      AppColors.successGreen,
      AppColors.goldYellow,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Overlay Gradients
  static const LinearGradient overlayTop = LinearGradient(
    colors: [AppColors.black, AppColors.transparent],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.5],
  );

  static const LinearGradient overlayBottom = LinearGradient(
    colors: [AppColors.transparent, AppColors.black],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.5, 1.0],
  );

  // Partner Card Gradients
  static const LinearGradient bluePartner = LinearGradient(
    colors: [Color(0xFF0EA5E9), Color(0xFF0284C7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient purplePartner = LinearGradient(
    colors: [Color(0xFFA855F7), Color(0xFF9333EA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient greenPartner = LinearGradient(
    colors: [Color(0xFF22C55E), Color(0xFF16A34A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient yellowPartner = LinearGradient(
    colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
