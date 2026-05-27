import 'package:flutter/material.dart';
import 'package:scanify_pdf/features/scanner/presentation/widgets/scanner_view_body.dart';

class ScannerView extends StatelessWidget {
  const ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ScannerViewBody());
  }
}
