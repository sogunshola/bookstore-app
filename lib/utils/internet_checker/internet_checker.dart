import 'config.dart';

class ConnectionChecker {
  bool connected;

  dynamic checkConnection() async {
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    bool connection = await connectionStatus.checkConnection();
    if (connection == false) {
      connected = false;
      throw ('Internet connection lost');
    }
    connected = true;
  }
}
