import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

/// App-wide text styles using ScreenUtil for responsive sizing
class AppTextStyles {
  AppTextStyles._();

  // Font Family
  static const String _fontFamily = 'SF Pro Display';

  // Heading Styles
  static TextStyle h1 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
    fontFamily: _fontFamily,
  );

  static TextStyle h2 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
    fontFamily: _fontFamily,
  );

  static TextStyle h3 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
    fontFamily: _fontFamily,
  );

  static TextStyle h4 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
    fontFamily: _fontFamily,
  );

  static TextStyle h5 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
    fontFamily: _fontFamily,
  );

  static TextStyle h6 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
    fontFamily: _fontFamily,
  );

  // Body Text Styles
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
    fontFamily: _fontFamily,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
    fontFamily: _fontFamily,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
    fontFamily: _fontFamily,
  );

  // Body Secondary (lighter color)
  static TextStyle bodyLargeSecondary = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
    fontFamily: _fontFamily,
  );

  static TextStyle bodyMediumSecondary = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
    fontFamily: _fontFamily,
  );

  static TextStyle bodySmallSecondary = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
    fontFamily: _fontFamily,
  );

  // Caption & Labels
  static TextStyle caption = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    height: 1.4,
    fontFamily: _fontFamily,
  );

  static TextStyle captionBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textTertiary,
    height: 1.4,
    fontFamily: _fontFamily,
  );

  static TextStyle label = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
    fontFamily: _fontFamily,
  );

  static TextStyle labelSmall = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.3,
    fontFamily: _fontFamily,
  );

  // Button Text
  static TextStyle button = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.2,
    fontFamily: _fontFamily,
  );

  static TextStyle buttonSmall = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.2,
    fontFamily: _fontFamily,
  );

  // Special Styles
  static TextStyle priceTag = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.price,
    height: 1.2,
    fontFamily: _fontFamily,
  );

  static TextStyle priceLarge = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.successGreen,
    height: 1.2,
    fontFamily: _fontFamily,
  );

  static TextStyle badge = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    height: 1.0,
    fontFamily: _fontFamily,
  );

  static TextStyle link = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.vibrantBlue,
    decoration: TextDecoration.underline,
    height: 1.4,
    fontFamily: _fontFamily,
  );

  static TextStyle error = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.errorRed,
    height: 1.4,
    fontFamily: _fontFamily,
  );

  // Title Styles (for app bars, cards)
  static TextStyle title = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
    fontFamily: _fontFamily,
  );

  static TextStyle subtitle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
    fontFamily: _fontFamily,
  );

  // Overline (all caps, small)
  static TextStyle overline = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textTertiary,
    letterSpacing: 1.5,
    height: 1.6,
    fontFamily: _fontFamily,
  );

  // Display (extra large)
  static TextStyle display = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.1,
    fontFamily: _fontFamily,
  );
}
