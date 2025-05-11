import 'package:bookly/Core/utils/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../data/model/bookModel.dart';
import 'BookRating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kBookDeatilsView, extra: bookModel);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 140, // Adjusted height for better visuals
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                      'https://via.placeholder.com/150',
                  // Fallback URL for null case
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.volumeInfo?.title ?? 'Unknown Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    bookModel.volumeInfo?.authors?.first ?? 'Unknown Author',
                    style: Styles.textStyle14.copyWith(
                      color: Colors.grey[400],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Text(
                        r"FREE",
                        style: Styles.textStyle20,
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookModel.volumeInfo?.pageCount ?? 0,
                        count: bookModel.volumeInfo?.pageCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
