import 'package:go_router/go_router.dart';
import 'package:scanify_pdf/features/home/presentation/views/home_view.dart';
import 'package:scanify_pdf/features/scanner/presentation/views/camera_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kCameraView = '/cameraView';
  static const kFilesView = '/filesView';

  static final router = GoRouter(
    initialLocation: kHomeView,
    routes: [
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kCameraView,
        builder: (context, state) => const CameraView(), // 👈 تعريف الشاشة هنا
      ),
    ],
  );
}
