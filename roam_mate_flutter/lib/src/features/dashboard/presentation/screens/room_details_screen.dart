import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../theme/app_colors.dart';
import 'property_details_screen.dart';

class RoomDetailsScreen extends StatefulWidget {
  static const name = "room-detail";
  static const path = "room-detial";
  const RoomDetailsScreen({super.key});

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  late final PageController _pageController;
  final amenities = [
    "WI-FI",
    '65" HDTV',
    "Indoor fireplace",
    "Hair dryer",
    "Washing machine",
    "Dryer",
    "Refrigerator",
    "Dishwasher",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300.h,
                  child: PageView.builder(
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/apartment-bg.jpg"),
                            opacity: .75,
                            fit: BoxFit.cover,
                          ),
                          color: AppColors.black,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  child: SafeArea(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  right: 0,
                  left: 0,
                  child: Align(
                    child: SmoothPageIndicator(
                      controller: _pageController, // PageController
                      count: 4,
                      effect: WormEffect(
                        activeDotColor: AppColors.white,
                        dotWidth: 8,
                        dotHeight: 8,
                        spacing: 4.w,
                      ), // your preferred effect
                      onDotClicked: (index) {},
                    ),
                  ),
                )
              ],
            ),
            Gap(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Twin Garden Hostel",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(8.h),
                  ReadMoreText(
                    'This room has some bed frame , all you need to do is to move in with your clothes, i have everything for cooking. Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                    trimMode: TrimMode.Line,
                    trimLines: 3,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(16.h),
                  Wrap(
                    spacing: 20.w,
                    runSpacing: 8.h,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Iconsax.location, size: 16.sp),
                          Gap(4.w),
                          Text("Izunna , ifite , awka"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Iconsax.house_25, size: 16.sp),
                          Gap(4.w),
                          Text("Self contained"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Iconsax.money, size: 16.sp),
                          Gap(4.w),
                          Text("₦300,000/year"),
                        ],
                      ),
                    ],
                  ),
                  Gap(20.h),
                  Text(
                    "Room Owner",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 32.r,
                        backgroundImage: AssetImage("assets/images/avatar.jpg"),
                      ),
                      Gap(16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chinedu Jeremiah",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Studies Computer Science",
                            style: TextStyle(
                              color: Color(0xff888888),
                              fontSize: 14.sp,
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.male,
                                    color: Color(0xff888888),
                                    size: 18.sp,
                                  ),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      color: Color(0xff888888),
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(10.w),
                              Text("•"),
                              Gap(10.w),
                              Text(
                                "Since 2019",
                                style: TextStyle(
                                  color: Color(0xff888888),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Gap(20.h),
                  Text(
                    "Amenities",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(10.h),
                  Wrap(
                    runSpacing: 6.h,
                    spacing: 8.w,
                    children: List.generate(amenities.length, (index) {
                      return AmenititesChip(
                        amentity: amenities[index],
                      );
                    }),
                  ),
                  Gap(20.h),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(25.h),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Send a message request",
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
