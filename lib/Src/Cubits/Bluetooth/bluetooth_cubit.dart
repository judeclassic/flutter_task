import 'package:bloc/bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothState> {
  BluetoothCubit() : super(BluetoothState(bluetoothStatus: false)){
    _bluetoothTest();
  }

  Future _bluetoothTest() async{
    final FlutterBlue _flutterBlue = FlutterBlue.instance;

    _flutterBlue.state.asBroadcastStream().listen((event) {
      if (event.index < 5 ){
        emit(BluetoothState(bluetoothStatus: true));
      }else{
        emit(BluetoothState(bluetoothStatus: false));
      }
    });
  }
}