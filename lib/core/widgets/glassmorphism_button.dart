import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/app_colors.dart';
import '../config/theme/app_text_styles.dart';

/// Glassmorphism Button with blur effect
class GlassmorphismButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? blurSigmaX;
  final double? blurSigmaY;
  final double? borderRadius;
  final List<Color>? gradientColors;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? icon;
  final bool isLoading;

  const GlassmorphismButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.textColor,
    this.textStyle,
    this.blurSigmaX,
    this.blurSigmaY,
    this.borderRadius,
    this.gradientColors,
    this.borderColor,
    this.borderWidth,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? 30.r;
    final effectiveGradientColors =
        gradientColors ??
        [AppColors.white.withOpacity(0.15), AppColors.white.withOpacity(0.05)];

    Widget buttonChild = isLoading
        ? SizedBox(
            height: 20.h,
            width: 20.w,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, SizedBox(width: 8.w)],
              Text(
                text,
                style:
                    textStyle ??
                    AppTextStyles.button.copyWith(
                      color: textColor ?? AppColors.white,
                    ),
              ),
            ],
          );

    return ClipRRect(
      borderRadius: BorderRadius.circular(effectiveBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurSigmaX ?? 10,
          sigmaY: blurSigmaY ?? 10,
        ),
        child: Container(
          width: width,
          height: height ?? 56.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: effectiveGradientColors,
            ),
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            border: Border.all(
              color: borderColor ?? AppColors.white.withOpacity(0.2),
              width: borderWidth ?? 1.5,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
              onTap: isLoading ? null : onPressed,
              child: Center(child: buttonChild),
            ),
          ),
        ),
      ),
    );
  }
}
