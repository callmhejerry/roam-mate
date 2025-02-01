import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/property_details_screen.dart';

import '../../../../theme/app_colors.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(PropertyDetailsScreen.name),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          width: MediaQuery.sizeOf(context).width * .72,
          decoration: BoxDecoration(
            color: AppColors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 150.h,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/apartment-bg.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Holy Family • Amansea",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.spMax,
                          ),
                        ),
                        Gap(2.w),
                        Icon(
                          Icons.verified,
                          size: 16,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    Gap(4.h),
                    Row(
                      children: [
                        Icon(
                          Iconsax.location,
                          size: 14.sp,
                          color: Colors.grey,
                        ),
                        Gap(4.w),
                        Text(
                          "ifite, awka • shared rooms",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Gap(2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("₦250,000/year"),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Iconsax.star1,
                              color: Colors.amber,
                              size: 22.spMax,
                            ),
                            Gap(4.w),
                            Text("4.5"),
                            Gap(4.w),
                            Text("(20)")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
