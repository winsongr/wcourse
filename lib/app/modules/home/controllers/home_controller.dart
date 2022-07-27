import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  void openLink(url) async {
    url = url;
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
