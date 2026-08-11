import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/utils/constants.dart';
import 'package:scanify_pdf/features/home/presentation/views/widgets/bottom_bar.dart';
import 'package:scanify_pdf/features/home/presentation/views/widgets/lower_section.dart';
import 'package:scanify_pdf/features/home/presentation/views/widgets/upper_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [const UpperSection(), const Spacer(), const LowerSection()],
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
