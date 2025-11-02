import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';

/// Custom Toggle Switch Widget
/// Animated toggle with customizable colors and sizes
class CustomToggleSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final double? width;
  final double? height;
  final bool enabled;

  const CustomToggleSwitch({
    super.key,
    this.initialValue = false,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.width,
    this.height,
    this.enabled = true,
  });

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch>
    with SingleTickerProviderStateMixin {
  late bool _value;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (_value) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(CustomToggleSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _value = widget.initialValue;
      if (_value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    if (!widget.enabled) return;

    setState(() {
      _value = !_value;
    });

    if (_value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    widget.onChanged?.call(_value);
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.width ?? 50.w;
    final height = widget.height ?? 28.h;
    final thumbSize = height - 4.h;

    return GestureDetector(
      onTap: _toggle,
      child: Opacity(
        opacity: widget.enabled ? 1.0 : 0.5,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: ColorTween(
                  begin:
                      widget.inactiveColor ??
                      AppColors.primaryPurple.withValues(alpha: .3),
                  end:
                      widget.activeColor ??
                      AppColors.primaryPurple.withValues(alpha: 0.8),
                ).evaluate(_animation),
                borderRadius: BorderRadius.circular(height / 2),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: _animation.value * (width - thumbSize - 4.w) + 2.w,
                    top: 2.h,
                    child: Container(
                      width: thumbSize,
                      height: thumbSize,
                      decoration: BoxDecoration(
                        color: widget.thumbColor ?? AppColors.primaryPurple,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
