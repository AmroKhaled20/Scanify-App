import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanify_pdf/core/services/hive_service.dart';
import 'package:scanify_pdf/core/utils/app_router.dart';
import 'package:scanify_pdf/core/utils/service_locator.dart';
import 'package:scanify_pdf/core/utils/simple_bloc_observer.dart';
import 'package:scanify_pdf/features/home/domain/use_cases/get_saved_files_use_case.dart';
import 'package:scanify_pdf/features/home/presentation/manager/home%20cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    BlocProvider(
      create: (context) =>
          HomeCubit(getIt.get<GetSavedFilesUseCase>())..fetchSavedFiles(),
      child: const ScanifyPDF(),
    ),
  );
}

class ScanifyPDF extends StatelessWidget {
  const ScanifyPDF({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1019),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
