import 'package:flutter/material.dart';

class Services {
  static final Services instance = Services._internal();

  factory Services() => instance;

  Services._internal();

  Future<List<String>> getImages(int initialImage, int amount) async {
    try {
      List<String> images = [];

      for (int i = initialImage; i < initialImage + amount; i++) {
        final url = 'https://picsum.photos/id/$i/1200';
        images.add(url);
      }
      // Usado para simular una petición a un servidor
      await Future.delayed(const Duration(seconds: 2));
      return images;
    } catch (err) {
      debugPrint('Error: $err');
      rethrow;
    }
  }
}
