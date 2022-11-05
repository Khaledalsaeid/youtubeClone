import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum RouteName{
  Home,Getxvid,Dartvid,Cleancodevid,Add
}

class AppController extends GetxController{
  RxInt currentIndex =0.obs;
  void _showBottomSheet(){
    Get.bottomSheet(Text(""));
  }

  void _changePageIndex(int index){
    if(RouteName.values[index]== RouteName.Add){
      _showBottomSheet();
    }else{
      currentIndex(index);
    }

  }
}