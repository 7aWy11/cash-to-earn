import 'package:cash_to_earn/features/cashout/presentation/widgets/payment_method_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/asset_paths.dart';

/// Payment Method GridView - Grid of payment method cards (withdraw/crypto)
class PaymentMethodGridView extends StatelessWidget {
  final Function(String methodName)? onMethodTap;
  final EdgeInsetsGeometry? padding;

  final List<Map<String, dynamic>> paymentMethods;

  const PaymentMethodGridView({
    super.key,
    this.onMethodTap,
    this.padding,
    required this.paymentMethods,
  });

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
      itemCount: paymentMethods.length,
      itemBuilder: (context, index) {
        final method = paymentMethods[index];
        return PaymentMethodContainer(
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
