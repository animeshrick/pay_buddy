class UserToken {
  Token? token;
  String? errorMessage;

  UserToken({this.token, this.errorMessage});

  UserToken.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (token != null) {
      data['token'] = token?.toJson();
    }
    data['errorMessage'] = errorMessage;
    return data;
  }
}

class Token {
  String? refresh;
  String? access;

  Token({this.refresh, this.access});

  Token.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}
