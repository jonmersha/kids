import 'package:flutter/material.dart';
import 'package:kids/bottom_bar.dart';
import 'package:kids/src/pages/home/home_screen.dart';
import 'package:kids/src/pages/profile/UserProfile.dart';
import 'package:get/get.dart';
import 'package:kids/src/services/controller/channel_controller.dart';
import 'package:kids/src/services/controller/group_controller.dart';
import 'package:kids/src/services/controller/play_list_controller.dart';
import 'package:kids/src/services/controller/play_list_video_controller.dart';
import 'package:kids/src/services/controller/video_controller.dart';

//import 'package:kids/src/services/controller/video_controller.dart';
import 'package:kids/src/services/repository/repo_service.dart';
import 'package:kids/src/utils/app_constants.dart';
import 'package:kids/src/utils/theme.dart';

import 'src/services/repository/api_client.dart';

void main() {
  Get.lazyPut(() => ApIClient(appBaseUrl: BASE_URL));
  Get.lazyPut(() => Services(apIClient: Get.find()));

  Get.lazyPut(() => VideoController(serviceRepo: Get.find()));
  Get.lazyPut(() => GroupController(serviceRepo: Get.find()));

  Get.lazyPut(() => PlayListController(serviceRepo: Get.find()));
  Get.lazyPut(() => PlayListVideoController(serviceRepo: Get.find()));

  Get.lazyPut(() => ChannelController(serviceRepo: Get.find()));
  Get.find<ChannelController>().getList(CHANNEL);
  Get.find<GroupController>().getList(GROUP);

  Get.find<PlayListController>().getList(PLAY_LIST);
  Get.find<PlayListVideoController>().getList(PLAY_LIST_VIDEO);

  runApp(const KidsApp());
}

class KidsApp extends StatelessWidget {
  const KidsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: theme,
      routes: {
        "/home": (context) => const HomeScreen(),
        "/user": (context) => const UserProfile(),
      },
      home: const Scaffold(
        body: BottomBar(),
      ),
    );
  }
}
