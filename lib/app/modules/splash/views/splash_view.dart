import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;
    return FutureBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        }
        return SafeArea(
          child: Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.5,
                  child: Image.asset(
                    'assets/book.png',
                  ),
                ),
                Text(
                  "WCourse",
                  style: tstyle.headlineSmall!,
                  textScaleFactor: Get.textScaleFactor,
                ),
              ],
            )),
          ),
        );
      },
      future: controller.usersignedIn(),
    );
  }
}
