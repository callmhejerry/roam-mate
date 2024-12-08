import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ApiClient {
  static final ipAddress = "localhost";
  late Client client;
  late SessionManager sessionManager;

  Future<ApiClient> initialize() async {
    client = Client(
      "http://$ipAddress:8080/",
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();
    sessionManager = SessionManager(
      caller: client.modules.auth,
    );
    await sessionManager.initialize();
    return this;
  }
}
