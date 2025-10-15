import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';

/// Social login button (Google, Facebook, etc.)
class SocialLoginButton extends StatelessWidget {
  final String text;
  final String? iconPath;
  final IconData? iconData;
  final Color color;
  final Color? textColor;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final double? iconSize;

  const SocialLoginButton({
    super.key,
    required this.text,
    this.iconPath,
    this.iconData,
    required this.color,
    this.textColor,
    this.iconColor,
    this.onPressed,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null)
                SizedBox(
                  width: iconSize ?? 24.sp,
                  height: iconSize ?? 24.sp,
                  child: _buildIcon(),
                )
              else if (iconData != null)
                Icon(
                  iconData!,
                  color: iconColor ?? textColor ?? AppColors.white,
                  size: iconSize ?? 24.sp,
                ),
              SizedBox(width: 12.w),
              Flexible(
                child: Text(
                  text,
                  style: AppTextStyles.button.copyWith(
                    color: textColor ?? AppColors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (iconPath == null) return const SizedBox.shrink();

    final isSvg = iconPath!.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.asset(
        iconPath!,
        fit: BoxFit.contain,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : null,
      );
    } else {
      return Image.asset(iconPath!, fit: BoxFit.contain, color: iconColor);
    }
  }
}
