class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final String category;
  final String? capacity;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    this.capacity,
  });
} 