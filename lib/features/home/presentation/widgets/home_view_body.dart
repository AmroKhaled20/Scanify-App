import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B475E),
      body: Column(children: [CustomAppBar(title: 'Home')]),
    );
  }
}
