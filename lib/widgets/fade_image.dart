import 'package:flutter/material.dart';

class FadeImage extends StatelessWidget {
  const FadeImage({super.key, required this.urlImage});
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: NetworkImage(urlImage),
      fit: BoxFit.cover,
    );
  }
}
