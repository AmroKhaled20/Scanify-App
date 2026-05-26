import 'package:flutter/widgets.dart';
import 'package:scanify_pdf/constants.dart';
import 'package:scanify_pdf/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: primaryColor.withAlpha(150),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Image.asset(imagePath),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
