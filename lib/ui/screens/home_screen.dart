import 'package:demo_bloc/constants/enums.dart';
import 'package:demo_bloc/logic/cubits/counter_cubit.dart';
import 'package:demo_bloc/logic/cubits/internet_cubit.dart';
import 'package:demo_bloc/ui/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.colors})
      : super(key: key);
  final String title;
  final Color colors;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          state.connectionType == ConnectionType.Wifi;
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          state.connectionType == ConnectionType.Mobile;
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (internetCubitContext, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text('Wifi');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text('Mobile');
                } else if (state is InternetDisconnected) {
                  return Text('Disconnected');
                }
                return CircularProgressIndicator();
              }),
              const Text('You have pushed the button this many times'),
              BlocConsumer<CounterCubit, CounterState>(
                listener: ((context, state) {
                  if (state.wasIncremented == true) {
                    Scaffold.of(context).showSnackBar(const SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(milliseconds: 300),
                    ));
                  } else if (state.wasIncremented == false) {
                    Scaffold.of(context).showSnackBar(const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ));
                  }
                }),
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    heroTag: Text(widget.title),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              MaterialButton(
                color: widget.colors,
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Go to Second Screen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
