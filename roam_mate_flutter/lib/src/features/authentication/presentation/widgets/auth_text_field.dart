import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../theme/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String? hintText;
  final bool obscureText;

  const AuthTextField({
    super.key,
    this.controller,
    required this.title,
    this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.spMin,
          ),
        ),
        Gap(5.h),
        TextField(
          obscureText: obscureText,
          controller: controller,
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.spMin,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 17.h,
            ),
            isDense: true,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            fillColor: Color(0xff333333).withOpacity(.1),
          ),
        ),
      ],
    );
  }
}
