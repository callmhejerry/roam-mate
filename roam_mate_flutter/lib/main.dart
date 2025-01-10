import 'package:flutter/material.dart';
import 'package:roam_mate_flutter/src/locator.dart';
import 'package:roam_mate_flutter/src/roam_mate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUp();
  runApp(const RoamMate());
}
