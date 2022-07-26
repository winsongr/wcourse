import 'package:get/get.dart';
import 'package:wcourse/app/modules/admin/controllers/admin_controller.dart';
import 'package:wcourse/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:wcourse/app/modules/home/controllers/home_controller.dart';
import 'package:wcourse/app/modules/profile/controllers/profile_controller.dart';
import 'package:wcourse/app/modules/signin/controllers/signin_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<SigninController>(
      () => SigninController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<AdminController>(
      () => AdminController(),
    );
  }
}
