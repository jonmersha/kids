import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kids/src/components/card_components.dart';
import 'package:kids/src/components/youtube.dart';
import 'package:kids/src/pages/home/widgets/cards.dart';
import 'package:kids/src/services/controller/play_list_controller.dart';
import 'package:kids/src/services/controller/video_controller.dart';

GetBuilder<VideoController> newVideos(double height, double width) {
  return GetBuilder<VideoController>(
    builder: (videoController) {
      return videoController.isLoaded
          ? SizedBox(
              width: width > 600 ? 700 : width,
              child: ListView.builder(
                itemCount: videoController.list.length,
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: width > 600 ? 500 : 400,
                    // width: width * 0.78,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UTB(
                                videoUrl:
                                    '${videoController.list[index].videoUrl}'),
                          ),
                        );
                      },
                      child: VideoCard(
                          title: videoController.list[index].title,
                          rating: 4.5,
                          views: videoController.list[index].videoView,
                          likes: videoController.list[index].videoLikes,
                          subtitle:
                              videoController.list[index].videoDescription,
                          imageUrl: videoController.list[index].imageUrl),
                    ),
                  );
                },
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    },
  );
}

GetBuilder<PlayListController> playList(double height, double width) {
  return GetBuilder<PlayListController>(
    builder: (playListController) {
      return playListController.isLoaded
          ? Container(
              height: 200,
              color: Colors.black,
              //width: 390,
              child: ListView.builder(
                itemCount: playListController.list.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 340,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => UTB(
                        //         videoUrl:
                        //             '${playListController.list[index].videoUrl}'),
                        //   ),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: playlistCard(
                            title: playListController.list[index].playListName,
                            descriptions:
                                playListController.list[index].description,
                            imageUrl:
                                playListController.list[index].playListLogo),
                      ),
                    ),
                  );
                },
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    },
  );
}
