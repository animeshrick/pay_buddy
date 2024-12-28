import '../../extension/logger_extension.dart';

class CommonResponse {
  String? success_message;
  String? error_message;

  CommonResponse({this.success_message, this.error_message});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    try {
      success_message = json['successMessage'];
      error_message = json['errorMessage'];
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['successMessage'] = success_message;
    data['errorMessage'] = error_message;
    return data;
  }
}
