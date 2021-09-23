import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'connection_state.dart';

class IConnectionCubit extends Cubit<IConnectionState> {
  IConnectionCubit() : super(IConnectionState(connectionStatus: false)){
    _connectionTest();
  }

  Future _connectionTest() async{
    final Dio dio = Dio();

    try{
      dio.get('https://thestartup.herokuapp.com/testing').asStream().listen(
        (event) {
          if (event.statusCode == 200) emit(IConnectionState(connectionStatus: true));
          else emit(IConnectionState(connectionStatus: false));
      });
    }catch(err){
      emit(IConnectionState(connectionStatus: false));
    }
  }
}
