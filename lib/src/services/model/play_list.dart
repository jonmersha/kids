class PlayList {
  List<Data>? data;

  PlayList({this.data});

  PlayList.fromJson(Map<String, dynamic> json) {
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
  String? playListName;
  Null? playListLogo;
  int? userId;

  Data({this.id, this.playListName, this.playListLogo, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playListName = json['play_list_name'];
    playListLogo = json['play_list_logo'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['play_list_name'] = this.playListName;
    data['play_list_logo'] = this.playListLogo;
    data['user_id'] = this.userId;
    return data;
  }
}
