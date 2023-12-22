import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const routeName = '/cards';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarjetas - Cards')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            // margin: const EdgeInsets.all(10),
            // elevation: 5,
            // color: Colors.blue[100],
            // shadowColor: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.photo_album),
                      const SizedBox(width: 10),
                      Expanded(
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Título de la tarjeta'),
                            const Text(
                              'Este es el subtitulo de la tarjeta, que puede ser más largo que el título y no se corta',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(onPressed: () {}, child: const Text('Continuar'))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
