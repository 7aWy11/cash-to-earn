/// Application-wide constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'CashToEarn';
  static const String appVersion = '1.0.0';

  // API Configuration
  static const String apiBaseUrl = ''; // Update with your API URL
  static const int apiConnectionTimeout = 30000; // 30 seconds
  static const int apiReceiveTimeout = 30000; // 30 seconds

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Local Storage Keys
  static const String keyAccessToken = 'access_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyUserEmail = 'user_email';
  static const String keyIsFirstTime = 'is_first_time';
  static const String keyOnboardingComplete = 'onboarding_complete';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';

  // Animation Durations (milliseconds)
  static const int animationDurationShort = 200;
  static const int animationDurationMedium = 300;
  static const int animationDurationLong = 500;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double defaultElevation = 4.0;

  // Offer Status
  static const String offerStatusPending = 'pending';
  static const String offerStatusInProgress = 'in_progress';
  static const String offerStatusCompleted = 'completed';
  static const String offerStatusPaid = 'paid';
  static const String offerStatusRejected = 'rejected';

  // Payment Methods
  static const String paymentPaypal = 'paypal';
  static const String paymentVenmo = 'venmo';
  static const String paymentCashApp = 'cash_app';
  static const String paymentBitcoin = 'bitcoin';
  static const String paymentEthereum = 'ethereum';
  static const String paymentGiftCard = 'gift_card';

  // Minimum Withdrawal
  static const double minimumWithdrawal = 5.0;

  // Regular Expressions
  static const String emailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String usernameRegex = r'^[a-zA-Z0-9_]{3,20}$';
  static const String passwordRegex =
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$';
}
