import 'package:app_components/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  static const routeName = '/navigation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navegación')),
      body: Center(
        child: TextButton(
          child: const Text('Ir al home'),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          },
        ),
      ),
    );
  }
}
