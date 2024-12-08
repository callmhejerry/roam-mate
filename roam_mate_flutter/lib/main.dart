import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:flutter/material.dart';
import 'package:roam_mate_flutter/src/roam_mate.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const RoamMate());
}
