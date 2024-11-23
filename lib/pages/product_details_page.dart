import 'package:flutter/material.dart';
import 'package:royalco/widgets/custom_app_bar.dart';
import 'package:royalco/widgets/search_icon.dart';
import 'package:royalco/pages/orders_page.dart';

class ProductDetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final List<String> images;
  final double price;

  const ProductDetailsPage({
    Key? key,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _currentPage = 0;
  String? selectedCapacity;
  final TextEditingController _itemNumberController = TextEditingController();
  int quantity = 1;

  // Define options
  final List<String> capacityOptions = ['1000L', '2000L', '3000L'];

  Widget _buildCapacityDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          // Customize the dropdown menu theme
          canvasColor: const Color(0xFF00B6F1),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedCapacity,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            dropdownColor: const Color(0xFF00B6F1),
            menuMaxHeight: 200,
            hint: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                'السعة',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            items: capacityOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    value,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedCapacity = newValue;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return capacityOptions.map<Widget>((String value) {
                return Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    value,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }

  void _showQuantityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'يرجى تحيد الكمة',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'PACK',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black54,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove, size: 20),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                            color: Colors.black54,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            quantity.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, size: 20),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'الحزمة = 12 قطعة',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF5C5C),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'إلغاء',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1B2B5D),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'تمت إضافة $quantity منتج إلى السلة',
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'أضف للسلة',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(showBackButton: true),
      body: SafeArea(
        child: Column(
          children: [
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Title
                      const Text(
                        'خزانات مياه',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00B6F1),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const Text(
                        '200 لتر',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.right,
                      ),

                      // Image carousel
                      SizedBox(
                        height: 300,
                        child: PageView.builder(
                          itemCount: widget.images.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Image.network(
                              widget.images[index],
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      ),

                      // Dots indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.images.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? const Color(0xFF00B6F1)
                                  : Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      // Description
                      const Text(
                        'خزان مياه بلاستيكي احادي الطبقة عالي الجودة بسعة 200 لتر. مصنوع من البولي ايثلين باستخدام القولبة الدورانية، وهو مقاوم للعوامل الجوية، قابل لإعادة التدوير، ويمكن استخدامه في الأماكن',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.right,
                      ),

                      // See more button
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'رؤية المزيد',
                          style: TextStyle(
                            color: Color(0xFF00B6F1),
                          ),
                        ),
                      ),

                      // Item number input
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: _itemNumberController,
                          textAlign: TextAlign.right,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'رقم الصنف',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),
                      _buildCapacityDropdown(),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to favorites logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00B6F1),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border, color: Colors.white),
                          SizedBox(width: 8),
                          Text('أضف للمفضلة', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _showQuantityDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B2B5D),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined, color: Colors.white),
                          SizedBox(width: 8),
                          Text('أضف للسلة', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 