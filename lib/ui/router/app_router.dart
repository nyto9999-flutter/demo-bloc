import 'package:demo_bloc/logic/cubits/counter_cubit.dart';
import 'package:demo_bloc/ui/screens/home_screen.dart';
import 'package:demo_bloc/ui/screens/second_screen.dart';
import 'package:demo_bloc/ui/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const HomeScreen(
                    title: 'HomeScreen',
                    colors: Colors.blueAccent,
                  ),
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(
                    title: 'SecondScreen',
                    colors: Colors.greenAccent,
                  ),
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const ThirdScreen(
                    title: 'ThirdScreen',
                    colors: Colors.redAccent,
                  ),
                ));
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
