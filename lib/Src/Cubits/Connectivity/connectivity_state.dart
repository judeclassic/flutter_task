part of 'connectivity_cubit.dart';

class ConnectivityState {
  ConnectivityState({
    required this.result,
    required this.isConnected
  });

  final ConnectivityResult result;
  final bool isConnected;
}
