import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconBuilder extends StatelessWidget {
  /// Material Icon to display
  final IconData? icon;

  /// SVG icon asset path
  final String? svgIconPath;

  /// Image asset path (PNG, JPG, etc.)
  final String? imagePath;

  /// Size of the icon
  final double size;

  /// Color of the icon
  final Color color;

  /// Background color (optional)
  final Color? backgroundColor;

  /// Border radius for background (optional)
  final double? borderRadius;

  /// Padding around the icon (optional)
  final EdgeInsetsGeometry? padding;

  /// Whether to center the icon
  final bool centerIcon;

  /// Box fit for image assets
  final BoxFit boxFit;

  const CustomIconBuilder({
    super.key,
    this.icon,
    this.svgIconPath,
    this.imagePath,
    this.size = 24,
    this.color = Colors.white,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.centerIcon = true,
    this.boxFit = BoxFit.contain,
  }) : assert(
         icon != null || svgIconPath != null || imagePath != null,
         'Either icon, svgIconPath, or imagePath must be provided',
       );

  /// Creates a CustomIconBuilder with Material Icon
  factory CustomIconBuilder.icon({
    required IconData icon,
    double size = 24,
    Color color = Colors.white,
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    bool centerIcon = true,
  }) {
    return CustomIconBuilder(
      icon: icon,
      size: size,
      color: color,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      padding: padding,
      centerIcon: centerIcon,
    );
  }

  /// Creates a CustomIconBuilder with SVG Icon
  factory CustomIconBuilder.svg({
    required String svgIconPath,
    double size = 24,
    Color color = Colors.white,
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    bool centerIcon = true,
  }) {
    return CustomIconBuilder(
      svgIconPath: svgIconPath,
      size: size,
      color: color,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      padding: padding,
      centerIcon: centerIcon,
    );
  }

  /// Creates a CustomIconBuilder with Image Asset
  factory CustomIconBuilder.image({
    required String imagePath,
    double size = 24,
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    bool centerIcon = true,
    BoxFit boxFit = BoxFit.contain,
  }) {
    return CustomIconBuilder(
      imagePath: imagePath,
      size: size,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      padding: padding,
      centerIcon: centerIcon,
      boxFit: boxFit,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = _buildIconWidget();

    // Add background if specified
    if (backgroundColor != null) {
      iconWidget = Container(
        padding: padding ?? EdgeInsets.all(size * 0.2),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? size * 0.2),
        ),
        child: iconWidget,
      );
    }

    // Center the icon if requested
    if (centerIcon) {
      iconWidget = Center(child: iconWidget);
    }

    return iconWidget;
  }

  /// Builds the appropriate icon widget (SVG, Image, or Material Icon)
  Widget _buildIconWidget() {
    if (svgIconPath != null) {
      return SvgPicture.asset(
        svgIconPath!,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    } else if (imagePath != null) {
      return Image.asset(imagePath!, width: size, height: size, fit: boxFit);
    } else if (icon != null) {
      return Icon(icon!, color: color, size: size);
    }

    // Fallback - should not reach here due to assert
    return Icon(Icons.help_outline, color: color, size: size);
  }
}
