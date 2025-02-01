import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PropertyDetailsScreen extends StatefulWidget {
  static const name = "property-details";
  static const path = "property-details";

  const PropertyDetailsScreen({super.key});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  late final PageController _pageController;
  int totalImages = 4;
  int currentImage = 0;
  final ValueNotifier _pageNotifier = ValueNotifier<int>(1);

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
    _pageController = PageController(
      initialPage: currentImage,
    );
    _pageController.addListener(() {
      _pageNotifier.value = _pageController.page!.toInt() + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 400.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35.r),
                            bottomRight: Radius.circular(35.r),
                          ),
                          child: PageView.builder(
                            itemCount: 4,
                            controller: _pageController,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/apartment-bg.jpg"),
                                    fit: BoxFit.cover,
                                    opacity: .5,
                                  ),
                                ),
                              );
                            },
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
                      ),
                      Positioned(
                        bottom: 25.h,
                        right: 21.w,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.textColor,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: ValueListenableBuilder(
                            valueListenable: _pageNotifier,
                            builder: (context, value, _) {
                              return Text(
                                " $value  /  $totalImages",
                                style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontSize: 12.sp,
                                ),
                              );
                            },
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
                          "Beautiful apartment in lagos",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        Gap(8.h),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            Gap(8.w),
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                            Gap(4.w),
                            Text(
                              "(116 reviews)",
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 24.h,
                          color: AppColors.lightGrey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Entire home",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Hosted by isabelle",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/avatar.jpg"),
                            ),
                          ],
                        ),
                        Divider(
                          height: 24.h,
                          color: AppColors.lightGrey,
                        ),
                        Text(
                          "Amenities",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(4.h),
                        Wrap(
                          runSpacing: 6.h,
                          spacing: 8.w,
                          children: List.generate(amenities.length, (index) {
                            return AmenititesChip(
                              amentity: amenities[index],
                            );
                          }),
                        ),
                        Divider(
                          height: 24.h,
                          color: AppColors.lightGrey,
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.location,
                              size: 20.r,
                            ),
                            Gap(10.w),
                            Text(
                              "Self check-in",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Gap(2.h),
                        Text(
                          "Check yourself in with the lockbox",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textColor,
                          ),
                        ),
                        Gap(16.h),
                        Row(
                          children: [
                            Icon(
                              Iconsax.key,
                              size: 20.r,
                            ),
                            Gap(10.w),
                            Text(
                              "Great check-in experience",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Gap(2.h),
                        Text(
                          "100% of recent gurstgave the check-in process a 5-star rating",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textColor,
                          ),
                        ),
                        Gap(20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 21.w),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.textColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "12-21 Oct • 3 nights:",
                      style: TextStyle(
                        color: AppColors.lightGrey.withValues(alpha: .9),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "\$500",
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          TextSpan(
                            text: "/night",
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    "Check in",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(MediaQuery.paddingOf(context).bottom)
        ],
      ),
    );
  }
}

class AmenititesChip extends StatelessWidget {
  final String amentity;

  const AmenititesChip({
    super.key,
    required this.amentity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        amentity,
        style: TextStyle(
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
