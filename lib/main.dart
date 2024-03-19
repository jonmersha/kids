import 'package:flutter/material.dart';
import 'package:kids/src/bottom_bar.dart';
import 'package:kids/src/pages/home/home_screen.dart';
import 'package:kids/src/pages/profile/UserProfile.dart';
import 'package:kids/src/pages/vidoe_list.dart';
import 'package:get/get.dart';
import 'package:kids/src/services/controller/group_controller.dart';
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

  Get.find<VideoController>().getList(VIDEOS);
  Get.find<GroupController>().getList(GROUP);

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
        "/user": (context) => const UserProfile()
      },
      home: Scaffold(
        body: BottomBar(),
      ),
    );
  }
}
