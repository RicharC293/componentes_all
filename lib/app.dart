import 'package:app_components/screens/alerts_screen.dart';
import 'package:app_components/screens/cards_screen.dart';
import 'package:app_components/screens/home_screen.dart';
import 'package:app_components/screens/infinity_scroll_screen.dart';
import 'package:app_components/screens/list_screen.dart';
import 'package:app_components/screens/navigation_screen.dart';
import 'package:app_components/screens/photo_screen.dart';
import 'package:app_components/screens/routing_screen.dart';
import 'package:app_components/screens/sliders_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Componentes',
      initialRoute: HomeScreen.routeName,
      // theme: CustomTheme().customTheme(),
      // theme: ThemeData.dark(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        RoutingScreen.routeName: (context) => const RoutingScreen(),
        NavigationScreen.routeName: (context) => const NavigationScreen(),
        ListScreen.routeName: (context) => const ListScreen(),
        AlertsScreen.routeName: (context) => const AlertsScreen(),
        CardsScreen.routeName: (context) => const CardsScreen(),
        PhotoScreen.routeName: (context) => PhotoScreen(),
        SlidersScreen.routeName: (context) => const SlidersScreen(),
        InfinityScrollScreen.routeName: (context) =>
            const InfinityScrollScreen(),
      },
    );
  }
}
