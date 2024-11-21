import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  final IconData icon;
  final String count;
  final VoidCallback onPressed;

  const NotificationIcon({
    super.key,
    required this.icon,
    required this.count,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        children: [
          Icon(icon),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
              ),
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
} 