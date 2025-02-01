import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../theme/app_colors.dart';

class RoomCard extends StatelessWidget {
  final void Function()? onTap;
  const RoomCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: SizedBox(
          width: 175.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/apartment-bg.jpg",
                height: 170.h,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: ColoredBox(
                  color: AppColors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 10.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Beautiful Large Apartment",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(1.h),
                        Text(
                          "3 persons, 1 bathroom, 1 kitchen",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Gap(1.h),
                        Text(
                          "₦ 300,000/year",
                          style: TextStyle(
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
