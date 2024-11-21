import 'package:flutter/material.dart';
import '../widgets/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _showMoreCards = false;
  int _selectedIndex = 0;

  void _scrollToMore() {
    setState(() {
      _showMoreCards = !_showMoreCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.search, color: Color(0xFF00B6F1)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFF00B6F1),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              const Icon(
                Icons.notifications_outlined,
                color: Color(0xFF00B6F1),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Image.network(
                          'https://royal.ps/assets/v3/img/royal-logo.png',
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'صباح الخير',
                        style: TextStyle(
                          fontSize: 32,
                          color: Color(0xFF00B6F1),
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const Text(
                        'بشار',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.2,
                        children: const [
                          CategoryCard(
                            title: 'الاثاث المنزلي',
                            icon: Icons.chair_outlined,
                          ),
                          CategoryCard(
                            title: 'الأدوات الصحية',
                            icon: Icons.plumbing_outlined,
                          ),
                          CategoryCard(
                            title: 'الأجهزة الكهربائية',
                            icon: Icons.electrical_services_outlined,
                          ),
                          CategoryCard(
                            title: 'الطاقة الذكية',
                            icon: Icons.bolt_outlined,
                          ),
                        ],
                      ),
                      if (_showMoreCards) ...[
                        const SizedBox(height: 16),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.2,
                          children: const [
                            CategoryCard(
                              title: 'مواد البناء',
                              icon: Icons.architecture_outlined,
                            ),
                            CategoryCard(
                              title: 'الأدوات المنزلية',
                              icon: Icons.home_repair_service_outlined,
                            ),
                            CategoryCard(
                              title: 'التكييف والتبريد',
                              icon: Icons.ac_unit_outlined,
                            ),
                            CategoryCard(
                              title: 'الإضاءة',
                              icon: Icons.light_outlined,
                            ),
                          ],
                        ),
                      ],
                      const SizedBox(height: 16),
                      Center(
                        child: IconButton(
                          icon: Icon(
                            _showMoreCards 
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: const Color(0xFF00B6F1),
                            size: 32,
                          ),
                          onPressed: _scrollToMore,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFEEEEEE),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 5,
                          color: _selectedIndex == index ? const Color(0xFF00B6F1) : Colors.transparent,
                        );
                      }),
                    ),
                  ),
                  BottomNavigationBar(
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    currentIndex: _selectedIndex,
                    selectedItemColor: const Color(0xFF00B6F1),
                    unselectedItemColor: Colors.grey,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.refresh_outlined),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.file_download_outlined),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.info_outline),
                        label: '',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
} 