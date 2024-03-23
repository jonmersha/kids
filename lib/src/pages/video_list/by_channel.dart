import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kids/src/components/youtube.dart';
import 'package:kids/src/pages/home/widgets/cards.dart';
import 'package:kids/src/services/controller/video_controller.dart';
import 'package:kids/src/utils/app_constants.dart';

class VideoListByCategory extends StatelessWidget {
  final int catId;
  const VideoListByCategory({super.key, required this.catId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VideoController>(
        builder: (videoController) {
          return videoController.isLoaded
              ? RefreshIndicator(
                  onRefresh:refreshList,
                  child: ListView.builder(
                      itemCount: videoController.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UTB(
                                    videoUrl:
                                        '${videoController.list[index].videoUrl}',catID: 2,),
                              ),
                            );
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
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
        },
      ),
    );
  }

  Future<void> refreshList() async {
    Get.find<VideoController>().getList('$CHANNEL_CAT/${catId}');
  }
}
