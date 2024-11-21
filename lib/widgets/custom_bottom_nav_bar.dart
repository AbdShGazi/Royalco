import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFEEEEEE),
            width: 1,
          ),
        ),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogoItem(0),
              _buildNavItem(1, Icons.favorite_border),
              _buildNavItem(2, Icons.person_outline),
              _buildNavItem(3, Icons.download_outlined),
              _buildNavItem(4, Icons.info_outline),
            ],
          ),
          // Blue indicator line
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            left: MediaQuery.of(context).size.width / 5 * _selectedIndex,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 2,
              color: const Color(0xFF00B6F1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoItem(int index) {
    final bool isSelected = _selectedIndex == index;
    
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        child: Center(
          child: Image.network(
            'https://royal.ps/assets/v3/img/royal-logo.png',
            width: 24,
            height: 24,
            color: isSelected ? const Color(0xFF00B6F1) : Colors.grey[400],
            errorBuilder: (context, error, stackTrace) {
              // Fallback to home icon if image fails to load
              return Icon(
                Icons.home_outlined,
                size: 24,
                color: isSelected ? const Color(0xFF00B6F1) : Colors.grey[400],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final bool isSelected = _selectedIndex == index;
    
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        child: Center(
          child: Icon(
            icon,
            size: 24,
            color: isSelected ? const Color(0xFF00B6F1) : Colors.grey[400],
          ),
        ),
      ),
    );
  }
} 