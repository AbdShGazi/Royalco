import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
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
                  fontSize: 20,
                  color: Color(0xFF00B6F1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'بشار',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00B6F1),
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'تعديل الملف الشخصي',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildMenuItem(Icons.assignment_outlined, 'الطلبيات'),
              _buildMenuItem(Icons.star_outline, 'الأصناف الجديدة'),
              _buildMenuItem(Icons.history, 'أرشيف التصفح'),
              _buildMenuItem(Icons.favorite_outline, 'المفضلة'),
              const Spacer(),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4D4D),
                    minimumSize: const Size(double.infinity, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'تسجيل خروج',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        trailing: Icon(
          icon,
          color: Colors.grey[600],
          size: 20,
        ),
        title: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[800],
          ),
        ),
        onTap: () {},
      ),
    );
  }
} 