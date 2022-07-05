part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {}

class InternetLoading extends InternetState {
  final isLoading = true;
  @override
  List<Object?> get props => [isLoading];
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});

  @override
  List<Object?> get props => [connectionType];
}

class InternetDisconnected extends InternetState {
  @override
  List<Object?> get props => ['Diconnected'];
}
