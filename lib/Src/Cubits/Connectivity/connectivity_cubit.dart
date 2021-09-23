import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityState(result: ConnectivityResult.none, isConnected: false)){
    _connectivityTest();
  }

  Future _connectivityTest() async{
    Connectivity().onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.none){
          emit(ConnectivityState(result: event, isConnected: false));
        }else{
          emit(ConnectivityState(result: event, isConnected: true));
        }
      }
    );
  }
}