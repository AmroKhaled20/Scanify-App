import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/utils/constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFF0D1019),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.home, color: primaryColor),
              Text('Home', style: TextStyle(color: primaryColor)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.file_copy, color: Colors.grey),
              Text('Files', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
