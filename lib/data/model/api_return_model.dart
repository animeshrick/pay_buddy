import 'package:pay_buddy/service/value_handler.dart';

import '../../extension/logger_extension.dart';

class ApiReturnModel {
  int? statusCode;
  String? responseString;
  String? message;

  ApiReturnModel({this.statusCode, this.responseString, this.message});

  ApiReturnModel.fromJson(Map<String, dynamic> json) {
    try {
      statusCode = json['statusCode'];
      responseString = ValueHandler().stringify(json['responseString']);
      message = ValueHandler().stringify(json['message']);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['responseString'] = responseString;
    data['message'] = message;
    return data;
  }
}
