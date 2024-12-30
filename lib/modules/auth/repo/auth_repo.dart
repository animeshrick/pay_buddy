import 'dart:convert';

import 'package:pay_buddy/data/model/common_response.dart';

import '../../../config/api_config.dart';
import '../../../const/api_url_const.dart';
import '../../../data/api_client/imp/api_repo_imp.dart';
import '../../../data/api_client/repo/api_repo.dart';
import '../../../data/model/api_return_model.dart';
import '../../../extension/logger_extension.dart';
import '../model/user_token.dart';

class AuthRepo {
  Future<CommonResponse?> getRegisterOTP(
      {required Map<String, dynamic> bodyData}) async {
    try {
      ApiReturnModel? response = await apiRepo().callApi(
          tag: 'getRegisterOTP',
          uri: ApiUrlConst.register_otp,
          method: Method.post,
          headers: ApiConfig().getHeaders(),
          bodyData: BodyData.raw(body: bodyData));
      if (response?.responseString != null) {
        var v = json.decode(response?.responseString ?? "");
        CommonResponse resp = CommonResponse.fromJson(v);
        return resp;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<UserToken?> verifyOTP(
      {required Map<String, dynamic> bodyData}) async {
    try {
      ApiReturnModel? response = await apiRepo().callApi(
          tag: 'verifyOTP',
          uri: ApiUrlConst.verify_otp,
          method: Method.post,
          headers: ApiConfig().getHeaders(),
          bodyData: BodyData.raw(body: bodyData));
      if (response?.responseString != null) {
        var v = json.decode(response?.responseString ?? "");
        UserToken resp = UserToken.fromJson(v);
        return resp;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }
}
