import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBookImage extends StatelessWidget {
  const ShimmerBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}

class HorizontalShimmerList extends StatelessWidget {
  const HorizontalShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Adjust height as needed for the row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 10, // Number of shimmer items
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 16), // Spacing between items
            child: SizedBox(
              width: 80, // Set a fixed width for the item
              child: ShimmerBookImage(),
            ),
          );
        },
      ),
    );
  }
}
