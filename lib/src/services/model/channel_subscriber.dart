class ChannelSubscriber {
  List<Data>? data;

  ChannelSubscriber({this.data});

  ChannelSubscriber.fromJson(Map<String, dynamic> json) {
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
  int? channelId;
  int? userId;
  Null? subscriptionDate;
  Null? isActive;

  Data({this.channelId, this.userId, this.subscriptionDate, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    channelId = json['channel_id'];
    userId = json['user_id'];
    subscriptionDate = json['subscription_date'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channel_id'] = this.channelId;
    data['user_id'] = this.userId;
    data['subscription_date'] = this.subscriptionDate;
    data['is_active'] = this.isActive;
    return data;
  }
}
