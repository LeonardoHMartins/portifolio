
import 'package:dart_ping/dart_ping.dart';
import 'package:portfolio/core/common/services/connection/connection_service.dart';

class ConnectionServiceImpl extends ConnectionService {
  ConnectionServiceImpl();

  // List<String> dns = [, '8.8.4.4', '1.1.1.1', '1.0.0.1', '9.9.9.9'];

  @override
  Future<bool> get isConnected async {
    try {
      Ping ping = Ping('8.8.8.8', count: 1);
      var response = await ping.stream.first;
      return response.error == null;
    } catch (e) {
      return false;
    }
  }
}
