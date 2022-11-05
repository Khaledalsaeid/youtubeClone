import 'package:get/get.dart';
import 'package:youtubeclone/app/model/default.dart';
import 'package:youtubeclone/app/model/statistics.dart';
import 'package:youtubeclone/app/model/youtuber.dart';
import 'package:youtubeclone/app/repo/youtube_repo.dart';


class VideoController extends GetxController{
  Video video;

  VideoController(this.video);
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit()async {
     Statistics loadStatistics = await YoutubeRepository.to.videoInfo(video.id.playlistId);
     statistics(loadStatistics);
     Youtuber loadYoutuber = await YoutubeRepository.to.channelInfo(video.snippet.channelId);
     youtuber(loadYoutuber);

    super.onInit();
  }

  String get viewCount => "views ${statistics.value.viewCount??'-'}";
  String get youtuberThumbnails {
    if(youtuber.value.snippet.thumbnails==null){
      return "";
    }else{
      return youtuber.value.snippet.thumbnails.medium.url;
    }
  }

}