import 'package:bookly/Features/Home/presentatin/views/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_routes.dart';
import '../../manager/featured_box_cubit/featured_box_cubit.dart';
import 'CustomBookImage.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBoxCubit, FeaturedBoxState>(
      builder: (context, state) {
        if (state is FeaturedBoxSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.kBookDeatilsView,
                          extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhcm_I1LY6AFg_pkQu8pq8kVqQEiviRedaDBvfang-GVJgT_ONZ9ewslXB508VBqWis-U&usqp=CAU',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBoxFaluire) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFFF00FF),
            ),
          );
        }
      },
    );
  }
}
