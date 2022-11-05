import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtubeclone/app/model/default.dart';

import '../repo/youtube_repo.dart';

class HomeController extends GetxController{
  static HomeController get to => Get.find();
  ScrollController scrollController =ScrollController();
  Rx<YoutubeVideoResult> ytresult = YoutubeVideoResult(items: []).obs;
@override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  void _videoLoad()async{
    YoutubeVideoResult youtubeVideoResult =await YoutubeRepository.to.loadvideo(ytresult.value.nextPageToken ?? "");
    if(youtubeVideoResult!= null && youtubeVideoResult.items!=null &&youtubeVideoResult.items.length>0){
      ytresult.update((youtube) {youtube.nextPageToken=youtubeVideoResult.nextPageToken;
      youtube.items.addAll(youtubeVideoResult.items);
      });
    }

  }

  void _event (){
    scrollController.addListener(() {
      if(scrollController.position.pixels== scrollController.position.maxScrollExtent && ytresult.value.nextPageToken!=""){
        _videoLoad();
      }
    });
  }
}