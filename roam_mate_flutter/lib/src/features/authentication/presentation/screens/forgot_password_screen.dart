import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

import '../blocs/forgot_password_bloc/forgot_password_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const name = "forgot-password";
  static const path = "/auth/forgot-password";

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 20.spMin,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(8.h),
            Text(
              "Enter the email associated with your account and we'll send an OTP to reset your password",
            ),
            Gap(20.h),
            TextFormField(
              controller: emailController,
              onTapOutside: (_) {
                if (FocusManager.instance.primaryFocus?.hasFocus == true) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(Icons.email),
                hintText: "Email",
                focusColor: AppColors.primaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
              ),
            ),
            Gap(50.h),
            ValueListenableBuilder(
              valueListenable: emailController,
              builder: (context, value, _) {
                return ElevatedButton(
                  onPressed: value.text.isNotEmpty
                      ? () {
                          context
                              .read<ForgotPasswordBloc>()
                              .initiatePasswordReset(
                                email: emailController.text,
                              );
                        }
                      : null,
                  child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                      if (state.initiatePasswordResetResult.isLoading) {
                        return SpinKitFadingCircle(
                          color: AppColors.white,
                          size: 20.r,
                        );
                      }
                      return Text(
                        "Continue",
                        style: TextStyle(
                          color: AppColors.white,
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
