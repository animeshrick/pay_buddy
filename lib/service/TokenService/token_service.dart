import 'dart:convert';

import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/service/value_handler.dart';
import 'package:pay_buddy/utils/pop_up_items.dart';

import '../../extension/logger_extension.dart';
import '../../modules/auth/model/user_token.dart';
import '../../storage/local_preferences.dart';

class TokenService {
  Future<Token?> getToken() async {
    try {
      String? tokenString =
          await LocalPreferences().getString(key: LocalPreferences.token);
      final Map<String, dynamic> jsonData = json.decode(tokenString ?? "");
      Token token = Token.fromJson(jsonData);
      return token;
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<void> setToken({required Token? token}) async {
    if (ValueHandler().isTextNotEmptyOrNull(token) &&
        (ValueHandler().isTextNotEmptyOrNull(token?.access ?? "") ||
            ValueHandler().isTextNotEmptyOrNull(token?.access ?? ""))) {
      final String token0 = jsonEncode(token ?? "");
      await LocalPreferences()
          .setString(key: LocalPreferences.token, value: token0);
    } else {
      PopUpItems().toastfy(
          message: "Invalid tokens",
          color: HexColor.fromHex(ColorConst.error600));
    }
  }

  Future<void> updateAccessToken({required String access}) async {
    if (ValueHandler().isTextNotEmptyOrNull(access)) {
      String rToken = (await getToken())?.refresh ?? "";
      Token token = Token(access: access, refresh: rToken);
      await setToken(token: token);
    } else {
      PopUpItems().toastfy(
          message: "Invalid access token",
          color: HexColor.fromHex(ColorConst.error600));
    }
  }
}
