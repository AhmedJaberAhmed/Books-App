import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.2 / 4,
      child: Container(
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
        child: CachedNetworkImage(
          imageUrl:  imageUrl ,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
                color: Color(0xFFFF00FF)
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(
              Icons.broken_image,
              color: Colors.grey,
              size: 50,
            ),
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
