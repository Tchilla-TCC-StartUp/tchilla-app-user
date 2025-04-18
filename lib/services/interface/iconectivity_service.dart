import 'package:connectivity_plus/connectivity_plus.dart';

abstract class IConectivityService{
  Future<bool> isConnectedToInternet();

}