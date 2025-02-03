import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

class AddRoomScreen extends StatelessWidget {
  static const name = "add-room";
  static const path = "/add-room";
  const AddRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Step 1: Location"),
        backgroundColor: AppColors.primaryColor,
        iconTheme: IconThemeData(color: AppColors.white),
        titleTextStyle: TextStyle(
          fontSize: 16.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Post an ad to find your next roommate!",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
