class Video {
  List<Data>? data;

  Video({this.data});

  Video.fromJson(Map<String, dynamic> json) {
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
  int? channelId;
  String? title;
  String? deacription;
  String? imageUrl;
  String? videoUrl;
  String? videoSourceType;
  int? isEnabled;
  Null? uploadDate;
  double? videoLength;
  int? videoUploder;
  String? videoType;
  String? videoLanguage;
  int? videoView;
  int? videoLikes;
  int? isFree;
  String? accessType;
  int? videoCost;

  Data(
      {this.id,
        this.channelId,
        this.title,
        this.deacription,
        this.imageUrl,
        this.videoUrl,
        this.videoSourceType,
        this.isEnabled,
        this.uploadDate,
        this.videoLength,
        this.videoUploder,
        this.videoType,
        this.videoLanguage,
        this.videoView,
        this.videoLikes,
        this.isFree,
        this.accessType,
        this.videoCost});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channelId = json['channel_id'];
    title = json['title'];
    deacription = json['deacription'];
    imageUrl = json['image_url'];
    videoUrl = json['video_url'];
    videoSourceType = json['video_source_type'];
    isEnabled = json['is_enabled'];
    uploadDate = json['upload_date'];
    videoLength = json['video_length'];
    videoUploder = json['video_uploder'];
    videoType = json['video_type'];
    videoLanguage = json['video_language'];
    videoView = json['video_view'];
    videoLikes = json['video_likes'];
    isFree = json['is_free'];
    accessType = json['access_type'];
    videoCost = json['video_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel_id'] = this.channelId;
    data['title'] = this.title;
    data['deacription'] = this.deacription;
    data['image_url'] = this.imageUrl;
    data['video_url'] = this.videoUrl;
    data['video_source_type'] = this.videoSourceType;
    data['is_enabled'] = this.isEnabled;
    data['upload_date'] = this.uploadDate;
    data['video_length'] = this.videoLength;
    data['video_uploder'] = this.videoUploder;
    data['video_type'] = this.videoType;
    data['video_language'] = this.videoLanguage;
    data['video_view'] = this.videoView;
    data['video_likes'] = this.videoLikes;
    data['is_free'] = this.isFree;
    data['access_type'] = this.accessType;
    data['video_cost'] = this.videoCost;
    return data;
  }
}
