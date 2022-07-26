import 'package:get/get.dart';
import 'package:wcourse/app/modules/splash/controllers/splash_controller.dart';

import '../controllers/admin_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(
      () => AdminController(),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
