import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcourse/app/modules/dashboard/views/dashboard_view.dart';
import 'package:wcourse/app/modules/home/views/home_view.dart';
import 'package:wcourse/app/modules/signin/views/signin_view.dart';

class SplashController extends GetxController {
  Future<Widget> usersignedIn() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return DashboardView();
    } else {
      return SigninView();
    }
  }
}
      // DocumentSnapshot userData = await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(user.uid)
      //     .get();
      // UserModel userModel = UserModel.fromJson(userData);