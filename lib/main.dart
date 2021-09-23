import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/Src/Cubits/Bluetooth/bluetooth_cubit.dart';
import 'package:flutter_task/Src/Cubits/Connection/connection_cubit.dart';
import 'package:flutter_task/Src/Cubits/Connectivity/connectivity_cubit.dart';
import 'package:flutter_task/Src/Cubits/Permission/permission_cubit.dart';
import 'package:flutter_task/Src/UI/Screens/report_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> PermissionCubit()),
        BlocProvider(create: (context)=> ConnectivityCubit()),
        BlocProvider(create: (context)=> IConnectionCubit()),
        BlocProvider(create: (context)=> BluetoothCubit())
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: ReportScreen(),
      ),
    );
  }
}
