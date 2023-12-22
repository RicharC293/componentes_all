import 'package:app_components/screens/navigation_screen.dart';
import 'package:flutter/material.dart';

class RoutingScreen extends StatelessWidget {
  const RoutingScreen({super.key});

  static const routeName = '/routing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Routing')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Push'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NavigationScreen();
                  },
                ),
              );
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (context) {
              //       return const NavigationScreen();
              //     },
              //   ),
              // );
            },
          ),
          ListTile(
            title: Text('Push Named'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, NavigationScreen.routeName);
            },
          ),
          ListTile(
            title: Text('Push Replacement Named'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, NavigationScreen.routeName);
            },
          ),
          ListTile(
            title: Text('Push Named And Remove Until'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, NavigationScreen.routeName, (route) => false);
            },
          ),
          ListTile(
            title: Text('Pop'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
