import 'package:pay_buddy/service/value_handler.dart';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? fname;
  String? lname;
  String? dob;
  String? phone;
  String? image;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? accessToken;
  String? refreshToken;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.fname,
      this.lname,
      this.dob,
      this.phone,
      this.image,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.accessToken,
      this.refreshToken,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = ValueHandler().stringify(json['id']);
    username = json['username'];
    email = json['email'];
    fname = json['fname'];
    lname = json['lname'];
    dob = ValueHandler().stringify(json['dob']);
    phone = ValueHandler().stringify(json['phone']);
    image = json['image'];
    isActive = ValueHandler().boolify(json['is_active']);
    createdAt = ValueHandler().stringify(json['created_at']);
    updatedAt = ValueHandler().stringify(json['updated_at']);
    accessToken = ValueHandler().stringify(json['access']);
    refreshToken = ValueHandler().stringify(json['refresh']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['fname'] = fname;
    data['lname'] = lname;
    data['dob'] = dob;
    data['phone'] = phone;
    data['image'] = image;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['access'] = accessToken;
    data['refresh'] = refreshToken;
    return data;
  }
}
