class ApiUrlConst {
  static bool isLive = false;
  static String baseUrl =
      isLive ? "https://www.googleapis.com/" : "http://192.168.1.9:8000";

  static String auth_api_url = "$baseUrl/auth/api/v2";

  static String hostUrl = "https://www.stg-googleapis.com/";

  static String register_otp = "$auth_api_url/create-users";
}
