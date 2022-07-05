import 'package:bloc_test/bloc_test.dart';
import 'package:demo_bloc/constants/enums.dart';
import 'package:demo_bloc/logic/cubits/internet_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('InternetCubit', () {
    InternetCubit? internetCubit;

    setUp(() {
      internetCubit = InternetCubit(connectivity: Connectivity());
    });

    test('initial state of CounterCubit is CounterState(counterValue:0)', () {
      expect(internetCubit!.state, InternetLoading());
    });

    blocTest<InternetCubit, InternetState>(
      'mobile connected',
      build: () => InternetCubit(connectivity: Connectivity()),
      act: (cubit) => cubit.emitInternetConnected(ConnectionType.Mobile),
      expect: () => [InternetConnected(connectionType: ConnectionType.Mobile)],
    );
    blocTest<InternetCubit, InternetState>(
      'wifi connected',
      build: () => InternetCubit(connectivity: Connectivity()),
      act: (cubit) => cubit.emitInternetConnected(ConnectionType.Wifi),
      expect: () => [InternetConnected(connectionType: ConnectionType.Wifi)],
    );
    blocTest<InternetCubit, InternetState>(
      'disconnected',
      build: () => InternetCubit(connectivity: Connectivity()),
      act: (cubit) => cubit.emitInternetDisconnected(),
      expect: () => [InternetDisconnected()],
    );
    // blocTest<CounterCubit, CounterState>(
    //   'the CounterCubit should emit a CounterState(counterValue: -1, wasIncremented:false) when the increment function is called',
    //   build: () => CounterCubit(),
    //   act: (cubit) => cubit.decrement(),
    //   expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    // );
  });
}
