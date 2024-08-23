import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnection {
  static Future<bool> isConnected() async {
    var status = await Connectivity().checkConnectivity();
    if (status.contains(ConnectivityResult.mobile) ||
        status.contains(ConnectivityResult.wifi)) {
      return true;
    }
    return false;
  }
}
