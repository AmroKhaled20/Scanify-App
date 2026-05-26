import 'package:flutter/material.dart';
import 'package:scanify_pdf/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    this.iconColor = Colors.white,
  });
  final IconData icon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor.withAlpha(35),
      ),
      child: Icon(icon, size: 25),
    );
  }
}
