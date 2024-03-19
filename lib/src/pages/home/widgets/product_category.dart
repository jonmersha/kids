
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids/src/componenets/card_components.dart';
import 'package:kids/src/services/controller/group_controller.dart';
import 'package:kids/src/services/controller/video_controller.dart';
import 'package:kids/src/utils/app_constants.dart';
import 'package:youtube/youtube_thumbnail.dart';

// Widget newVideo(double height, double width, TextTheme textTheme) {
//   return SizedBox(
//     height: 400,
//     width: width,
//     child: GetBuilder<VideoController>(builder: (videoController) {
//       return videoController.isLoaded
//           ? ListView.builder(
//               itemCount: videoController.list.length,
//               scrollDirection: Axis.horizontal,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return VideoCard(
//                   height: ,
//                   title: videoController.list[index].title!,
//                   rating: 4.5,
//                   likes: 2,
//                   views: videoController.list[index].videoView!,
//                   subtitle: videoController.list[index].deacription!,
//                   imageUrl: videoController.list[index].imageUrl,
//                 );
//
//               },
//             )
//           : const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.green,
//               ),
//             );
//     }),
//   );
// }

SizedBox videoCategory(double height, double width, TextTheme textTheme) {
  return SizedBox(
    height: 90,
    width: width,
    child: GetBuilder<GroupController>(builder: (controller) {
      return controller.isLoaded
          ? ListView.builder(
        itemCount: controller.list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            //height: 60,
            margin: EdgeInsets.symmetric(horizontal: width * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: NetworkImage(
                      '$BASE_URL/${controller.list[index].groupLogo}'),
                  height: 60,
                ),
                Text(
                  controller.list[index].groupName,
                  style: textTheme.labelLarge,
                )
              ],
            ),
          );
        },
      )
          : const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      );
    }),
  );
}

