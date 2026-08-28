import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scanify_pdf/features/home/presentation/views/home_view.dart';
import 'package:scanify_pdf/features/scanner/presentation/manager/scanner%20cubit/scanner_cubit.dart';
import 'package:scanify_pdf/features/scanner/presentation/views/scanner_view.dart';
import 'package:scanify_pdf/features/scanner/presentation/views/captured_images_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kCameraView = '/cameraView';
  static const kFilesView = '/filesView';
  static const kCapturedImagesView = '/capturedImagesView';
  static final router = GoRouter(
    initialLocation: kHomeView,
    routes: [
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kCameraView,
        builder: (context, state) => const ScannerView(),
      ),
      GoRoute(
        path: kCapturedImagesView,
        builder: (context, state) {
          return BlocProvider.value(
            value: state.extra as ScannerCubit,
            child: const CapturedImagesView(),
          );
        },
      ),
    ],
  );
}
