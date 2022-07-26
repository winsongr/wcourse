import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'progress_bar.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key, required this.message}) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;

    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(
            height: 10,
          ),
          Text(
            '$message!, Please Wait....',
            textScaleFactor: Get.textScaleFactor,
            style: tstyle.titleMedium,
          )
        ],
      ),
    );
  }
}
