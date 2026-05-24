import 'package:go_router/go_router.dart';
import 'package:scanify_pdf/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kFilesView = '/filesView';

  static final router = GoRouter(
    initialLocation: kHomeView,
    routes: [
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      // GoRoute(
      //   path: kBookViewDetails,
      //   builder: (context, state) =>
      //       BookDetailsView(bookModel: state.extra as BookModel),
      // ),
    ],
  );
}
