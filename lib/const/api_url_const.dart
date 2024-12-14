class ApiUrlConst {
  static bool isLive = true;
  static String baseUrl = isLive
      ? "https://www.googleapis.com/"
      : "http://127.0.0.1:8000/";

  static String auth_api_url = "auth/api/v2/endpoint/";

  static String hostUrl = "https://www.stg-googleapis.com/";
}
