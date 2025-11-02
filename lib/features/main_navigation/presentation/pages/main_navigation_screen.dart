import 'package:flutter/material.dart';

import '../../../cashout/presentation/pages/cashout_page.dart';
import '../../../earn/presentation/pages/earn_screen.dart';
import '../../../my_offers/presentation/pages/my_offers_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/side_drawer.dart';

/// Main navigation screen with bottom navigation and side drawer
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    EarnScreen(),
    MyOffersScreen(),
    CashoutScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
