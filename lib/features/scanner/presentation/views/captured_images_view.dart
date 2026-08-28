import 'package:flutter/material.dart';
import 'package:scanify_pdf/features/scanner/presentation/views/widgets/captured_images_app_bar.dart';
import 'package:scanify_pdf/features/scanner/presentation/views/widgets/captured_images_grid.dart';
import 'package:scanify_pdf/features/scanner/presentation/views/widgets/captured_images_lower_section.dart';

class CapturedImagesView extends StatelessWidget {
  const CapturedImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CapturedImagesAppBar(),
            Expanded(child: CapturedImagesGrid()),
            CapturedImagesLowerSection(),
          ],
        ),
      ),
    );
  }
}
