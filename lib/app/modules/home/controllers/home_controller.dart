import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wcourse/app/routes/app_pages.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeController extends GetxController {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.onInit();
    const url = '';

    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: YoutubePlayerFlags(mute: false, loop: false, autoPlay: true,hideControls: false));
  }
}
//url = '';
//controller.load(Youtube.converturltoid(url)!);
//contoler.value.isplaying{ccontikker.pause}plau