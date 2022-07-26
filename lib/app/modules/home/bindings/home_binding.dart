import 'package:get/get.dart';
import 'package:wcourse/app/modules/signin/controllers/signin_controller.dart';
import 'package:wcourse/app/modules/splash/controllers/splash_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
