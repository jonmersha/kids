class UserViewHistory {
  List<Data>? data;

  UserViewHistory({this.data});

  UserViewHistory.fromJson(Map<String, dynamic> json) {
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
  int? videoId;
  int? userId;
  int? isLiked;

  Data({this.videoId, this.userId, this.isLiked});

  Data.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    userId = json['user_id'];
    isLiked = json['is_liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_id'] = this.videoId;
    data['user_id'] = this.userId;
    data['is_liked'] = this.isLiked;
    return data;
  }
}
