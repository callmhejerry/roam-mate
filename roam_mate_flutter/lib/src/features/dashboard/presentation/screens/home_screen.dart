import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/property_listing_screen.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/search_screen.dart';
import 'package:roam_mate_flutter/src/features/room/presentation/screen/add_room_screen.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        initialIndex: 0,
        selectedItemColor: AppColors.primaryColor,
        backgroundColor: AppColors.white,
        items: [
          CustomNavItem(
            icon: Icon(Iconsax.home),
            label: "Home",
          ),
          CustomNavItem(
            icon: Icon(Iconsax.map4),
            label: "Search",
          ),
          CustomNavItem(
            icon: Icon(Iconsax.message),
            label: "Chats",
          ),
          CustomNavItem(
            icon: Icon(Iconsax.user),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.goNamed(PropertyListingScreen.name);
            case 1:
              context.goNamed(SearchScreen.name);
            default:
              context.goNamed(PropertyListingScreen.name);
          }
        },
      ),
      body: widget.child,
    );
  }
}

class CustomNavItem {
  final Widget icon;
  final String? label;
  const CustomNavItem({
    required this.icon,
    this.label,
  });
}

class CustomNavBar extends StatefulWidget {
  final void Function(int index) onTap;
  final List<CustomNavItem> items;
  final Color backgroundColor;
  final Color selectedItemColor;
  final int? initialIndex;
  const CustomNavBar({
    super.key,
    required this.onTap,
    required this.items,
    required this.selectedItemColor,
    required this.backgroundColor,
    required this.initialIndex,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 12.h,
        bottom: MediaQuery.paddingOf(context).bottom > 0
            ? MediaQuery.paddingOf(context).bottom
            : 12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < widget.items.length + 1; i++)
            InkWell(
              onTap: () {
                if (i == 2) return;
                setState(() {
                  selectedIndex = i;
                });
                if (i > 2) {
                  widget.onTap(i - 1);
                  return;
                }
                widget.onTap(selectedIndex);
              },
              child: i == 2
                  ? InkWell(
                      onTap: () {
                        context.pushNamed(AddRoomScreen.name);
                      },
                      child: Container(
                        width: 55.r,
                        height: 55.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 40.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconTheme(
                          data: IconThemeData(
                            applyTextScaling: true,
                            color: i == selectedIndex ||
                                    widget.items[i > 2 ? i - 1 : i].label ==
                                        null
                                ? widget.selectedItemColor
                                : Colors.grey,
                            size: widget.items[i > 2 ? i - 1 : i].label != null
                                ? 24.sp
                                : 45.sp,
                          ),
                          child: widget.items[i > 2 ? i - 1 : i].icon,
                        ),
                        if (widget.items[i > 2 ? i - 1 : i].label != null)
                          Text(
                            widget.items[i > 2 ? i - 1 : i].label!,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: i == selectedIndex
                                  ? widget.selectedItemColor
                                  : Colors.grey,
                            ),
                          ),
                      ],
                    ),
            ),
        ],
      ),
    );
  }
}
