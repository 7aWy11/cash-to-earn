import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  void didUpdateWidget(CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isChecked != widget.isChecked) {
      _isChecked = widget.isChecked;
    }
  }

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChecked(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 20.0.w,
        height: 20.0.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: _isChecked
                ? AppColors.primaryPurple
                : AppColors.white.withValues(alpha: 0.3),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        alignment: Alignment.center,
        child: _isChecked
            ? Icon(Icons.check, color: Colors.white, size: 16.0.sp)
            : null,
      ),
    );
  }
}
