import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/widgets/auth_text_field.dart';
import 'package:form_validation/form_validation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../theme/app_colors.dart';
import '../blocs/sign_up_bloc/sign_up_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const path = "/auth/sign-up";
  static const name = "sign-up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final SignUpBloc signUpBloc;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    signUpBloc = context.read<SignUpBloc>();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(child: SvgPicture.asset("assets/icons/logo.svg")),
              Gap(48.h),
              Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(4.h),
              Text("Sign up to register"),
              Gap(48.h),
              AuthTextField(
                title: "Username",
                controller: usernameController,
                validator: (value) {
                  final validator = Validator(validators: [
                    RequiredValidator(),
                    MinLengthValidator(length: 3),
                  ]);

                  return validator.validate(
                    label: "Username is required",
                    value: value,
                  );
                },
              ),
              Gap(12.h),
              AuthTextField(
                title: "Email Address",
                controller: emailController,
                validator: (value) {
                  return Validator(validators: [EmailValidator()]).validate(
                    label: "Email is required",
                    value: value,
                  );
                },
              ),
              Gap(12.h),
              AuthTextField(
                title: "Password",
                controller: passwordController,
                obscureText: isPasswordHidden,
                keyboardType: TextInputType.visiblePassword,
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
                validator: (value) {
                  return Validator(validators: [
                    MinLengthValidator(length: 8),
                    RequiredValidator(),
                  ]).validate(
                    label: "Password",
                    value: value,
                  );
                },
              ),
              Gap(50.h),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signUpBloc.signUp(
                      username: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                child: BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    if (state.signUpResult.isLoading) {
                      return SpinKitFadingCircle(
                        color: AppColors.white,
                        size: 25,
                      );
                    }
                    return Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    );
                  },
                ),
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?"),
                  TextButton(
                    onPressed: () {
                      context.pushReplacementNamed(LoginScreen.name);
                    },
                    child: Text("Sign in"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
