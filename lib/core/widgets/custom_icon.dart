import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/utils/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    this.iconColor = Colors.white,
    this.onTap,
  });

  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: primaryColor.withAlpha(35),
        ),
        child: Icon(icon, size: 25, color: iconColor),
      ),
    );
  }
}
