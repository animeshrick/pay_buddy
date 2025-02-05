import 'dart:convert';

import '../data/model/user_model.dart';
import '../extension/logger_extension.dart';
import '../service/GenerateToken/model/generate_token.dart';
import '../service/value_handler.dart';
import 'local_preferences.dart';
/*

class UserPreference {
  Future<bool?> isLogin() async {
    try {
      String? userVal = await LocalPreferences()
          .getString(key: LocalPreferences.userDetailsKey);
      if (userVal != null) {
        Map<String, dynamic> userJson = json.decode(userVal);
        UserModel userModel = UserModel.fromJson(userJson);
        return userModel.id?.isNotEmpty;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<UserModel?> getData() async {
    try {
      String? userVal = await LocalPreferences()
          .getString(key: LocalPreferences.userDetailsKey);
      if (userVal != null) {
        Map<String, dynamic> userJson = json.decode(userVal);
        UserModel userModel = UserModel.fromJson(userJson);
        return userModel;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<void> saveData({required UserModel userModel}) async {
    try {
      await LocalPreferences().setString(
          key: LocalPreferences.userDetailsKey,
          value: json.encode(userModel.toJson()));
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<bool> clearData() async {
    return await LocalPreferences()
        .clearKey(key: LocalPreferences.userDetailsKey);
  }
}
*/


class UserPreference {
  Future<String?> getUserID() async {
    try {
      UserModel? userModel = await getData();
      String? userId = userModel?.id;
      if (ValueHandler().isTextNotEmptyOrNull(userId)) {
        if (ValueHandler().isNonZeroNumericValue(userId)) {
          return userId;
        }
        return userModel?.id;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<bool?> isLogin() async {
    try {
      String? userVal = await LocalPreferences()
          .getString(key: LocalPreferences.userDetailsKey);
      if (userVal != null) {
        Map<String, dynamic> userJson = json.decode(userVal);
        UserModel userModel = UserModel.fromJson(userJson);
        return userModel.id?.isNotEmpty;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<UserModel?> getData() async {
    try {
      String? userVal = await LocalPreferences()
          .getString(key: LocalPreferences.userDetailsKey);
      if (userVal != null) {
        Map<String, dynamic> userJson = json.decode(userVal);
        UserModel userModel = UserModel.fromJson(userJson);
        return userModel;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<void> saveData({required UserModel userModel}) async {
    try {
      await LocalPreferences().setString(
          key: LocalPreferences.userDetailsKey,
          value: json.encode(userModel.toJson()));
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> updateToken({required GenerateToken generateToken}) async {
    /*UserModel? userModel = await getData();
    if (userModel != null) {
      UserModel userModelSave = userModel;
      userModelSave.accessToken = generateToken.access;
      // userModelSave.refreshToken = generateToken.data?.rToken;
      await saveData(userModel: userModelSave);
    }*/
  }

  Future<bool> clearData() async {
    return await LocalPreferences()
        .clearKey(key: LocalPreferences.userDetailsKey);
  }
}
