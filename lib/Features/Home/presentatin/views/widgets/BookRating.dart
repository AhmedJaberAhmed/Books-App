import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start, required this.count, required this.rating});

  final MainAxisAlignment mainAxisAlignment;
  final dynamic count;
  final dynamic rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          size: 20,
          FontAwesomeIcons.solidStar,
          color: Colors.amberAccent,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text("$rating",
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 5,
        ),
        Text("($count)",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
