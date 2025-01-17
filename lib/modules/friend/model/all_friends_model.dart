import 'package:pay_buddy/data/model/user_model.dart';

class AllFriends {
  FriendsData? data;
  String? message;

  AllFriends({this.data, this.message});

  AllFriends.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? FriendsData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class FriendsData {
  List<UserModel>? friendList;

  FriendsData({this.friendList});

  FriendsData.fromJson(Map<String, dynamic> json) {
    if (json['friend_list'] != null) {
      friendList = <UserModel>[];
      json['friend_list'].forEach((v) {
        friendList!.add(UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (friendList != null) {
      data['friend_list'] = friendList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
