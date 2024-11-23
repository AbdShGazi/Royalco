import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingM,
          vertical: AppSizes.paddingS,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (category.icon != null)
              Icon(
                IconData(
                  int.parse(category.icon!),
                  fontFamily: 'MaterialIcons',
                ),
                color: isSelected ? AppColors.white : AppColors.textSecondary,
                size: AppSizes.iconS,
              ),
            if (category.icon != null)
              const SizedBox(width: AppSizes.paddingS),
            Text(
              category.name,
              style: isSelected
                  ? AppTextStyles.buttonText
                  : AppTextStyles.menuItem,
            ),
          ],
        ),
      ),
    );
  }
} 