import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wcourse/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.SPLASH);
  }

  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentSnapshot? doc;
  String? userEmail;
  String? userName;
  String? userAvatarurl;
  String? userUid;
  String? role;
  RxBool isLoading = false.obs;
  RxBool isImgLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    await startTimer();
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
}
