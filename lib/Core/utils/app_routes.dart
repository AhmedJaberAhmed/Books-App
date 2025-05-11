import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Features/Home/data/Repository/home_repo_implementation.dart';
import 'package:bookly/Features/splash/presentation/view_model/views/widgets/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Features/Home/data/model/bookModel.dart';
import '../../Features/Home/presentatin/manager/similar_cubit/similar_cubit.dart';
import '../../Features/Home/presentatin/views/BookDetailsView.dart';
import '../../Features/Home/presentatin/views/home_view.dart';
import '../../Features/search/presentaion/views/search_view.dart';

abstract class AppRoutes {
  static const kHomeView = '/kHomeView';
  static const kBookDeatilsView = '/kBookDeatilsView';
  static const kSearchView = '/kSearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDeatilsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarCubit(getIt.get<HomeRepoImplementation>()),
            child: BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
