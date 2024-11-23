import 'package:flutter/material.dart';
import 'package:royalco/widgets/search_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const SearchIcon(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: AnimatedIconButton(
            icon: Icons.shopping_cart_outlined,
            badge: '2',
            onTap: () {
              print('Cart clicked');
              // Add navigation logic here
            },
          ),
        ),
        AnimatedIconButton(
          icon: Icons.notifications_outlined,
          badge: '2',
          onTap: () {
            print('Notifications clicked');
            // Add navigation logic here
          },
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class AnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final String badge;
  final VoidCallback onTap;

  const AnimatedIconButton({
    super.key,
    required this.icon,
    required this.badge,
    required this.onTap,
  });

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    await _controller.forward();
    await _controller.reverse();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          children: [
            Icon(
              widget.icon,
              color: const Color(0xFF00B6F1),
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
                child: Text(
                  widget.badge,
                  style: const TextStyle(
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
    );
  }
} 