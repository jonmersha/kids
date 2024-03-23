import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids/src/pages/video_list/by_categoty.dart';
import 'package:kids/src/services/controller/group_controller.dart';
import 'package:kids/src/services/controller/video_controller.dart';
import 'package:kids/src/utils/app_constants.dart';

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
                  margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.find<VideoController>().getList(
                              '$CHANNEL_CAT/${controller.list[index].id}');
                          //Load the video
                          //go to the Page
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VideoListByCategory(
                                  catId: controller.list[index].id,
                                  group: controller.list[index]),
                            ),
                          );
                        },
                        child: Image(
                          image: NetworkImage(
                              '$BASE_URL/${controller.list[index].groupLogo}'),
                          height: 60,
                        ),
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
