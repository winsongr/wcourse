import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcourse/app/modules/admin/controllers/admin_controller.dart';
import 'package:wcourse/app/modules/widgets/cust_textfield.dart';

class AddCourse extends GetView<AdminController> {
  AddCourse({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Course',
            style: tstyle.titleLarge!.copyWith(
              color: Colors.white,
            ),
            textScaleFactor: Get.textScaleFactor,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Form(
              key: _formKey,
              child: Column(children: [
                CusTextField(
                  TextInputType: TextInputType.text,
                  hintext: "Course Name",
                  data: Icons.bookmark_add_rounded,
                  controller: controller.courseController,
                  max: 10,
                ),
                CusTextField(
                  TextInputType: TextInputType.text,
                  hintext: "Description",
                  data: Icons.description,
                  controller: controller.desController,
                  max: 15,
                ),
                CusTextField(
                  TextInputType: TextInputType.text,
                  hintext: "Category",
                  data: Icons.category,
                  controller: controller.cateController,
                ),
                CusTextField(
                  TextInputType: TextInputType.text,
                  hintext: "Url",
                  data: Icons.web,
                  controller: controller.urlController,
                ),
              ])),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              controller.formValidate();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            child: Text(
              "Add Course",
              style: tstyle.bodyMedium!.copyWith(color: Colors.white),
              textScaleFactor: Get.textScaleFactor,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ])));
  }
}
