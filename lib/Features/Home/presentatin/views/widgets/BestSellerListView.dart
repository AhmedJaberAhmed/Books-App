import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../manager/newst_books_cubit/newset_books_cubit.dart';
import 'BookListViewItem.dart';
import 'ShimmerBookListViewItem.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BookListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewsetBooksFaluire) {
          return Center(child: Text(state.errMessage));
        } else {
          // Shimmer effect for loading
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: 6, // Placeholder items for shimmer
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: ShimmerBookListViewItem(),
              );
            },
          );
        }

      },
    );
  }
}
