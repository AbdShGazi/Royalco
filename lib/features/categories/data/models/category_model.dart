class CategoryModel {
  final String id;
  final String name;
  final String? imageUrl;
  final String? icon;

  CategoryModel({
    required this.id,
    required this.name,
    this.imageUrl,
    this.icon,
  });
} 