import 'package:get/get.dart';
import 'package:wcourse/app/modules/admin/controllers/admin_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<AdminController>(
      () => AdminController(),
    );
  }
}
