import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements INetworkInfo {
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.firstOrNull == ConnectivityResult.none
        ? false
        : true;
  }
}
