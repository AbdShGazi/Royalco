import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  
  const ProfileAvatar({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSizes.iconL,
      backgroundColor: AppColors.background,
      child: imageUrl != null
          ? Image.network(imageUrl!)
          : const Icon(
              Icons.person,
              size: AppSizes.iconL,
              color: AppColors.textSecondary,
            ),
    );
  }
} 