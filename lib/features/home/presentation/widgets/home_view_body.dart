import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(children: [CustomAppBar(title: 'Home')]),
      ),
    );
  }
}
