## 個人筆記
[資料來源](https://www.youtube.com/watch?v=THCkkQ-V1-8&list=PLptHs0ZDJKt9bJOOuaOXdCLSo7ir6gfVN)

# Bloc VS Cubit

## Bloc

- events觸發state

```dart
abstract class CounterEvent {}
class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
  }
}
```

## Cubit

- cubit is part of bloc
- function觸發state

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}
```

## BlocProvider

- blocProvider 也是 DI widget
- provide a single instance of BLoC to the subtree below it
- blocProvider

## BlocBuilder

- A Widget that hellps re-building the UI based on bloc state changes
- It is located between the state changes and UI
- BlockBuilder require bloc or cubic and the builder function `builder: (context, state)`
- BlockBuilder can be called mutiple times inside Flutter widgets
- It is not recommend calling dialog with BlockBuilder

## BlockListener
- BlocListenr listens to the stream of data, BlocBuilder listens and rebuilt the UI, so It is safe to put blcListenr at the top of tree

## BlocConsumer
- BlockBuilder + BlockListener = BlocConsumer


## BlockListener vs StreamSubscription

### BlockListener
- Pros
  -it takes care INTERNALLY of all StreamSubscription
  -No need to worry about stream/memory leaks
### StreamSubscription
- Pros
  - organised structured, easy to read and maintain
  -will help you practice stream skills
- Cons
  -it may get cluttered really fast on huge apps
  -not closing streamSubscription => huge memory leaks

