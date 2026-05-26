import 'package:flutter/material.dart';
import 'package:scanify_pdf/features/home/presentation/widgets/upper_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [UpperSection()]));
  }
}
