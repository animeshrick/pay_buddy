import 'package:pay_buddy/data/model/user_model.dart';

class UserDetails {
  String? message;
  UserModel? user;

  UserDetails({this.message, this.user});

  UserDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['data'] = user!.toJson();
    }
    return data;
  }
}
