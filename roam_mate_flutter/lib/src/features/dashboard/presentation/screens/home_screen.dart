import 'package:flutter/material.dart';
import 'package:roam_mate_flutter/src/api/api_client.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';

import '../../../../locator.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  static const path = "/";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              final user = getIt.get<IAuthRepository>().getSignedInUser;
              if (user != null) {
                getIt.get<IAuthRepository>().logout(
                      userId: user.id,
                    );
              }
            },
            child: Text("log out")),
      ),
    );
  }
}
