import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class SlidersScreen extends StatefulWidget {
  const SlidersScreen({super.key});

  static const routeName = '/sliders';

  @override
  State<SlidersScreen> createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SlidersScreen> {
  double scale = 0.1;
  double angle = 0.0;
  double blur = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliders')),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Transform.rotate(
              angle: angle * pi,
              child: Transform.scale(
                scale: scale,
                child: Image.asset(
                  'assets/image.png',
                  height: 300,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('Escala: ${scale.toStringAsFixed(2)}'),
          Slider(
            value: scale,
            activeColor: Colors.redAccent,
            onChanged: (newValue) {
              setState(() {
                scale = newValue;
              });
            },
          ),
          const SizedBox(height: 20),
          Text('Rotación: ${angle.toStringAsFixed(2)}'),
          Slider(
            min: 0,
            max: 2,
            value: angle,
            activeColor: Colors.deepOrangeAccent,
            onChanged: (newValue) {
              /// 0   ---> 0
              /// 0.5 ---> 90
              /// 1   ---> 180
              /// 1.5 ---> 270
              /// 2   ---> 360
              setState(() {
                angle = newValue;
              });
            },
          ),
          const SizedBox(height: 20),
          Text('Blur: ${blur.toStringAsFixed(2)}'),
          Slider(
            min: 0,
            max: 10,
            value: blur,
            activeColor: Colors.blueAccent,
            onChanged: (newValue) {
              setState(() {
                blur = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
