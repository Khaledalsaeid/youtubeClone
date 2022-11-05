import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:youtubeclone/app/controler/SearchController.dart';

import 'app/controler/youtubedetailcontrolller.dart';
import 'app/utils/binding/initBinding.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "yt clone",
      theme: ThemeData(
        primaryColor: Colors.white54,
        primarySwatch: Colors.blue,
        visualDensity:VisualDensity.adaptivePlatformDensity,

      ),
      debugShowCheckedModeBanner: false,
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: "/", page: ()=>App()),
        GetPage(name: "/detail/:videoId", page: ()=>YoutubeDeil(),binding: BindingsBuilder(() =>Get.lazyPut<YoutubeDetailController>(() => YoutubeDetailController()))),
        GetPage(name: "search", page: ()=>YoutubeSearch(),binding: BindingsBuilder(() =>Get.lazyPut<SearchController>(() => SearchController()))),

      ],
    );
  }
}


