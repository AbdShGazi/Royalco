import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/app_button.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/profile_menu_item.dart';
import '../../../../core/constants/app_strings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.paddingL),
              const ProfileAvatar(),
              const SizedBox(height: AppSizes.paddingM),
              const Text(
                AppStrings.welcome,
                style: AppTextStyles.heading1,
              ),
              const SizedBox(height: AppSizes.paddingS / 2),
              const Text(
                'بشار',
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: AppSizes.paddingL),
              AppButton(
                text: AppStrings.editProfile,
                onPressed: () {},
              ),
              const SizedBox(height: AppSizes.paddingL),
              ProfileMenuItem(
                icon: Icons.assignment_outlined,
                title: AppStrings.orders,
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.star_outline,
                title: AppStrings.newItems,
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.history,
                title: AppStrings.browsingHistory,
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.favorite_outline,
                title: AppStrings.favorites,
                onTap: () {},
              ),
              const Spacer(),
              AppButton(
                text: AppStrings.logout,
                onPressed: () {},
                type: AppButtonType.secondary,
                width: AppSizes.logoutButtonWidth,
                borderRadius: AppSizes.radiusM,
              ),
              const SizedBox(height: AppSizes.paddingM),
            ],
          ),
        ),
      ),
    );
  }
} 