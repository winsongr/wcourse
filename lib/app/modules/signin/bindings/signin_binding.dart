import 'package:get/get.dart';
import 'package:wcourse/app/modules/home/controllers/home_controller.dart';
import 'package:wcourse/app/modules/splash/controllers/splash_controller.dart';

import '../controllers/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<SigninController>(
      () => SigninController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
