import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.urlImage});
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlImage,
      errorBuilder: (context, _, __) {
        return Image.asset(
          'assets/placeholder.jpeg',
          fit: BoxFit.cover,
        );
      },
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
