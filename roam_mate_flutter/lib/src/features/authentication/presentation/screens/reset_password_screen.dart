import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinput/pinput.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/widgets/resend_timer_widget.dart';
import 'package:roam_mate_flutter/src/locator.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

import '../blocs/forgot_password_bloc/forgot_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const name = "reset-passsword";
  static const path = "/auth/reset-password";

  final String email;
  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String pin = "";
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  bool isNewPasswordHidden = true;

  ValueNotifier<bool> resetPasswordButtonNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(text: "Please enter the OTP we sent to "),
                TextSpan(
                  text: widget.email,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
              textAlign: TextAlign.center,
            ),
            Gap(30.h),
            Pinput(
              hapticFeedbackType: HapticFeedbackType.mediumImpact,
              keyboardType: TextInputType.number,
              autofocus: true,
              length: 6,
              focusedPinTheme: PinTheme(
                height: 55,
                width: 50,
                textStyle: TextStyle(
                  fontSize: 18.spMin,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              defaultPinTheme: PinTheme(
                height: 55,
                width: 50,
                textStyle: TextStyle(
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onCompleted: (pin) {
                resetPasswordButtonNotifier.value = pin.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty &&
                    newPasswordController.text.isNotEmpty;
                this.pin = pin;
              },
            ),
            Gap(16.h),
            ResendTimerWidget(
              resend: () async {
                await getIt
                    .get<IAuthRepository>()
                    .resendOtp(email: widget.email);
              },
            ),
            Gap(40.h),
            Text(
              "Your new password must be different from your previous used passwords",
            ),
            Gap(16.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
              ),
            ),
            Gap(2.h),
            TextFormField(
              onTapOutside: (_) {
                if (FocusManager.instance.primaryFocus?.hasFocus == true) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              onChanged: (value) {
                resetPasswordButtonNotifier.value = pin.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty &&
                    newPasswordController.text.isNotEmpty;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field cannot be empty";
                }
                return null;
              },
              controller: newPasswordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isNewPasswordHidden,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  child: isNewPasswordHidden
                      ? Icon(Icons.visibility_off, size: 24)
                      : Icon(Icons.visibility, size: 24),
                  onTap: () {
                    setState(() {
                      isNewPasswordHidden = !isNewPasswordHidden;
                    });
                  },
                ),
              ),
            ),
            Gap(20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Confirm Password",
              ),
            ),
            Gap(2.h),
            TextFormField(
              onChanged: (value) {
                resetPasswordButtonNotifier.value = pin.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty &&
                    newPasswordController.text.isNotEmpty;
              },
              onTapOutside: (_) {
                if (FocusManager.instance.primaryFocus?.hasFocus == true) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field cannot be empty";
                }
                if (value != newPasswordController.text) {
                  return "Password doesn't match";
                }
                return null;
              },
              controller: confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isNewPasswordHidden,
              decoration: InputDecoration(),
            ),
            Gap(30.h),
            ValueListenableBuilder(
              valueListenable: resetPasswordButtonNotifier,
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: value
                      ? () {
                          context.read<ForgotPasswordBloc>().resetPassword(
                                email: widget.email,
                                newPassword: newPasswordController.text,
                                otp: pin,
                              );
                        }
                      : null,
                  child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                      if (state.resetPasswordResult.isLoading) {
                        return SpinKitFadingCircle(
                          color: AppColors.white,
                          size: 21,
                        );
                      }

                      return Text(
                        "Reset Password",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
