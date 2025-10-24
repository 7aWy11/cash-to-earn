import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/onboarding/presentation/pages/welcome_screen.dart';
import '../../../features/auth/presentation/pages/landing_screen.dart';
import '../../../features/auth/presentation/pages/create_account_screen.dart';
import '../../../features/auth/presentation/pages/username_avatar_screen.dart';
import '../../../features/main_navigation/presentation/pages/main_navigation_screen.dart';
import '../../../features/earn/presentation/pages/all_offers_screen.dart';
import '../../../features/earn/presentation/pages/all_top_games_screen.dart';
import '../../../features/earn/presentation/pages/all_in_app_tasks_screen.dart';
import '../../../features/my_offers/presentation/pages/my_offers_screen.dart';
import '../../../features/my_offers/presentation/pages/all_activities_screen.dart';
import '../../../features/cashout/presentation/pages/all_withdraw_methods_page.dart';
import '../../../features/cashout/presentation/pages/all_crypto_methods_page.dart';
import 'route_names.dart';

/// GoRouter configuration for the app
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.welcome,
    debugLogDiagnostics: true,
    routes: [
      // Onboarding
      GoRoute(
        path: RouteNames.welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),

      // Auth Flow
      GoRoute(
        path: RouteNames.landing,
        name: 'landing',
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        path: RouteNames.createAccount,
        name: 'create-account',
        builder: (context, state) => const CreateAccountScreen(),
      ),
      GoRoute(
        path: RouteNames.usernameAvatar,
        name: 'username-avatar',
        builder: (context, state) => const UsernameAvatarScreen(),
      ),

      // Main Navigation with nested routes
      GoRoute(
        path: RouteNames.main,
        name: 'main',
        builder: (context, state) => const MainNavigationScreen(),
      ),

      // All Offers
      GoRoute(
        path: RouteNames.allOffers,
        name: 'all-offers',
        builder: (context, state) => const AllOffersScreen(),
      ),

      // All Top Games
      GoRoute(
        path: RouteNames.allTopGames,
        name: 'all-top-games',
        builder: (context, state) => const AllTopGamesScreen(),
      ),

      // All In-App Tasks
      GoRoute(
        path: RouteNames.allInAppTasks,
        name: 'all-in-app-tasks',
        builder: (context, state) => const AllInAppTasksScreen(),
      ),

      // My Offers
      GoRoute(
        path: RouteNames.myOffers,
        name: 'my-offers',
        builder: (context, state) => const MyOffersScreen(),
      ),

      // All Activities
      GoRoute(
        path: RouteNames.allActivities,
        name: 'all-activities',
        builder: (context, state) => const AllActivitiesScreen(),
      ),

      // Offer Details
      GoRoute(
        path: '${RouteNames.offerDetails}/:id',
        name: 'offer-details',
        builder: (context, state) {
          final offerId = state.pathParameters['id'] ?? '';
          return OfferDetailsPlaceholder(offerId: offerId);
        },
      ),

      // Cashout Methods
      GoRoute(
        path: RouteNames.allWithdrawMethods,
        name: 'all-withdraw-methods',
        builder: (context, state) => const AllWithdrawMethodsPage(),
      ),
      GoRoute(
        path: RouteNames.allCryptoMethods,
        name: 'all-crypto-methods',
        builder: (context, state) => const AllCryptoMethodsPage(),
      ),

      // Support & Legal
      GoRoute(
        path: RouteNames.support,
        name: 'support',
        builder: (context, state) => const SupportPlaceholder(),
      ),
      GoRoute(
        path: RouteNames.privacyPolicy,
        name: 'privacy-policy',
        builder: (context, state) => const PrivacyPolicyPlaceholder(),
      ),
      GoRoute(
        path: RouteNames.termsOfService,
        name: 'terms-of-service',
        builder: (context, state) => const TermsOfServicePlaceholder(),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
  );
}

// Temporary placeholder widgets - will be replaced with actual implementations
class SplashPlaceholder extends StatelessWidget {
  const SplashPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Splash Screen')));
  }
}

class WelcomePlaceholder extends StatelessWidget {
  const WelcomePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Welcome Screen')));
  }
}

class LandingPlaceholder extends StatelessWidget {
  const LandingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Landing Screen')));
  }
}

class CreateAccountPlaceholder extends StatelessWidget {
  const CreateAccountPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Create Account Screen')));
  }
}

class PersonalizationPlaceholder extends StatelessWidget {
  const PersonalizationPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Personalization Screen')));
  }
}

class UsernameAvatarPlaceholder extends StatelessWidget {
  const UsernameAvatarPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Username Avatar Screen')));
  }
}

class MainNavigationPlaceholder extends StatelessWidget {
  const MainNavigationPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Main Navigation')));
  }
}

class OfferDetailsPlaceholder extends StatelessWidget {
  final String offerId;
  const OfferDetailsPlaceholder({super.key, required this.offerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Offer Details: $offerId')));
  }
}

class WithdrawFundsPlaceholder extends StatelessWidget {
  const WithdrawFundsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Withdraw Funds')));
  }
}

class SupportPlaceholder extends StatelessWidget {
  const SupportPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Support')));
  }
}

class PrivacyPolicyPlaceholder extends StatelessWidget {
  const PrivacyPolicyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Privacy Policy')));
  }
}

class TermsOfServicePlaceholder extends StatelessWidget {
  const TermsOfServicePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Terms of Service')));
  }
}

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Error', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            Text(error),
          ],
        ),
      ),
    );
  }
}
