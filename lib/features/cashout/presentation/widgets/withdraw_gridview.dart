import 'package:cash_to_earn/features/cashout/presentation/widgets/withdrow_continer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/constants/asset_paths.dart';

/// Withdrawal GridView - Grid of payment method cards
class WithdrawGridView extends StatelessWidget {
  final Function(String methodName)? onMethodTap;
  final EdgeInsetsGeometry? padding;

  const WithdrawGridView({super.key, this.onMethodTap, this.padding});

  // Withdrawal methods data
  static const List<Map<String, dynamic>> _withdrawalMethods = [
    {
      'name': 'PayPal',
      'minimum': '\$1.00',
      'fee': 'Free : Free',
      'color': AppColors.accentBlue,
    },
    {
      'name': 'Amazon',
      'minimum': '\$5.00',
      'fee': 'Fee: Free',
      'color': Color(0xFFFF9900),
    },
    {
      'name': 'Payeer',
      'minimum': '\$1.00',
      'fee': 'Fee: Free',
      'color': Color(0xFF00C853),
    },
    {
      'name': 'Bitcoin',
      'minimum': '\$10.00',
      'fee': 'Fee: Network',
      'color': AppColors.goldYellow,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1.6,
      ),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: _withdrawalMethods.length,
      itemBuilder: (context, index) {
        final method = _withdrawalMethods[index];
        return WithdrawalContainer(
          imagePath: AppImages.completedIcon,
          name: method['name'] as String,
          minimum: method['minimum'] as String,
          fee: method['fee'] as String,
          color: method['color'] as Color,
          onTap: () => onMethodTap?.call(method['name'] as String),
        );
      },
    );
  }
}
