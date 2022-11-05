import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtubeclone/app/model/default.dart';

import '../repo/youtube_repo.dart';

class SearchController extends GetxController{
  static SearchController get to => Get.find();
  SharedPreferences _profs;
  String key= "searchKey";
  RxList<String>  history = RxList.empty(growable: true);
  String currentKeyWord;
  ScrollController scrollController =ScrollController();
  Rx<YoutubeVideoResult> ytresult = YoutubeVideoResult(items: []).obs;
  @override
  void onInit()async {

    _event();
    _profs=await SharedPreferences.getInstance();
    List<dynamic> initData = _profs.get(key)?? [];
    history(initData.map<String>((_) => _.toString()).toList( ));
    super.onInit();
  }

  void submitSearch(String searchWord){
    history.addIf(!history.contains(searchWord), searchWord);
    _profs.setStringList(key, history);
    currentKeyWord = searchWord;
    _videoLoad(searchWord);
  }

  void _videoLoad(String searchKeyWord)async{
    YoutubeVideoResult youtubeVideoResult =await YoutubeRepository.to.search(ytresult.value.nextPageToken ?? "",searchKeyWord);
    if(youtubeVideoResult!= null && youtubeVideoResult.items!=null &&youtubeVideoResult.items.length>0){
      ytresult.update((youtube) {youtube.nextPageToken=youtubeVideoResult.nextPageToken;
      youtube.items.addAll(youtubeVideoResult.items);
      });
    }

  }

  void _event (){
    scrollController.addListener(() {
      if(scrollController.position.pixels== scrollController.position.maxScrollExtent && ytresult.value.nextPageToken!=""){
        _videoLoad(currentKeyWord);
      }
    });
  }
}