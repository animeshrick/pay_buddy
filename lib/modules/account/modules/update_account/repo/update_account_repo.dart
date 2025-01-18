import 'dart:convert';

import 'package:pay_buddy/data/model/user_model.dart';

import '../../../../../config/api_config.dart';
import '../../../../../const/api_url_const.dart';
import '../../../../../const/http_status_code.dart';
import '../../../../../data/api_client/imp/api_repo_imp.dart';
import '../../../../../data/api_client/repo/api_repo.dart';
import '../../../../../data/model/api_return_model.dart';
import '../../../../../extension/logger_extension.dart';
import '../../../../../service/GenerateToken/repo/token_generator.dart';

class UpdateAccountRepo {
  Future<UserModel?> update_account(
      {required UserModel user, bool? isRecursion}) async {
    try {
      var bodyData = {
        "fname": user.fname ?? "",
        "lname": user.lname ?? "",
        "email": user.email ?? "",
        "username": user.username ?? "",
        "image": user.image ?? "",
        "dob": user.dob ?? "", //"1998-01-01",
        "phone": user.phone ?? "",
      };
      ApiReturnModel? response = await apiRepo().callApi(
        tag: 'Update Account',
        uri: ApiUrlConst.update_profile,
        method: Method.post,
        headers: await ApiConfig().getHeadersWithToken(),
        bodyData: BodyData.raw(body: bodyData),
      );

      if (response?.responseString != null &&
          response?.statusCode == HttpStatusCodes.HTTP_200_OK) {
        Map<String, dynamic> v = json.decode(response?.responseString ?? "");
        UserModel resp = UserModel.fromJson(v);
        return resp;
      } else if (response?.statusCode == 401) {
        await TokenGenerator().getToken();
        if (isRecursion != true) {
          return await update_account(user: user, isRecursion: true);
        }
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }
}
