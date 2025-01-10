import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

import '../../../../locator.dart';
import '../blocs/sign_up_bloc/sign_up_state.dart';
import '../widgets/resend_timer_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  static const name = "/auth/email-verification";
  static const path = "/auth/email-verification/:email";

  final String email;

  const EmailVerificationScreen({
    super.key,
    required this.email,
  });

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String? otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Gap(10.h),
            Text(
              "One-Time-Password",
              style: TextStyle(
                fontSize: 18.spMin,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Enter 6 digit OTP that has been sent to\n",
                  ),
                  TextSpan(
                    text: widget.email,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Gap(30.h),
            Pinput(
              length: 6,
              onCompleted: (pin) {
                otp = pin;
              },
              defaultPinTheme: PinTheme(
                height: 60.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              focusedPinTheme: PinTheme(
                height: 60.h,
                width: 50.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
            Gap(16.h),
            ResendTimerWidget(
              resend: () async {
                await getIt
                    .get<IAuthRepository>()
                    .resendOtp(email: widget.email);
              },
            ),
            Gap(60.h),
            ElevatedButton(
              onPressed: () {
                if (otp == null) return;

                context.read<SignUpBloc>().verifyEmail(
                      email: widget.email,
                      otp: otp!,
                    );
              },
              child: BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  if (state.verifyOtp.isLoading) {
                    return SpinKitFadingCircle(
                      color: AppColors.white,
                      size: 25,
                    );
                  }
                  return Text(
                    "Verify Email",
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
