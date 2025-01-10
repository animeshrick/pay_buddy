import '../../extension/logger_extension.dart';

class CommonResponse {
  String? statusCode;
  String? message;
  CommonResponse({this.message, this.statusCode});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    try {
      message = json['message'];
      statusCode = json['statusCode'];
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusCode'] = statusCode;
    return data;
  }
}
