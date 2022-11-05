import 'package:get/get.dart';
import 'package:youtubeclone/app/model/default.dart';
import 'package:youtubeclone/app/model/statistics.dart';
import 'package:youtubeclone/app/model/youtuber.dart';

class YoutubeRepository extends GetConnect{
  static YoutubeRepository get to=>Get.find();
@override
  void onInit() {
    httpClient.baseUrl="https://youtube.googleapis.com/";

  }
  //allvideo
  Future<YoutubeVideoResult> loadvideo(String nextToken)async{
    String url = "youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&order=date&"
        "pageToken=${nextToken}&type=video&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk";

    final response =await get(url);
    if(response.status.hasError){
      return Future.error(response.statusCode);
    }else{
      if(response.body["items"]!= null && response.body["items"].length>0){
        return YoutubeVideoResult.fromJson(response.body);

      }else{
        print(response.body);
      }

    }
  }
  //getx
  Future<YoutubeVideoResult> loadgetxvideo(String nextToken)async{
    String url = "youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&order=date&"
        "pageToken=${nextToken}&q=getx&type=video&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk";

    final response =await get(url);
    if(response.status.hasError){
      return Future.error(response.statusCode);
    }else{
      if(response.body["items"]!= null && response.body["items"].length>0){
        return YoutubeVideoResult.fromJson(response.body);

      }else{
        print(response.body);
      }

    }
  }
  //dartvideos
  Future<YoutubeVideoResult> loaddartvideo(String nextToken)async{
    String url = "youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&order=date&"
        "pageToken=${nextToken}&q=dart&type=video&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk";

    final response =await get(url);
    if(response.status.hasError){
      return Future.error(response.statusCode);
    }else{
      if(response.body["items"]!= null && response.body["items"].length>0){
        return YoutubeVideoResult.fromJson(response.body);

      }else{
        print(response.body);
      }

    }
  }
  //cleancodevideo
  Future<YoutubeVideoResult> loadcleancodvideo(String nextToken)async{
    String url = "youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&order=date&"
        "pageToken=${nextToken}&q=cleancode&type=video&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk";

    final response =await get(url);
    if(response.status.hasError){
      return Future.error(response.statusCode);
    }else{
      if(response.body["items"]!= null && response.body["items"].length>0){
        return YoutubeVideoResult.fromJson(response.body);

      }else{
        print(response.body);
      }

    }
  }

//search
  Future<YoutubeVideoResult> search(String nextToken,String q)async{
    String url = "youtube/v3/search?part=snippet&order=date&"
        "pageToken=${nextToken}&q=$q&type=video&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk";

    final response =await get(url);
    if(response.status.hasError){
      return Future.error(response.statusCode);
    }else{
      if(response.body["items"]!= null && response.body["items"].length>0){
        return YoutubeVideoResult.fromJson(response.body);

      }else{
        print(response.body);
      }

    }
  }

  Future<Statistics> videoInfo(String vidId)async{
    String url = "youtube/v3/videos?part=statistics&id=$vidId&"
        "key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk";

    final response =await get(url);
    if(response.status.hasError){
      return Future.error(response.statusCode);
    }else{
      if(response.body["items"]!= null && response.body["items"].length>0){
          Map<String,dynamic> data = response.body["items"][0];
          return Statistics.fromJson(data["statistics"]);
      }else{
        print(response.body);
      }

    }
  }
  Future<Youtuber> channelInfo(String channelId)async{
    String url = "youtube/v3/channels?part=statistics&"
        "part=snippet&id=$channelId&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk";

    final response =await get(url);
    if(response.status.hasError){
      return Future.error(response.statusCode);
    }else{
      if(response.body["items"]!= null && response.body["items"].length>0){
        Map<String,dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }else{
        print(response.body);
      }

    }
  }



}



/*
search
chanel
video


https://youtube.googleapis.com/youtube/v3/channels?part=statistics&part=snippet&id=UCytEtngcIINSMbdc22SrbrQ&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk
https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&order=date&pageToken=a&q=get%20x&type=video&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk
https://youtube.googleapis.com/youtube/v3/videos?part=snippet&id=dKSZV2okSSQ&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk
https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&order=date&pageToken=a&q=get%20x&type=video&key=AIzaSyB9BbaB5fOR_FYyCwiAP2YrPMPwTwXoXRk

* */