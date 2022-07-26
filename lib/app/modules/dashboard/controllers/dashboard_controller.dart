import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentSnapshot? doc;

  RxBool admin = false.obs;
  String? userUid;
  String? role;

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
  }

  Future getUserData() async {
    doc = await users.doc(user?.uid).get();
    role = doc?['role'];
    userUid = doc?['uid'];
    if (role == 'admin') {
      admin.value = true;
      update();
    } else {
      admin.value = false;
      update();
    }
  }

  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
