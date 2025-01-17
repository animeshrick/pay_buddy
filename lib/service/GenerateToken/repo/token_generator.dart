import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pay_buddy/service/TokenService/token_service.dart';

import '../../../config/api_config.dart';
import '../../../const/api_url_const.dart';
import '../../../const/http_status_code.dart';
import '../../../data/api_client/imp/api_repo_imp.dart';
import '../../../data/api_client/repo/api_repo.dart';
import '../../../data/model/api_return_model.dart';
import '../../../extension/logger_extension.dart';
import '../../../router/router_manager.dart';
import '../../../router/router_name.dart';
import '../../../storage/user_preference.dart';

class TokenGenerator {
  Future<void> getToken() async {
    try {
      Map<String, String> headers = ApiConfig().getHeaders();

      ApiReturnModel? response = await apiRepo().callApi(
          tag: 'Generate Token',
          uri: ApiUrlConst.refresh_token,
          method: Method.post,
          headers: headers,
          bodyData: BodyData.raw(body: {
            "refresh": (await TokenService().getToken())?.refresh ?? ""
          }));
      if (response?.responseString != null &&
          response?.statusCode == HttpStatusCodes.HTTP_200_OK) {
        Map<String, dynamic> v = json.decode(response?.responseString ?? "");
        await TokenService().updateAccessToken(access: v['access']);
      } else if (response?.statusCode == 401) {
        await UserPreference().clearData();
        kIsWeb
            ? RouterManager.getInstance.router.goNamed(RouteName.auth)
            : await RouterManager.getInstance.router.pushNamed(RouteName.auth);
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }
}
