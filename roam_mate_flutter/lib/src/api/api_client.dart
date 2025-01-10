import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:roam_mate_flutter/src/features/authentication/data/data_source/session_manager.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static final ipAddress = "localhost";
  late Client client;
  late SessionManager sessionManager;

  Future<ApiClient> initialize() async {
    client = Client(
      "http://$ipAddress:8080/",
      authenticationKeyManager: MyKeyManager(),
      connectionTimeout: Duration(seconds: 20),
    )..connectivityMonitor = FlutterConnectivityMonitor();
    sessionManager = SessionManager(client: client);
    await sessionManager.initialize();
    return this;
  }
}

class MyKeyManager extends AuthenticationKeyManager {
  final String _storageKey = "auth-token-key";
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  @override
  Future<String?> get() async {
    return await asyncPrefs.getString(_storageKey);
  }

  @override
  Future<void> put(String key) async {
    await asyncPrefs.setString(_storageKey, key);
  }

  @override
  Future<void> remove() async {
    await asyncPrefs.remove(_storageKey);
  }
}
