import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            const CircleAvatar(
              radius: 45,
              backgroundColor: Color(0xFFF5F5F5),
              child: Icon(
                Icons.person,
                size: 45,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'مرحبا',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF00B6F1),
              ),
            ),
            const Text(
              'بشار',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF00B6F1),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00B6F1),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'تعديل الملف الشخصي',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildMenuItem(
              icon: Icons.assignment_outlined,
              title: 'الطلبيات',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.star_outline,
              title: 'الأصناف الجديدة',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.history,
              title: 'أرشيف التصفح',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.favorite_outline,
              title: 'المفضلة',
              onTap: () {},
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4D4D),
                  minimumSize: const Size(160, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'تسجيل خروج',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              icon,
              size: 20,
              color: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
} 