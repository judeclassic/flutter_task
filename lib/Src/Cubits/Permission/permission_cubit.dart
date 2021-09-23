import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionState(permission: LocationPermission.denied)){
    _checkPermission();
  }

  Future _checkPermission() async {
    Geolocator.requestPermission().asStream().listen((event) {
      emit(PermissionState(permission: event));
    });
  }
}
