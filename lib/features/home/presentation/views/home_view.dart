import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanify_pdf/core/services/permission_service.dart';
import 'package:scanify_pdf/core/utils/service_locator.dart';
import 'package:scanify_pdf/features/home/domain/use_cases/get_saved_files_use_case.dart';
import 'package:scanify_pdf/features/home/presentation/manager/home%20cubit/home_cubit.dart';
import 'package:scanify_pdf/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:scanify_pdf/features/scanner/presentation/manager/camera%20permission%20cubit/camera_permission_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CameraPermissionCubit(getIt.get<PermissionService>()),
        ),
        BlocProvider(
          create: (context) =>
              HomeCubit(getIt.get<GetSavedFilesUseCase>())..fetchSavedFiles(),
        ),
      ],
      child: const Scaffold(body: HomeViewBody()),
    );
  }
}
