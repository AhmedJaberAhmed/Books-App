import 'package:bookly/Core/utils/app_routes.dart';
import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Features/Home/presentatin/manager/featured_box_cubit/featured_box_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Core/utils/constants.dart';
import 'Features/Home/data/Repository/home_repo_implementation.dart';
import 'Features/Home/presentatin/manager/newst_books_cubit/newset_books_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBoxCubit(
          getIt.get<HomeRepoImplementation>()
          )..fetchFeaturedBox(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
              getIt.get<HomeRepoImplementation>()
          )..fetchNewstBox(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
          scaffoldBackgroundColor: kPrimamryColor,
        ),
      ),
    );
  }
}