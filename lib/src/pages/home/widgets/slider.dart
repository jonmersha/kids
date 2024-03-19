

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kids/src/componenets/card_components.dart';
import 'package:kids/src/componenets/youtube.dart';
import 'package:kids/src/services/controller/video_controller.dart';
import 'package:get/get.dart';
import 'package:youtube/youtube_thumbnail.dart';

GetBuilder<VideoController> homeScreenBanner(
    double height,
    double width,
    ) {
  return GetBuilder<VideoController>(
    builder: (videoController){
      return CarouselSlider(
        options: CarouselOptions(height: 200, autoPlay: true, viewportFraction: 1),
        items: videoController.list.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                height: height,
                width:width>500? width/2:width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(

                        image: NetworkImage(YoutubeThumbnail(youtubeId: '${i.imageUrl}').hq()),fit: BoxFit.cover
                        //AssetImage('$path$i'), fit: BoxFit.cover


                    )),
              );
            },
          );
        }).toList(),
      );
    },
  );
}

GetBuilder<VideoController> newVideos(double height, double width) {
  return GetBuilder<VideoController>(
    builder: (videoController){
      return videoController.isLoaded?
      SizedBox(
        height: 450,
        width: width,
        child: ListView.builder(
        itemCount:videoController.list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          print('from Slider: ${videoController.list[index].imageUrl}');
          return

            SizedBox(
              width: width*0.78,
              child: InkWell(
                onTap: (){
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
                              subtitle:videoController.list[index].deacription ,
                              imageUrl:videoController.list[index].imageUrl),
              ),
            );


                },
        ),
      ):Center(child: CircularProgressIndicator(),);
    },
  );

}


