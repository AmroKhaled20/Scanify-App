import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanify_pdf/core/utils/app_router.dart';

void main() {
  runApp(const ScanifyPDF());
}

class ScanifyPDF extends StatelessWidget {
  const ScanifyPDF({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 22, 40),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
