import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kids/src/components/card_components.dart';
import 'package:kids/src/components/youtube.dart';
import 'package:kids/src/pages/home/widgets/cards.dart';
import 'package:kids/src/services/controller/video_controller.dart';
import 'package:get/get.dart';
import 'package:youtube/youtube_thumbnail.dart';

GetBuilder<VideoController> homeScreenBanner(
  double height,
  double width,
) {
  return GetBuilder<VideoController>(
    builder: (videoController) {
      return CarouselSlider(
        options:
            CarouselOptions(height: 300, autoPlay: true, viewportFraction: 1),
        items: videoController.list.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                height: height,
                padding: const EdgeInsets.all(8),
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                        image: NetworkImage(
                            YoutubeThumbnail(youtubeId: '${i.imageUrl}').hq()),
                        fit: BoxFit.cover)),
              );
            },
          );
        }).toList(),
      );
    },
  );
}

