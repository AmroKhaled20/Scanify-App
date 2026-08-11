import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/utils/app_spacing.dart';
import 'package:scanify_pdf/core/utils/size_extensions.dart';
import 'package:scanify_pdf/core/widgets/custom_app_bar.dart';
import 'package:scanify_pdf/features/home/presentation/views/widgets/custom_row_buttons.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s40,
      ),
      child: Column(
        children: [
          CustomAppBar(title: 'Home'),
          SizedBox(height: context.h * 0.06),
          const CustomRowButtons(),
        ],
      ),
    );
  }
}
