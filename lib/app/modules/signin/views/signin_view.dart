import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.2,
              ),
              Container(
                width: Get.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/book.png'),
                  ),
                ),
              ),
              Text(
                style: tstyle.headlineSmall!.copyWith(color: Colors.purple),
                textScaleFactor: Get.textScaleFactor,
                "WCourse",
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              SizedBox(
                  width: Get.width * 0.6,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.signInFunc();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: Row(children: [
                        Image.asset(
                          "assets/google.png",
                          width: 40,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Sign In With Google',
                          style: tstyle.bodyMedium!
                              .copyWith(color: Colors.black),
                          textScaleFactor: Get.textScaleFactor,
                        )
                      ]))),
            ],
          ),
        ),
      ),
    );
  }
}
