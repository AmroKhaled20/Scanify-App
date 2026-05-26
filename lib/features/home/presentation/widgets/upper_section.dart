import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/widgets/custom_app_bar.dart';
import 'package:scanify_pdf/features/home/presentation/widgets/custom_row_buttons.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Home'),
        const SizedBox(height: 50),
        const CustomRowButtons(),
      ],
    );
  }
}
