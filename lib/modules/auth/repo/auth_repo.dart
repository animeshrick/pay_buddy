import 'dart:convert';

import 'package:pay_buddy/const/http_status_code.dart';

import '../../../config/api_config.dart';
import '../../../const/api_url_const.dart';
import '../../../data/api_client/imp/api_repo_imp.dart';
import '../../../data/api_client/repo/api_repo.dart';
import '../../../data/model/api_return_model.dart';
import '../../../extension/logger_extension.dart';
import '../model/user_token.dart';

class AuthRepo {
  Future<ApiReturnModel?> getRegisterOTP(
      {required Map<String, dynamic> bodyData}) async {
    try {
      ApiReturnModel? response = await apiRepo().callApi(
          tag: 'getRegisterOTP',
          uri: ApiUrlConst.register_otp,
          method: Method.post,
          headers: ApiConfig().getHeaders(),
          bodyData: BodyData.raw(body: bodyData));

      ApiReturnModel resp = ApiReturnModel.fromJson({
        'statusCode': response?.statusCode ?? 0,
        'responseString': response?.responseString ?? "",
        'message': response?.message ?? "",
      });
      return resp;
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<UserToken?> loginCall({required Map<String, dynamic> bodyData}) async {
    try {
      ApiReturnModel? response = await apiRepo().callApi(
          tag: 'login',
          uri: ApiUrlConst.login,
          method: Method.post,
          headers: ApiConfig().getHeaders(),
          bodyData: BodyData.raw(body: bodyData));

      var v = json.decode(response?.responseString ?? "");
      UserToken resp = UserToken.fromJson(v);
      return resp;
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<UserToken?> verifyOTP({required Map<String, dynamic> bodyData}) async {
    try {
      ApiReturnModel? response = await apiRepo().callApi(
          tag: 'verifyOTP',
          uri: ApiUrlConst.verify_otp,
          method: Method.post,
          headers: ApiConfig().getHeaders(),
          bodyData: BodyData.raw(body: bodyData));
      if (response?.statusCode == HttpStatusCodes.HTTP_200_OK) {
        var v = json.decode(response?.responseString ?? "");
        UserToken resp = UserToken.fromJson(v);
        return resp;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<ApiReturnModel?> resendOTP({required String email}) async {
    try {
      ApiReturnModel? response = await apiRepo().callApi(
          tag: 'resendOTP',
          uri: ApiUrlConst.resend_otp,
          method: Method.post,
          headers: ApiConfig().getHeaders(),
          bodyData: BodyData.raw(body: {"email": email}));

      Map<String, dynamic> v = json.decode(response?.responseString ?? "");
      ApiReturnModel resp = ApiReturnModel.fromJson(v);
      return resp;
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }
}
