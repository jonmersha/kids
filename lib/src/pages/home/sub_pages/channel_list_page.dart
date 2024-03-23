import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids/src/pages/widgets/channel_list_view.dart';
import 'package:kids/src/services/controller/channel_controller.dart';
import 'package:kids/src/utils/app_constants.dart';

class ChannelList extends StatelessWidget {
  const ChannelList({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(title: const Text('Channels'),),
        body:GetBuilder<ChannelController>(
          builder: (controller) {
            return controller.isLoaded
                ? SizedBox(
              child: RefreshIndicator(
                onRefresh: refreshList ,
                child: ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: channelListCard(
                          title: controller.list[index].channelName,
                          imageUrl: controller.list[index].imageUrl),
                    );
                  },
                ),
              ),
            )
                : const Center(
              child: CircularProgressIndicator(),
            );
          },
        )



    );
  }

  Future<void> refreshList() async{
    Get.find<ChannelController>().getList(CHANNEL);
  }
}
