import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/Src/Cubits/Bluetooth/bluetooth_cubit.dart';
import 'package:flutter_task/Src/Cubits/Connection/connection_cubit.dart';
import 'package:flutter_task/Src/Cubits/Connectivity/connectivity_cubit.dart';
import 'package:flutter_task/Src/Cubits/Permission/permission_cubit.dart';
import 'package:geolocator/geolocator.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      color: Colors.blueGrey[900]!,
                    )
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                        child: Text(
                      'Help Me Check What is Wrong',
                      style: TextStyle(fontSize: 24),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<PermissionCubit, PermissionState>(
                      builder: (context, state) {
                        return CheckerTile(
                          label:
                              (state.permission == LocationPermission.denied ||
                                      state.permission ==
                                          LocationPermission.deniedForever)
                                  ? 'Permission Denied'
                                  : 'Permission Granded',
                          opacity: state.permission == LocationPermission.denied
                              ? 0.4
                              : 1.0,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<ConnectivityCubit, ConnectivityState>(
                      builder: (context, state) {
                        return CheckerTile(
                            label: state.isConnected
                                ? 'Internet Connected'
                                : 'Internet Disconnected',
                            opacity: state.isConnected ? 1 : 0.4);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    BlocBuilder<IConnectionCubit, IConnectionState>(
                      builder: (context, state) {
                        return CheckerTile(
                            label: state.connectionStatus
                                ? 'Server Connected'
                                : 'Server Disconnected',
                            opacity: state.connectionStatus ? 1 : 0.4);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    BlocBuilder<BluetoothCubit, BluetoothState>(
                      builder: (context, state) {
                        return CheckerTile(
                            label: state.bluetoothStatus
                                ? 'Bluetooth Connected'
                                : 'Bluetooth Disconnected',
                            opacity: state.bluetoothStatus ? 1 : 0.4);
                      },
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class CheckerTile extends StatelessWidget {
  const CheckerTile({Key? key, required this.label, required this.opacity})
      : super(key: key);

  final String label;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
