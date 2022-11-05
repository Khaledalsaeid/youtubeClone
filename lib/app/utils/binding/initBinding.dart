import 'package:get/get.dart';
import 'package:youtubeclone/app/controler/appcontroler.dart';
import 'package:youtubeclone/app/repo/youtube_repo.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(YoutubeRepository(),permanent: true);
    Get.put(AppController());
  }

}