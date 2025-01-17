import '../../../extension/logger_extension.dart';

class GenerateToken {
  String? message;
  String? access;

  GenerateToken({this.message, this.access});

  GenerateToken.fromJson(Map<String, dynamic> json) {
    try {
      message = json['message'];
      access = json['access'];
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['access'] = access;
    return data;
  }
}
