import 'package:flutter/material.dart';
import 'package:kids/src/utils/app_constants.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget mostViewed() {
  return Card();
}

Widget channelCard() {
  return const Card();
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




class VideoCard extends StatelessWidget {
  final String title;
  final double rating;
  final int likes;
  final int views;
  final String subtitle;
  final String imageUrl;

  const VideoCard({
    super.key,
    required this.title,
    required this.rating,
    required this.likes,
    required this.views,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    //print(imageUrl);
    return SizedBox(
      height: 300,
      child: Card(
        elevation: 5,
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: width > 600 ? 300 : 200,
              //width: 450,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(
                      YoutubeThumbnail(youtubeId: imageUrl).hq(),
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 100,
              width: 400,
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      overflow: TextOverflow.ellipsis),
                ),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar(
                    initialRating: rating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    ratingWidget: RatingWidget(
                      full: const Icon(Icons.star, color: Colors.amber),
                      half: const Icon(Icons.star_half, color: Colors.amber),
                      empty: const Icon(Icons.star_border, color: Colors.amber),
                    ),
                    onRatingUpdate: (value) {
                      // You can handle the rating update here if needed
                    },
                  ),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up),
                      const SizedBox(width: 4.0),
                      Text('$likes'),
                      const SizedBox(width: 16.0),
                      const Icon(Icons.remove_red_eye),
                      const SizedBox(width: 4.0),
                      Text('$views'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
