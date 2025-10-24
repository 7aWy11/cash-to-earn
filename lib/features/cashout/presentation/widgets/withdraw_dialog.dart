import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'withdraw_dialog_header.dart';
import 'withdraw_amount_step.dart';
import 'withdraw_confirm_step.dart';
import 'withdraw_complete_step.dart';

class WithdrawDialog extends StatefulWidget {
  final String paymentMethod;
  final String minimumAmount;
  final String fee;
  final Color methodColor;
  final double currentBalance;
  final int currentCoins;

  const WithdrawDialog({
    super.key,
    required this.paymentMethod,
    required this.minimumAmount,
    required this.fee,
    required this.methodColor,
    required this.currentBalance,
    required this.currentCoins,
  });

  @override
  State<WithdrawDialog> createState() => _WithdrawDialogState();
}

class _WithdrawDialogState extends State<WithdrawDialog> {
  int currentStep = 1;
  int amountCoins = 50;
  String paypalEmail = 'user@paypal.com';
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController.text = amountCoins.toString();
    _emailController.text = paypalEmail;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  double get amountInDollars =>
      (amountCoins * widget.currentBalance) / widget.currentCoins;

  void _nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    }
  }

  void _previousStep() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
    }
  }

  void _completeWithdraw() {
    // Handle withdrawal completion
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E).withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header with title and steps
                WithdrawDialogHeader(currentStep: currentStep),

                // Content based on current step
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20.w),
                    child: _buildStepContent(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (currentStep) {
      case 1:
        return WithdrawAmountStep(
          currentBalance: widget.currentBalance,
          currentCoins: widget.currentCoins,
          amountCoins: amountCoins,
          amountInDollars: amountInDollars,
          paymentMethod: widget.paymentMethod,
          minimumAmount: widget.minimumAmount,
          fee: widget.fee,
          methodColor: widget.methodColor,
          amountController: _amountController,
          onBack: () => Navigator.of(context).pop(),
          onContinue: _nextStep,
          onAmountChanged: (value) {
            setState(() {
              amountCoins = int.tryParse(value) ?? 0;
            });
          },
        );
      case 2:
        return WithdrawConfirmStep(
          paymentMethod: widget.paymentMethod,
          minimumAmount: widget.minimumAmount,
          fee: widget.fee,
          methodColor: widget.methodColor,
          email: paypalEmail,
          emailController: _emailController,
          onBack: _previousStep,
          onContinue: _nextStep,
          onChangePaymentDetails: () {
            // Handle change payment details
          },
          onEmailChanged: (value) {
            setState(() {
              paypalEmail = value;
            });
          },
        );
      case 3:
        return WithdrawCompleteStep(
          onClose: () => Navigator.of(context).pop(),
          onComplete: _completeWithdraw,
        );
      default:
        return WithdrawAmountStep(
          currentBalance: widget.currentBalance,
          currentCoins: widget.currentCoins,
          amountCoins: amountCoins,
          amountInDollars: amountInDollars,
          paymentMethod: widget.paymentMethod,
          minimumAmount: widget.minimumAmount,
          fee: widget.fee,
          methodColor: widget.methodColor,
          amountController: _amountController,
          onBack: () => Navigator.of(context).pop(),
          onContinue: _nextStep,
          onAmountChanged: (value) {
            setState(() {
              amountCoins = int.tryParse(value) ?? 0;
            });
          },
        );
    }
  }
}
