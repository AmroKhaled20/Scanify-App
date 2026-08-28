import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/utils/app_spacing.dart';
import 'package:scanify_pdf/core/utils/constants.dart';
import 'package:scanify_pdf/core/utils/size_extensions.dart';
import 'package:scanify_pdf/core/utils/styles.dart';

class CapturedImagesLowerSection extends StatelessWidget {
  const CapturedImagesLowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s24,
        vertical: AppSpacing.s32,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF202334),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          // هنا هستدعي الـ Bottom Sheet بتاع تسمية الملف
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          fixedSize: Size(double.infinity, context.h * 0.07),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Convert to PDF',
          style: Styles.textStyle18.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
