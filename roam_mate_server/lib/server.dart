import 'package:roam_mate_server/src/utils/auth_middle_ware.dart';
import 'package:serverpod/serverpod.dart';

import 'package:roam_mate_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: AuthMiddleWare.verifyToken,
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(
    auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        print("VALIDATION CODE: $validationCode");
        return true;
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        print("VALIDATION CODE: $validationCode");
        return true;
      },
      minPasswordLength: 8,
      validationCodeLength: 6,
      enableUserImages: true,
    ),
  );

  // Start the server.
  await pod.start();
}
