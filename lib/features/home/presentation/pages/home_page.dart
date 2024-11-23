import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../products/data/models/product_model.dart';
import '../../../categories/presentation/widgets/categories_list.dart';
import '../../../products/presentation/widgets/products_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;

  final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'الاثاث المنزلي',
      icon: '0xe25c', // chair_outlined
    ),
    CategoryModel(
      id: '2',
      name: 'الأدوات الصحية',
      icon: '0xe3ca', // bathroom_outlined
    ),
  ];

  final List<ProductModel> products = [
    ProductModel(
      id: '1',
      title: 'كرسي مودرن',
      description: 'كرسي مودرن مريح وعصري',
      price: 299.99,
      images: [
        'https://images.unsplash.com/photo-1592078615290-033ee584e267',
      ],
      category: '1',
      capacity: '1 قطعة',
    ),
  ];

  List<ProductModel> get filteredProducts {
    if (selectedCategoryId == null) return products;
    return products.where((product) => 
      product.category == selectedCategoryId
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingM),
              child: CategoriesList(
                categories: categories,
                selectedCategoryId: selectedCategoryId,
                onCategoryTap: (category) {
                  setState(() {
                    selectedCategoryId = category.id;
                  });
                },
              ),
            ),
            Expanded(
              child: ProductsGrid(
                products: filteredProducts,
                onProductTap: (product) {
                  // Handle product tap
                  print('Product tapped: ${product.title}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 