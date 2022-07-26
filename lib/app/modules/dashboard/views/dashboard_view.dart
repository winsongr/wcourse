import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wcourse/app/modules/admin/views/admin_view.dart';
import 'package:wcourse/app/modules/home/views/home_view.dart';
import 'package:wcourse/app/modules/profile/views/profile_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Obx(
          () => Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  HomeView(),
                  controller.admin.value ? const AdminView() : const ProfileView(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              showSelectedLabels: false,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
                ),
                controller.admin.value
                    ? const BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.sportscourt),
                        label: 'Admin',
                      )
                    : const BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.sportscourt),
                        label: 'Profile',
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
