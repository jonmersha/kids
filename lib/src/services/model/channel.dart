class Channel {
  List<Data>? data;

  Channel({this.data});

  Channel.fromJson(Map<String, dynamic> json) {
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
  Null? channelOwner;
  Null? channelName;
  Null? creationDate;
  Null? isActive;
  Null? isBanned;

  Data(
      {this.id,
      this.channelOwner,
      this.channelName,
      this.creationDate,
      this.isActive,
      this.isBanned});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channelOwner = json['channel_owner'];
    channelName = json['channel_name'];
    creationDate = json['creation_date'];
    isActive = json['is_active'];
    isBanned = json['is_banned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['channel_owner'] = this.channelOwner;
    data['channel_name'] = this.channelName;
    data['creation_date'] = this.creationDate;
    data['is_active'] = this.isActive;
    data['is_banned'] = this.isBanned;
    return data;
  }
}
