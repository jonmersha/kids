import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kids/src/pages/home/widgets/cards.dart';
import 'package:kids/src/services/controller/video_controller.dart';
import 'package:kids/src/utils/app_constants.dart';

class VideoListByCategory extends StatefulWidget {
  final int catId;
  final dynamic group;
  const VideoListByCategory({super.key, required this.catId, this.group});
  @override
  State<VideoListByCategory> createState() => _VideoListByCategoryState();
}

class _VideoListByCategoryState extends State<VideoListByCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VideoController>(
        builder: (videoController) {
          return videoController.isLoaded
              ? buildColumn(videoController)
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
      ),
    );
  }
  Widget buildColumn(VideoController videoController) {
    return RefreshIndicator(
        onRefresh:refreshList,
        child: ListView.builder(
            itemCount: videoController.list.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                  });
                },
                child: SizedBox(
                  height: 390,
                  child: VideoCard(
                    title: videoController.list[index].title!,
                    rating: 4.5,
                    likes: 2,
                    views: videoController.list[index].videoView!,
                    subtitle:
                        videoController.list[index].videoDescription!,
                    imageUrl: videoController.list[index].imageUrl,
                  ),
                ),
              );
            }),
      );
  }

  Future<void> refreshList() async {
    Get.find<VideoController>().getList('$CHANNEL_CAT/${widget.catId}');
  }

}


