import 'package:provider/provider.dart';
import 'package:connecten/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nearby_connections/nearby_connections.dart';

class ConnectionProvider extends ChangeNotifier {
  final Strategy strategy = Strategy.P2P_STAR;

  ConnectionProvider() {
    checkPermissions();
  }

  Future checkPermissions() async {
    await getLocationPermission();
    await getBluetoothPermission();
    await checkLocationEnabled();
    notifyListeners();
  }

  Future enableAdvertising(String? uid) async {
    try {
      bool a = await Nearby().startAdvertising(
        uid!,
        strategy,
        onConnectionInitiated: onConnectionInit,
        onConnectionResult: (id, status) {
          print(status);
        },
        onDisconnected: (id) {
          print("Disconnected: id $id");
        },
      );
    } catch (exception) {
      print(exception);
    }
    notifyListeners();
  }

  void onConnectionInit(String id, ConnectionInfo info) {
    print(id);
  }

  Future disableAdvertising() async {
    await Nearby().stopAdvertising();
    notifyListeners();
  }

  Future getLocationPermission() async {
    if (await Nearby().checkLocationPermission() == false) {
      await Nearby().askLocationPermission();
    }
    notifyListeners();
  }

  Future getBluetoothPermission() async {
    if (await Nearby().checkBluetoothPermission() == false) {
      Nearby().askBluetoothPermission();
    }
    notifyListeners();
  }

  Future checkLocationEnabled() async {
    if (await Nearby().checkLocationEnabled() == false) {
      await Nearby().enableLocationServices();
    }
    notifyListeners();
  }
}
