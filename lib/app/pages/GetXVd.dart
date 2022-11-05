import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/components/custom_appbar.dart';
import 'package:youtube_clone_app/src/components/video_widget.dart';
import 'package:youtube_clone_app/src/controller/getx_controller.dart';

class GetXVd extends StatelessWidget {
  GetXVd({Key key}) : super(key: key);
  final GetxVedController controller = Get.put(GetxVedController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
            () =>
                CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: CustomAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //page route
                      Get.toNamed("/detail/${controller.youtubeResult.value.items[index].id.videoId}");
                    },
                    child: VideoWidget(
                        video: controller.youtubeResult.value.items[index]),
                  );
                },
                childCount: controller.youtubeResult.value.items == null
                    ? 0
                    : controller.youtubeResult.value.items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
