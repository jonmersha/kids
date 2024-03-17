import 'package:flutter/material.dart';
import 'package:kids/src/pages/vidoe.dart';
import 'package:get/get.dart';

import 'package:kids/src/services/controller/video_controller.dart';
import 'package:kids/src/services/repository/repo_service.dart';
import 'package:kids/src/utils/app_constants.dart';

import 'src/services/repository/api_client.dart';

void main() {

  Get.lazyPut(() => ApIClient(appBaseUrl: BASE_URL));
  Get.lazyPut(() => Services(apIClient: Get.find()));
  Get.lazyPut(()=>Controllers(Repo: Get.find()));
  Get.find<Controllers>().getList(VIDEOS);

  runApp(const KidsApp());
}
class KidsApp extends StatelessWidget {
  const KidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: VideoListView(),),);
  }
}

