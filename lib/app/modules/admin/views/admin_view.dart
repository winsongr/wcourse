import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;

    return
         Obx(() =>
        Scaffold(
            appBar: AppBar(
              title: const Text('Admin Dashboard'),
              actions: [
                IconButton(
                    onPressed: () {
                      controller.logout();
                    },
                    tooltip: 'Logout',
                    icon: const Icon(Icons.logout))
              ],
            ),
            body: controller.isLoading.value
                ? const CircularProgressIndicator(
                    color: Colors.red,
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.3,
                          child: Center(
                            child: controller.isImgLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.red,
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 80,
                                    backgroundImage: NetworkImage(
                                      controller.userAvatarurl!,
                                    )),
                          ),
                        ),
                        listTile(tstyle,
                            txt: "Name",
                            trailTxt: controller.userName!.toUpperCase()),
                        Divider(),
                        listTile(
                          tstyle,
                          txt: "Email",
                          trailTxt: controller.userEmail!,
                        ),
                        Divider(),
                        listTile(
                          tstyle,
                          txt: "Role",
                          trailTxt: controller.role!.capitalizeFirst,
                        ),
                        Divider(),
                        listTile(
                          tstyle,
                          txt: "No of Users Registered in App",
                          trailTxt: controller.userNo.toString(),
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        )
                      ],
                      ),
                    )));
  }

  ListTile listTile(TextTheme tstyle,
      {required String txt, required trailTxt}) {
    return ListTile(
      title: Text(
        txt,
        style: tstyle.titleMedium!,
        textScaleFactor: Get.textScaleFactor,
      ),
      trailing: Text(trailTxt),
    );
  }
}
