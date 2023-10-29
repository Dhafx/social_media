import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import '../controllers/bottom_navbar_controller.dart';
import '../constants/pages.dart';
import 'bottom_navbar_item.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  BottomNavbarController bottomNavbarController =
      Get.put(BottomNavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return pages[bottomNavbarController.selectedTab.value];
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        color: const Color(0xFFFFFFFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Obx(() {
              return BottomNavbarItem(
                key: const ObjectKey(0),
                onTap: () {
                  return bottomNavbarController.setSelectedTab(0);
                },
                icon: CupertinoIcons.home,
                color: bottomNavbarController.selectedTab.value == 0
                    ? 0xFF000000
                    : 0xFFACACAC,
              );
            }),
            Obx(() {
              return BottomNavbarItem(
                key: const ObjectKey(1),
                onTap: () {
                  return bottomNavbarController.setSelectedTab(1);
                },
                icon: CupertinoIcons.search,
                color: bottomNavbarController.selectedTab.value == 1
                    ? 0xFF000000
                    : 0xFFACACAC,
              );
            }),
            Obx(() {
              return BottomNavbarItem(
                key: const ObjectKey(2),
                onTap: () {
                  return bottomNavbarController.setSelectedTab(2);
                },
                icon: CupertinoIcons.add_circled,
                color: bottomNavbarController.selectedTab.value == 2
                    ? 0xFF000000
                    : 0xFFACACAC,
              );
            }),
            Obx(() {
              return BottomNavbarItem(
                key: const ObjectKey(3),
                onTap: () {
                  return bottomNavbarController.setSelectedTab(3);
                },
                icon: CupertinoIcons.checkmark_alt_circle,
                color: bottomNavbarController.selectedTab.value == 3
                    ? 0xFF000000
                    : 0xFFACACAC,
              );
            }),
            Obx(() {
              return BottomNavbarItem(
                key: const ObjectKey(4),
                onTap: () {
                  return bottomNavbarController.setSelectedTab(4);
                },
                icon: CupertinoIcons.heart,
                color: bottomNavbarController.selectedTab.value == 4
                    ? 0xFF000000
                    : 0xFFACACAC,
              );
            }),
            Obx(() {
              return BottomNavbarItem(
                key: const ObjectKey(5),
                onTap: () {
                  return bottomNavbarController.setSelectedTab(5);
                },
                icon: CupertinoIcons.profile_circled,
                color: bottomNavbarController.selectedTab.value == 5
                    ? 0xFF000000
                    : 0xFFACACAC,
              );
            }),
          ],
        ),
      ),
    );
  }
}
