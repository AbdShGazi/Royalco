import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../data/models/category_model.dart';
import 'category_card.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(CategoryModel) onCategoryTap;
  final String? selectedCategoryId;

  const CategoriesList({
    super.key,
    required this.categories,
    required this.onCategoryTap,
    this.selectedCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => 
            const SizedBox(width: AppSizes.paddingS),
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
            isSelected: categories[index].id == selectedCategoryId,
            onTap: () => onCategoryTap(categories[index]),
          );
        },
      ),
    );
  }
} 