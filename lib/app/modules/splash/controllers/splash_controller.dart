import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcourse/app/modules/dashboard/views/dashboard_view.dart';
import 'package:wcourse/app/modules/signin/views/signin_view.dart';

class SplashController extends GetxController {
  Future<Widget> usersignedIn() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return const DashboardView();
    } else {
      return SigninView();
    }
  }
}
