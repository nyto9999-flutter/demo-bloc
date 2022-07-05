import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_bloc/logic/cubits/counter_cubit.dart';
import 'package:demo_bloc/logic/cubits/internet_cubit.dart';
import 'package:demo_bloc/ui/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (internetCubitContext) =>
              InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (counterCubitContext) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc demo',
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
