class ApiUrlConst {
  static bool isLive = false;
  static String baseUrl =
      isLive ? "--LIVE-URL--" : "https://splitzy-stg.onrender.com";

  static String localhost_url = "http://192.168.1.2:8000";

  static String auth_api_url = "$baseUrl/auth/api/v2";
  static String friend_api_url = "$baseUrl/friends/api/v2";

  static String hostUrl = "https://www.stg-googleapis.com/";

  static String refresh_token = "$auth_api_url/refresh-token";

  static String register_otp = "$auth_api_url/create-users";
  static String verify_otp = "$auth_api_url/verify-otp";
  static String login = "$auth_api_url/sign-in";
  static String resend_otp = "$auth_api_url/send-otp";

  static String user_details = "$auth_api_url/user-details";

  static String all_friend_list = "$friend_api_url/my-friends";
}
