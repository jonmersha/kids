import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kids/src/pages/home/widgets/cards.dart';
import 'package:kids/src/services/controller/video_controller.dart';
import 'package:kids/src/utils/app_constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UTB extends StatefulWidget {
  final String videoUrl;
  final int catID;
  const UTB({super.key, required this.videoUrl, required this.catID});
  @override
  _UTBState createState() => _UTBState();
}

class _UTBState extends State<UTB> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;


  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoUrl,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }
  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }
  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }
  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },

      ),
      builder: (context, player) => Scaffold(
        body: Column(
          children: [
            player,
            Expanded(
              child: Container(
                child: GetBuilder<VideoController>(
                  builder: (videoController) {
                    return videoController.isLoaded
                        ? buildColumn(videoController)
                        : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  },
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget buildColumn(VideoController videoController) {
    return RefreshIndicator(
      onRefresh:refreshList,
      child: ListView.builder(
          itemCount: videoController.list.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(
                        () {
                          print(videoController.list[index].videoUrl);
                         // _controller.initialVideoId.="";
                          _controller = YoutubePlayerController(
                            initialVideoId: videoController.list[index].videoUrl,
                            flags: const YoutubePlayerFlags(
                              mute: false,
                              autoPlay: true,
                              disableDragSeek: false,
                              loop: false,
                              isLive: false,
                              forceHD: false,
                              enableCaption: true,
                            ),
                          )..addListener(listener);


                });
              },
              child: SizedBox(
                height: 390,
                child: VideoCard(
                  title: videoController.list[index].title!,
                  rating: 4.5,
                  likes: 2,
                  views: videoController.list[index].videoView!,
                  subtitle:
                  videoController.list[index].videoDescription!,
                  imageUrl: videoController.list[index].imageUrl,
                ),
              ),
            );
          }),
    );
  }

  Future<void> refreshList() async {
    Get.find<VideoController>().getList('$CHANNEL_CAT/${widget.catID}');
  }

}