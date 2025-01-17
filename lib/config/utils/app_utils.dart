

class AppUtils {
  // Future<String?> getToken({bool? update}) async {
  //   try {
  //     UserModel? userModel = await UserPreference().getData();
  //     if (ValueHandler().isTextNotEmptyOrNull(userModel?.accessToken) &&
  //         update != true) {
  //       return userModel?.accessToken;
  //     } else if (userModel != null) {
  //       String? token = await GenarateToken().getAccessToken();
  //       userModel.accessToken = token;
  //       await UserPreference().saveData(userModel: userModel);
  //       return userModel.accessToken;
  //     }
  //   } catch (e, stacktrace) {
  //     AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
  //   }
  //   return null;
  // }
}