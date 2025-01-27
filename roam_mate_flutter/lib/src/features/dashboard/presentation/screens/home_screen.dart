import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/property_listing_screen.dart';
import 'package:roam_mate_flutter/src/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const name = "home-screen";
  static const path = "/";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    PropertyListingScreen(),
    PropertyListingScreen(),
    PropertyListingScreen(),
    PropertyListingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
            icon: Icon(Icons.add_circle),
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
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: screens[currentIndex],
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
        top: 14.h,
        bottom: MediaQuery.paddingOf(context).bottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < widget.items.length; i++)
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconTheme(
                    data: IconThemeData(
                      applyTextScaling: true,
                      color: i == selectedIndex || widget.items[i].label == null
                          ? widget.selectedItemColor
                          : Colors.grey,
                      size: widget.items[i].label != null ? 24.sp : 45.sp,
                    ),
                    child: widget.items[i].icon,
                  ),
                  if (widget.items[i].label != null)
                    Text(
                      widget.items[i].label!,
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
