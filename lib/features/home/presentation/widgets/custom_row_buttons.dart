import 'package:flutter/material.dart';
import 'package:scanify_pdf/features/home/presentation/widgets/custom_button.dart';

class CustomRowButtons extends StatelessWidget {
  const CustomRowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            imagePath: 'assets/icons/pdf.png',
            label: 'Image to PDF',
            onTap: () {},
          ),

          CustomButton(
            imagePath: 'assets/icons/scan.png',
            label: 'Smart Scan',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
