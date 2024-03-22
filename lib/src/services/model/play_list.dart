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
  String? description;
  String? playListLogo;
  int? userId;
  int? itemCount;

  Data(
      {this.id,
      this.playListName,
      this.description,
      this.playListLogo,
      this.userId,
      this.itemCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playListName = json['play_list_name'];
    description = json['description'];
    playListLogo = json['play_list_logo'];
    userId = json['user_id'];
    itemCount = json['item_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['play_list_name'] = playListName;
    data['description'] = description;
    data['play_list_logo'] = playListLogo;
    data['user_id'] = userId;
    data['item_count'] = itemCount;
    return data;
  }
}
