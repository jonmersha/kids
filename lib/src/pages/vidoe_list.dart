import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kids/src/componenets/card_components.dart';
//import 'package:kids/src/componenets/youtube_player.dart';
import 'package:kids/src/services/controller/video_controller.dart';
import 'package:kids/src/utils/app_constants.dart';
import '../componenets/youtube.dart';

class VideoListView extends StatelessWidget {
  const VideoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VideoController>(
        builder: (Controller) {
          return Controller.isLoaded
              ? RefreshIndicator(
                  onRefresh: refreshList,
                  child: ListView.builder(
                      itemCount: Controller.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UTB(
                                    videoUrl:
                                        '${Controller.list[index].videoUrl}'),
                              ),
                            );
                          },
                          child: VideoCard(
                            title: Controller.list[index].title!,
                            rating: 4.5,
                            likes: 2,
                            views: Controller.list[index].videoView!,
                            subtitle: Controller.list[index].deacription!,
                            imageUrl: Controller.list[index].imageUrl,
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
    Get.find<VideoController>().getList(VIDEOS);
  }
}
