import 'package:bloc_test/bloc_test.dart';
import 'package:demo_bloc/logic/cubits/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    test('initial state of CounterCubit is CounterState(counterValue:0)', () {
      expect(counterCubit!.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'the CounterCubit should emit a CounterState(counterValue:1, wasIncremented:true) when the increment function is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );
    blocTest<CounterCubit, CounterState>(
      'the CounterCubit should emit a CounterState(counterValue: -1, wasIncremented:false) when the increment function is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
