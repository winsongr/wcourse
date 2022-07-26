import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, this.message}) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;

    return AlertDialog(
      key: key,
      content: Text(
        message!,
        textScaleFactor: Get.textScaleFactor,
        style: tstyle.titleLarge,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          child: Center(
            child: Text(
              "OK",
              style: tstyle.button,
              textScaleFactor: Get.textScaleFactor,
            ),
          ),
        )
      ],
    );
  }
}
