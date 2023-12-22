import 'package:app_components/screens/alerts_screen.dart';
import 'package:app_components/screens/cards_screen.dart';
import 'package:app_components/screens/list_screen.dart';
import 'package:app_components/screens/photo_screen.dart';
import 'package:app_components/screens/routing_screen.dart';
import 'package:app_components/screens/sliders_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Componentes')),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            leading: const Icon(Icons.pages),
            title: const Text('Routing'),
            onTap: () {
              Navigator.pushNamed(context, RoutingScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Listas'),
            onTap: () {
              Navigator.pushNamed(context, ListScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_alert),
            title: const Text('Alertas'),
            onTap: () {
              Navigator.pushNamed(context, AlertsScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_membership_sharp),
            title: const Text('Tarjetas - Cards'),
            onTap: () {
              Navigator.pushNamed(context, CardsScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Album de fotos'),
            onTap: () {
              Navigator.pushNamed(context, PhotoScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.slideshow_rounded),
            title: const Text('Sliders'),
            onTap: () {
              Navigator.pushNamed(context, SlidersScreen.routeName);
            },
          ),
          const ListTile(
            leading: Icon(Icons.screen_lock_landscape),
            title: Text('Infinit Scroll'),
          ),
          const ListTile(
            leading: Icon(Icons.format_align_center),
            title: Text('Formularios'),
          ),
        ],
      ),
    );
  }
}
