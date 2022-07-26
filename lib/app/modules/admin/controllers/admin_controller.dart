import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wcourse/app/modules/widgets/err_dialog.dart';
import 'package:wcourse/app/modules/widgets/loading_dialog.dart';
import 'package:wcourse/app/routes/app_pages.dart';

class AdminController extends GetxController {
  TextEditingController courseController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController cateController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.SPLASH);
  }

  openaddProject() {
    Get.toNamed(Routes.ADDCOURSE);
  }

  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentSnapshot? doc;
  String? userEmail;
  String? userName;
  String? userAvatarurl;
  String? userUid;
  String? role;
  int? userNo;
  int? noCourses;
  RxBool isLoading = false.obs;
  RxBool isImgLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    await startTimer();
    await getData();
  }

  Future getData() async {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snap) => userNo = snap.size);
    FirebaseFirestore.instance
        .collection('course')
        .get()
        .then((snap) => noCourses = snap.size);
  }

  Future getUserData() async {
    isLoading(true);
    doc = await users.doc(user?.uid).get();
    userName = doc?['name'];
    userEmail = doc?['email'];
    userAvatarurl = doc?['image'];
    role = doc?['role'];
    userUid = doc?['uid'];
    isLoading(false);
  }

  Future startTimer() async {
    Timer(const Duration(seconds: 2), () {
      isImgLoading(false);
    });
  }

  String uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
  formValidate() async {
    if (courseController.text.isNotEmpty &&
        desController.text.isNotEmpty &&
        cateController.text.isNotEmpty &&
        urlController.text.isNotEmpty) {
      addCourseToFirebase(user!);
      Get.dialog(const LoadingDialog(message: "Adding Course"),
          barrierDismissible: false);
    } else {
      Get.dialog(const ErrorDialog(
        message: "Fill required fields",
      ));
    }
  }

  Future addCourseToFirebase(User user) async {
    final ref = FirebaseFirestore.instance.collection('course');
    await ref.doc(uniqueIdName).set({
      "cid": uniqueIdName,
      "course": courseController.text.toString(),
      "desc": desController.text.toString(),
      "cate": cateController.text.toString(),
      "url": urlController.text.toString(),
    });

    clearForm();

    Get.dialog(AlertDialog(
      content: const Text(
        "Success",
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(Routes.DASHBOARD);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: const Center(
            child: Text("OK"),
          ),
        )
      ],
    ));
  }

  clearForm() {
    courseController.text = '';
    desController.text = '';
    cateController.text = '';
    urlController.text = '';
    uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
