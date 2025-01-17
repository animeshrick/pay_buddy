import 'dart:convert';

import 'package:pay_buddy/data/model/user_model.dart';

import '../../../config/api_config.dart';
import '../../../const/api_url_const.dart';
import '../../../const/http_status_code.dart';
import '../../../data/api_client/imp/api_repo_imp.dart';
import '../../../data/api_client/repo/api_repo.dart';
import '../../../data/model/api_return_model.dart';
import '../../../extension/logger_extension.dart';
import '../../../service/GenerateToken/repo/token_generator.dart';

class AccountRepo {
  Future<UserModel?> getUserDetails({bool? isRecursion}) async {
    try {ApiReturnModel? response = await apiRepo().callApi(
        tag: 'getUserDetails',
        uri: ApiUrlConst.user_details,
        method: Method.get,
        headers: await ApiConfig().getHeadersWithToken(),
      );

      if (response?.responseString != null &&
          response?.statusCode == HttpStatusCodes.HTTP_200_OK) {
        Map<String, dynamic> v = json.decode(response?.responseString ?? "");
        UserModel resp = UserModel.fromJson(v["data"]);
        return resp;
      } else if (response?.statusCode == 401) {
        await TokenGenerator().getToken();
        if (isRecursion != true) {
          return await getUserDetails(isRecursion: true);
        }
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }
}
