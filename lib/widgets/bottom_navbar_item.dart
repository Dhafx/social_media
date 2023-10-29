import 'package:flutter/cupertino.dart';

class BottomNavbarItem extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final int color;

  const BottomNavbarItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: Color(color),
      ),
    );
  }
}
