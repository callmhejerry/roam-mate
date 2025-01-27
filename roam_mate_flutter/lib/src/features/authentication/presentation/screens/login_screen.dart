import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/forgot_password_screen.dart';

import '../../../../theme/app_colors.dart';
import '../blocs/login_bloc/login_state.dart';
import '../widgets/auth_text_field.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static const name = "login";
  static const path = "/auth/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  bool isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                fontSize: 24.sp,
                color: AppColors.textColor,
              ),
            ),
            Gap(8.h),
            Text(
              "Sign in to continue",
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            Gap(48.h),
            AuthTextField(
              title: "Email Address",
              controller: emailController,
            ),
            Gap(16.h),
            AuthTextField(
              title: "Password",
              controller: passwordController,
              obscureText: isPasswordHidden,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
                icon: isPasswordHidden
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
            ),
            Gap(16.h),
            InkWell(
              onTap: () {
                context.pushNamed(ForgotPasswordScreen.name);
              },
              child: Text(
                "Forgot password?",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
            Gap(50.h),
            ElevatedButton(
              onPressed: () {
                context.read<LoginBloc>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state.loginResult.isLoading) {
                    return SpinKitFadingCircle(
                      color: AppColors.white,
                      size: 25,
                    );
                  }
                  return Text(
                    "Sign in",
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  );
                },
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
