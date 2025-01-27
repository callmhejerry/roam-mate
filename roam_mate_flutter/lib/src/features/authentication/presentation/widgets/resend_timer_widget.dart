import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

class ResendTimerWidget extends StatefulWidget {
  const ResendTimerWidget({super.key, required this.resend});

  final Future<dynamic> Function() resend;

  @override
  State<ResendTimerWidget> createState() => _ResendTimerWidgetState();
}

class _ResendTimerWidgetState extends State<ResendTimerWidget> {
  int resendCounter = 60;

  late Timer resendTimer;
  bool isActive = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initializeTimer();
  }

  void initializeTimer() {
    resendTimer = Timer.periodic(
      Duration(seconds: 1),
      (tick) {
        resendCounter--;
        if (mounted) {
          setState(() {
            if (resendCounter == 0) {
              isActive = true;
              resendTimer.cancel();
            }
          });
        }
      },
    );
  }

  @override
  void dispose() {
    resendTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Didn't receive code?"),
        Gap(10.w),
        if (isActive)
          if (isLoading)
            SpinKitFadingCircle(
              color: AppColors.primaryColor,
              size: 20,
            )
          else
            TextButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                widget.resend().then((value) {
                  setState(() {
                    isLoading = false;
                    isActive = false;
                    resendCounter = 60;
                    initializeTimer();
                  });
                }).catchError((e) {
                  setState(() {
                    isLoading = false;
                  });
                });
              },
              child: Text(
                "Resend",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            )
        else
          Text("$resendCounter seconds")
      ],
    );
  }
}
