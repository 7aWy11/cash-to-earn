import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/theme/app_colors.dart';
import '../config/theme/app_text_styles.dart';

/// Custom button with gradient and various styles
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.gradient,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.width,
    this.height,
    this.icon,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = backgroundColor ?? AppColors.primaryPurple;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(12.r);

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

    if (isOutlined) {
      return Container(
        width: width,
        height: height ?? 56.h,
        decoration: BoxDecoration(
          borderRadius: effectiveBorderRadius,
          color: effectiveColor,
        ),
        child: Container(
          margin: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: AppColors.backgroundCard,
            borderRadius: effectiveBorderRadius,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: isLoading ? null : onPressed,
              borderRadius: effectiveBorderRadius,
              child: Center(
                child: Padding(
                  padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w),
                  child: buttonChild,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      width: width,
      height: height ?? 56.h,
      decoration: BoxDecoration(
        color: effectiveColor,
        borderRadius: effectiveBorderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: effectiveBorderRadius,
          child: Center(
            child: Padding(
              padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w),
              child: buttonChild,
            ),
          ),
        ),
      ),
    );
  }
}

/// Icon button with gradient background that supports IconData, SVG, and Image assets
class CustomIconButton extends StatelessWidget {
  final IconData? icon;
  final String? svgPath;
  final String? imagePath;
  final VoidCallback? onPressed;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  final double? iconSize;

  const CustomIconButton({
    super.key,
    this.icon,
    this.svgPath,
    this.imagePath,
    this.onPressed,
    this.gradient,
    this.backgroundColor,
    this.iconColor,
    this.size,
    this.iconSize,
  }) : assert(
         (icon != null && svgPath == null && imagePath == null) ||
             (icon == null && svgPath != null && imagePath == null) ||
             (icon == null && svgPath == null && imagePath != null),
         'Only one of icon, svgPath, or imagePath should be provided',
       );

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? 48.w;
    final effectiveIconSize = iconSize ?? (effectiveSize * 0.5);

    Widget iconWidget;

    if (icon != null) {
      // Material Icon
      iconWidget = Icon(
        icon,
        color: iconColor ?? AppColors.white,
        size: effectiveIconSize,
      );
    } else if (svgPath != null) {
      // SVG Icon
      iconWidget = SvgPicture.asset(
        svgPath!,
        width: effectiveIconSize,
        height: effectiveIconSize,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : null,
      );
    } else if (imagePath != null) {
      // Image Asset
      iconWidget = Image.asset(
        imagePath!,
        width: effectiveIconSize,
        height: effectiveIconSize,
        color: iconColor,
        colorBlendMode: iconColor != null ? BlendMode.srcIn : null,
      );
    } else {
      // Fallback
      iconWidget = Icon(
        Icons.error,
        color: AppColors.errorRed,
        size: effectiveIconSize,
      );
    }

    return Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Center(child: iconWidget),
        ),
      ),
    );
  }
}
