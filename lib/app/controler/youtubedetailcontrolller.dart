import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubeclone/app/controler/videoController.dart';

import '../model/default.dart';
import '../model/statistics.dart';
import '../model/youtuber.dart';

class YoutubeDetailController extends GetxController{
  Rx<Video> video= Video().obs;

  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;


  YoutubePlayerController playerController;

  @override
  void onInit() {
    VideoController videoController = Get.find(tag: Get.parameters['videoId']);
    video(videoController.video);
    statistics(videoController.statistics.value);
    youtuber(videoController.youtuber.value);
    _event();
    super.onInit();
  }

  void _event(){
    playerController = YoutubePlayerController(initialVideoId: video.value.id.playlistId,
    flags: const YoutubePlayerFlags(
      hideControls: true,
      hideThumbnail: false,

    )
    );
  }
}