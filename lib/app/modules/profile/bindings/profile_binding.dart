import 'package:get/get.dart';
import 'package:wcourse/app/modules/signin/controllers/signin_controller.dart';
import 'package:wcourse/app/modules/splash/controllers/splash_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<SigninController>(
      () => SigninController(),
    );
  }
}
