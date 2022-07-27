import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  final HomeController controller = HomeController();
  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WCOURSE',
          style: tstyle.titleMedium!.copyWith(color: Colors.white),
          textScaleFactor: Get.textScaleFactor,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('course').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  "No Courses Found",
                  style: tstyle.titleLarge!.copyWith(color: Colors.grey),
                  textScaleFactor: Get.textScaleFactor,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return courseCard(
                    course: snapshot.data!.docs[index]['course'],
                    desc: snapshot.data!.docs[index]['desc'],
                    cate: snapshot.data!.docs[index]['cate'],
                    url: snapshot.data!.docs[index]['url'],
                    cid: snapshot.data!.docs[index]['cid'],
                    tstyle: tstyle);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget courseCard(
      {required String course,
      required String desc,
      required String cate,
      required String url,
      required String cid,
      required TextTheme tstyle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Course Name",
                          textScaleFactor: Get.textScaleFactor,
                          style: tstyle.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text(course.toUpperCase(),
                          textScaleFactor: Get.textScaleFactor,
                          style: tstyle.titleMedium!),
                    ],
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Description",
                          textScaleFactor: Get.textScaleFactor,
                          style: tstyle.titleMedium!,
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(desc,
                              textScaleFactor: Get.textScaleFactor,
                              style: tstyle.bodyMedium!),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Category",
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.titleMedium!),
                        Text(cate,
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.bodyMedium!)
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Url",
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.titleMedium!),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            controller.openLink(url);
                          },
                          child: Text('Open link',
                              textScaleFactor: Get.textScaleFactor,
                              style: tstyle.bodyMedium!
                                  .copyWith(color: Colors.white)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
