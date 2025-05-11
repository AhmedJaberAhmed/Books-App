import 'package:bookly/Core/utils/app_routes.dart';
import 'package:bookly/Features/Home/presentatin/views/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart'; // Add this import for navigation

import '../../manager/similar_cubit/similar_cubit.dart';
import 'CustomBookImage.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarCubit, SimilarState>(
      builder: (context, state) {
        if (state is SimilarSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 2,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final book = state.books[index];
                  return GestureDetector(
                    onTap: () {

                      GoRouter.of(context).push(
                        AppRoutes.kBookDeatilsView,
                        extra: book,
                      );
                    },
                    child: CustomBookImage(
                      imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? "",
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 16),
              ),
            ),
          );
        } else if (state is SimilarFaluire) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.purpleAccent),
          );
        }
      },
    );
  }
}