import 'package:flutter/material.dart';
import '../../../../core/config/theme/app_text_styles.dart';

/// Profile screen - User profile and settings
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile', style: AppTextStyles.h5));
  }
}
