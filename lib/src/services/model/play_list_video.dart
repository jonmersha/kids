class PlaylistVideo {
  List<Data>? data;

  PlaylistVideo({this.data});

  PlaylistVideo.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? playListId;
  String? videoUrl;
  int? videoId;
  int? channelId;

  Data({this.id, this.playListId, this.videoUrl, this.videoId, this.channelId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playListId = json['play_list_id'];
    videoUrl = json['videoUrl'];
    videoId = json['video_id'];
    channelId = json['channel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['play_list_id'] = this.playListId;
    data['videoUrl'] = this.videoUrl;
    data['video_id'] = this.videoId;
    data['channel_id'] = this.channelId;
    return data;
  }
}
