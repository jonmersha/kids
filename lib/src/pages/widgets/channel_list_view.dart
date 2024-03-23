import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids/src/services/controller/channel_controller.dart';
import 'package:kids/src/utils/app_constants.dart';
GetBuilder<ChannelController> channelListHome(double height, double width) {
  return GetBuilder<ChannelController>(
    builder: (controller) {
      return controller.isLoaded
          ? Container(
        height: 200,
        child: ListView.builder(
          itemCount: controller.list.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: width,
              child: InkWell(
                onTap: () {
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: channelListCard(
                      title: controller.list[index].channelName,
                      imageUrl: controller.list[index].imageUrl),
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

Widget channelListHomeCard(
    {
      String title = '', String imageUrl = ''}) {
  return Card(
    color: Colors.grey.shade200,
    elevation: 4.0,
    child: Padding(
      padding: EdgeInsets.all(0.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                '$BASE_URL/$imageUrl',
                width: 100,
                height: 90,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.thumb_up),
                  SizedBox(width: 5),
                  Text('100 Subscribers'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.remove_red_eye),
                  SizedBox(width: 5),
                  Text('100 Views'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.list),
                  SizedBox(width: 5),
                  Text('100 Videos'),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
Widget channelListCard(
    {
      String title = '', String imageUrl = ''}) {
  return Card(
    color: Colors.grey.shade200,
    elevation: 4.0,
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                '$BASE_URL/$imageUrl',
                width: 100,
                height: 90,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.thumb_up),
                  SizedBox(width: 5),
                  Text('100 Subscribers'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.remove_red_eye),
                  SizedBox(width: 5),
                  Text('100 Views'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.list),
                  SizedBox(width: 5),
                  Text('100 Videos'),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}