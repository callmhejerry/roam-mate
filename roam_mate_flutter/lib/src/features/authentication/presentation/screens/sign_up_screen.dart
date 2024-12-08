import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/widgets/auth_text_field.dart';

import '../../../../theme/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const path = "/auth/sign-up";
  static const name = "sign-up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(child: SvgPicture.asset("assets/icons/logo.svg")),
            Gap(48.h),
            Text(
              "Create an Account",
              style: TextStyle(
                fontSize: 24.spMin,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(4.h),
            Text("Sign up to register"),
            Gap(48.h),
            AuthTextField(title: "Username"),
            Gap(12.h),
            AuthTextField(title: "Email Address"),
            Gap(12.h),
            AuthTextField(title: "Password"),
            Gap(50.h),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text("Sign in"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
