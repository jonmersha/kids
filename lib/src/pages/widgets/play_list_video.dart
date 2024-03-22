import 'package:flutter/material.dart';
import 'package:kids/src/utils/app_constants.dart';

class PlayListVideo extends StatefulWidget {
  const PlayListVideo({super.key});

  @override
  State<PlayListVideo> createState() => _PlayListVideoState();
}

class _PlayListVideoState extends State<PlayListVideo> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Widget playlistCard(
    {String title = '', String descriptions = '', String imageUrl = ''}) {
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
                //YoutubeThumbnail(youtubeId: imageUrl).hq(),fit: BoxFit.fitWidth,
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
                      Text(
                        descriptions,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
                  Text('100 Likes'),
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
                  Text('100 Items'),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


