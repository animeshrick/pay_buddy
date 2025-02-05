import '../data/model/app_type_version_param.dart';
import '../service/TokenService/token_service.dart';
import 'app_config.dart';

class ApiConfig {

  Map<String, String> getHeaders ()=> {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  String staticToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM3MjI0MzIzLCJpYXQiOjE3MzcxMzc5MjMsImp0aSI6ImViZjVlYjNjYzdjZDRkN2M4ZjJhYzIyMDQwNzEwMzQzIiwidXNlcl9pZCI6IjIyN2IxOTdiLWNmOWQtNDhkOS04OWY2LWFlYTg4OWFjN2E5MSJ9.vSG9GDWvFta8pexe4jzGZ_TrTrZI83Xdk_WZXUYCTbo";

  Future<Map<String, String>> getHeadersWithToken ()  async => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    // 'Authorization': "Bearer $staticToken"
    'Authorization': "Bearer ${(await TokenService().getToken())?.access??""}"
  };
  // Future<Map<String, String>> getHeaders(
  //     {bool? isPinCodeRequired, bool? isSearchUrl, bool? isArticleUrl}) async {
  //   Headers headers = Headers(
  //       userAgent: !kIsWeb ? null : AppConfig().getUserAgent(),
  //       accept: "application/json, text/plain, */*",
  //       acceptLanguage: "en-US,en;q=0.9",
  //       acceptEncoding: "gzip, deflate, br",
  //       browserId: kIsWeb ? "${await AppConfig().getBrowserId()}" : null,
  //       appType: AppConfig().getAppType(),
  //       appVersion: await AppConfig().getAppVersion(),
  //       contentType: "application/json",
  //       origin: !kIsWeb ? null : ApiUrlConst.hostUrl,
  //       connection: !kIsWeb ? null : "keep-alive",
  //       referer: !kIsWeb ? null : ApiUrlConst.hostUrl,
  //       secFetchDest: !kIsWeb ? null : "empty",
  //       secFetchMode: !kIsWeb ? null : "cors",
  //       secFetchSite: !kIsWeb ? null : "same-site",
  //       authorization: "Basic YWRtaW46YWRtaW4=",
  //       deviceId: kIsWeb ? null : await AppConfig().getDeviceId(),
  //       deviceDensityType: "xhdpi",
  //       deviceName: await AppConfig().getDeviceName(),
  //       networkInfo: await AppConfig().getNetworkInfo(),
  //       deviceWidth: AppConfig().getDeviceWidth(),
  //       deviceOsInfo: await AppConfig().getDeviceOsInfo(),
  //       deviceHeight: AppConfig().getDeviceHeight(),
  //       deviceDensity: "560",
  //       appVersionCode: await AppConfig().getAppVersionCode(),
  //       rtoken: "",
  //       // rtoken: (await UserPreference().getData())?.rtoken,
  //       accessToken: (await UserPreference().getData())?.accessToken);
  //   return headers.toJson();
  // }

  Future<Map<String, dynamic>> getParams({bool? isPinCodeRequired}) async {
    Params appTypeVersionParam = Params(
      appType: AppConfig().getAppType(),
      appVersion: await AppConfig().getAppVersion(),
    );
    return appTypeVersionParam.toJson();
  }
}
