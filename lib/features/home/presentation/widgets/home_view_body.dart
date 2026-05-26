import 'package:flutter/material.dart';
import 'package:scanify_pdf/features/home/presentation/widgets/upper_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(children: [UpperSection()]),
      ),
    );
  }
}
