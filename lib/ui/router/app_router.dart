import 'package:demo_bloc/ui/screens/home_screen.dart';
import 'package:demo_bloc/ui/screens/second_screen.dart';
import 'package:demo_bloc/ui/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: 'HomeScreen',
                  colors: Colors.blueAccent,
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                  title: 'SecondScreen',
                  colors: Colors.greenAccent,
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                  title: 'ThirdScreen',
                  colors: Colors.redAccent,
                ));
      default:
        return null;
    }
  }
}
