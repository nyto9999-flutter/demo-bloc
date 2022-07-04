import 'package:demo_bloc/cubit/counter_cubit.dart';
import 'package:demo_bloc/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        title: 'Bloc demo',
        home: HomePage(title: 'BLoC Demo'),
      ),
    );
  }
}
