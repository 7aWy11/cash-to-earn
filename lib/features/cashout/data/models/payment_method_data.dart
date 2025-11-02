import 'package:flutter/material.dart';

import '../../../../core/config/theme/app_colors.dart';

/// Payment Methods Data - Contains all payment method configurations
class PaymentMethodData {
  // Traditional withdrawal methods
  static const List<Map<String, dynamic>> withdrawMethods = [
    {
      'name': 'PayPal',
      'minimum': '\$1.00',
      'fee': 'Fee: Free',
      'color': AppColors.accentBlue,
      'type': 'withdraw',
    },
    {
      'name': 'Amazon',
      'minimum': '\$5.00',
      'fee': 'Fee: Free',
      'color': Color(0xFFFF9900),
      'type': 'withdraw',
    },
    {
      'name': 'Payeer',
      'minimum': '\$1.00',
      'fee': 'Fee: Free',
      'color': Color(0xFF00C853),
      'type': 'withdraw',
    },
    {
      'name': 'Venmo',
      'minimum': '\$1.00',
      'fee': 'Fee: Free',
      'color': Color(0xFF3D95CE),
      'type': 'withdraw',
    },
    {
      'name': 'Cash App',
      'minimum': '\$1.00',
      'fee': 'Fee: Free',
      'color': Color(0xFF00D632),
      'type': 'withdraw',
    },
    {
      'name': 'Skrill',
      'minimum': '\$5.00',
      'fee': 'Fee: \$0.50',
      'color': Color(0xFF862165),
      'type': 'withdraw',
    },
    {
      'name': 'Apple Pay',
      'minimum': '\$1.00',
      'fee': 'Fee: Free',
      'color': Color(0xFF000000),
      'type': 'withdraw',
    },
    {
      'name': 'Google Pay',
      'minimum': '\$1.00',
      'fee': 'Fee: Free',
      'color': Color(0xFF4285F4),
      'type': 'withdraw',
    },
  ];

  // Cryptocurrency methods
  static const List<Map<String, dynamic>> cryptoMethods = [
    {
      'name': 'Bitcoin',
      'minimum': '\$10.00',
      'fee': 'Fee: Network',
      'color': AppColors.goldYellow,
      'type': 'crypto',
      'symbol': 'BTC',
      'network': 'Bitcoin',
    },
    {
      'name': 'Ethereum',
      'minimum': '\$5.00',
      'fee': 'Fee: Network',
      'color': Color(0xFF627EEA),
      'type': 'crypto',
      'symbol': 'ETH',
      'network': 'Ethereum',
    },
    {
      'name': 'USDT',
      'minimum': '\$5.00',
      'fee': 'Fee: Network',
      'color': Color(0xFF26A17B),
      'type': 'crypto',
      'symbol': 'USDT',
      'network': 'TRC20',
    },
    {
      'name': 'USDC',
      'minimum': '\$5.00',
      'fee': 'Fee: Network',
      'color': Color(0xFF2775CA),
      'type': 'crypto',
      'symbol': 'USDC',
      'network': 'ERC20',
    },
    {
      'name': 'Litecoin',
      'minimum': '\$10.00',
      'fee': 'Fee: Network',
      'color': Color(0xFFBEBEBE),
      'type': 'crypto',
      'symbol': 'LTC',
      'network': 'Litecoin',
    },
    {
      'name': 'Dogecoin',
      'minimum': '\$5.00',
      'fee': 'Fee: Network',
      'color': Color(0xFFC2A633),
      'type': 'crypto',
      'symbol': 'DOGE',
      'network': 'Dogecoin',
    },
    {
      'name': 'Binance Coin',
      'minimum': '\$10.00',
      'fee': 'Fee: Network',
      'color': Color(0xFFF3BA2F),
      'type': 'crypto',
      'symbol': 'BNB',
      'network': 'BSC',
    },
    {
      'name': 'Cardano',
      'minimum': '\$10.00',
      'fee': 'Fee: Network',
      'color': Color(0xFF0033AD),
      'type': 'crypto',
      'symbol': 'ADA',
      'network': 'Cardano',
    },
  ];

  // Get all methods combined
  static List<Map<String, dynamic>> get allMethods => [
    ...withdrawMethods,
    ...cryptoMethods,
  ];

  // Get limited withdraw methods for main page (4 items)
  static List<Map<String, dynamic>> get limitedWithdrawMethods =>
      withdrawMethods.take(4).toList();

  // Get limited crypto methods for main page (4 items)
  static List<Map<String, dynamic>> get limitedCryptoMethods =>
      cryptoMethods.take(4).toList();

  // Get method details by name
  static Map<String, dynamic>? getMethodDetails(String methodName) {
    try {
      return allMethods.firstWhere((method) => method['name'] == methodName);
    } catch (e) {
      return null;
    }
  }

  // Check if method is crypto
  static bool isCryptoMethod(String methodName) {
    final method = getMethodDetails(methodName);
    return method?['type'] == 'crypto';
  }
}
