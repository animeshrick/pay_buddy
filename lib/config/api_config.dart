import '../data/model/app_type_version_param.dart';
import '../service/TokenService/token_service.dart';
import 'app_config.dart';

class ApiConfig {

  Map<String, String> getHeaders ()=> {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  Future<Map<String, String>> getHeadersWithToken ()  async => {
    'Authorization': "Bearer ${(await TokenService().getToken())?.refresh??""}"
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
