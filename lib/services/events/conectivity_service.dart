import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/app_logs.dart';
import 'package:tchilla/services/interface/iconectivity_service.dart';

class ConectivityService extends IConectivityService {
  final AppLogs _loger = Get.find();

  Future<bool> isConnectedToInternet() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    _loger.info("Conexão usada: $connectivityResult");
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.other) ||
        connectivityResult.contains(ConnectivityResult.none) ||
        connectivityResult.contains(ConnectivityResult.vpn)) {
      return false;
    } else {
      return false;
    }
  }
}
