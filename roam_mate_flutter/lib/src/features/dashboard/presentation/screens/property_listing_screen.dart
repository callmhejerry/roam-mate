import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

import '../widgets/property_card.dart';

class PropertyListingScreen extends StatefulWidget {
  static const name = "property-listing";
  static const path = "property-listing";
  const PropertyListingScreen({super.key});

  @override
  State<PropertyListingScreen> createState() => _PropertyListingScreenState();
}

class _PropertyListingScreenState extends State<PropertyListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 260.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/apartment-bg.jpg"),
                      fit: BoxFit.cover,
                      opacity: .35,
                    ),
                    color: AppColors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.r),
                      bottomRight: Radius.circular(50.r),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.paddingOf(context).top + 16.h,
                    left: 21.w,
                    right: 21.w,
                    bottom: 30.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Iconsax.send_21,
                                size: 16.sp,
                                color: AppColors.white,
                              ),
                              Gap(10.w),
                              Text(
                                "Awka",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Gap(20.h),
                      Text(
                        "Hey, Jerry!, Tell us where you\nwant to stay",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(20.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 10.h,
                            ),
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 74, 74, 74)
                                  .withValues(alpha: .5),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: AppColors.white,
                                ),
                                Gap(8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Search apartment",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      "Price • Location • Room type",
                                      style: TextStyle(
                                        color: AppColors.lightGrey,
                                        fontSize: 12.sp,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(16.h),
                  Text(
                    "Verified Accommodations",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Gap(10.h),
                ],
              ),
            ),
            SizedBox(
              height: 250.h,
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (context, index) => Gap(16.w),
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PropertyCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
