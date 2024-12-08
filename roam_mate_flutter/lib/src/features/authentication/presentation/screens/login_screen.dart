import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:roam_mate_flutter/src/app_router.dart';

import '../../../../theme/app_colors.dart';
import '../widgets/auth_text_field.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  static const name = "login";
  static const path = "/auth/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.scaffoldBgColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(child: SvgPicture.asset("assets/icons/logo.svg")),
            Gap(48.h),
            Text(
              "Welcome back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.spMin,
                color: AppColors.textColor,
              ),
            ),
            Gap(8.h),
            Text(
              "Sign in to continue",
              style: TextStyle(
                fontSize: 14.spMin,
              ),
            ),
            Gap(48.h),
            AuthTextField(
              title: "Email Address",
            ),
            Gap(16.h),
            AuthTextField(title: "Password"),
            Gap(50.h),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sign in",
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
            Gap(40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have any account?"),
                TextButton(
                  onPressed: () {
                    context.goNamed(SignUpScreen.name);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text("Sign up"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
