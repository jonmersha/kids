import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:kids/src/constants/common_functions.dart';
import 'package:kids/src/pages/home/sub_pages/channell%20List.dart';
import 'package:kids/src/pages/home/sub_pages/most_viewed.dart';
import 'package:kids/src/pages/home/sub_pages/play_list.dart';
import 'package:kids/src/pages/home/widgets/homeAppBar.dart';
import 'package:kids/src/pages/home/widgets/video_category.dart';
import 'package:kids/src/pages/home/widgets/banner_slider.dart';
import 'package:kids/src/pages/home/widgets/section_headr.dart';
import 'package:kids/src/pages/home/widgets/video_list_widget.dart';
import 'package:kids/src/pages/widgets/vidoe_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  // CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: homePageAppBar(width, height),
        body: SingleChildScrollView(
          child: Column(
            children: [
              mainDvider(),
              videoCategory(height, width, textTheme),
              mainDvider(),
              homeScreenBanner(height, width),
              mainDvider(),
              blankSpace(height: height * 0.05),
              sectionHeader(width, height, textTheme, context, "New videos",
                  const VideoListView()),
              blankSpace(height: height * 0.05),
              mainDvider(),
              newVideos(height, width),
              sectionHeader(width, height, textTheme, context, "Most Watched",
                  const MostViewed()),
              blankSpace(height: height * 0.05),
              mainDvider(),
              //newVideos(height, width),
              playList(height, width),
              sectionHeader(width, height, textTheme, context, "Top Channels",
                  const ChannelList()),
              blankSpace(height: height * 0.05),
              mainDvider(),
              newVideos(height, width),

              sectionHeader(width, height, textTheme, context, "Top Play List",
                  const PlayLists()),
              blankSpace(height: height * 0.05),
              mainDvider(),
              playList(height, width),
              SizedBox(
                height: 44,
              )
            ],
          ),
        ),
      ),
    );
  }
}
