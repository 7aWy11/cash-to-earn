import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// Withdrawal Container - Individual payment method card
class WithdrawalContainer extends StatelessWidget {
  final String name;
  final String imagePath;
  final String? minimum;
  final String fee;
  final Color color;
  final VoidCallback? onTap;
  final bool isSelected;

  const WithdrawalContainer({
    super.key,
    required this.name,
    required this.imagePath,
    this.minimum,
    required this.fee,
    required this.color,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon at the top
            SvgPicture.asset(imagePath, width: 28.w, height: 28.h),

            // Bottom section with name, minimum, and fee
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row with name and minimum
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Name
                    Flexible(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    SizedBox(width: 4.w),

                    // Minimum (if available)
                    if (minimum != null)
                      Text(
                        'Min: ${minimum!}',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                  ],
                ),

                SizedBox(height: 4.h),

                // Fee
                Text(
                  fee,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
