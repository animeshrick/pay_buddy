import '../../../extension/logger_extension.dart';
import '../helper/js_helper.dart';

class JsProvider {
  JSHelper jsHelper = JSHelper();

  Future paytmLoadScript(
      String txnToken,
      String orderId,
      String amount,
      String mid,
      ) async {
    return await jsHelper.paytmLoadScript(txnToken, orderId, amount, mid);
  }

  Future<void> downloadFile({required String url, required String name}) async {
    await jsHelper.downloadFile(url: url, name: name);
  }

  Future<void> changeUrl({required String path}) async {
    await jsHelper.changeUrlJs(path: path);
  }

  Future<void> onCheckoutPhonePe() async {
    await jsHelper.onCheckoutPhonePe();
  }

  Future getCurrentUrlElementByIdFun(String iframeId) async {
    return await jsHelper.getCurrentUrlElementByIdFun(iframeId);
  }

  String getPlatformFromJS() {
    return jsHelper.getPlatformFromJS();
  }

  String getBaseUrlFromJS() {
    return jsHelper.getBaseUrlFromJS();
  }

  Future<String> callJSPromise() async {
    return await jsHelper.callJSPromise();
  }

  Future<String?> getDeviceId() async {
    try {
      return await jsHelper.getDeviceId();
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<String> callOpenTab() async {
    return await jsHelper.callOpenTab();
  }

  void reDirectToUrl(String reDirectUrl) {
    jsHelper.reDirectToUrl(reDirectUrl);
  }

  Future<void> setVolume(double volume) async {
    await jsHelper.setVolume(volume);
  }

  void submitForm(actionUrl, String obj, String id) {
    jsHelper.submitForm(actionUrl, obj, id);
  }

  Future<void> loadJs({required String jsPath}) async {
    try {
      await jsHelper.loadJs(jsPath: jsPath);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> faceBookTrackEvent(
      {required String eventName, Map<String, dynamic>? params}) async {
    try {
      String jsPath = "assets/js/facebook_track_event.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'trackEvent',
          jsFunctionArgs: [eventName, params ?? {}]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> faceBookLogPurchaseEvent(
      {required String currency,
        required double value,
        Map<String, dynamic>? params}) async {
    try {
      String jsPath = "assets/js/facebook_track_event.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'logPurchaseEvent',
          jsFunctionArgs: [currency, value, params ?? {}]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> facebookSetUserID({required String userId}) async {
    try {
      String jsPath = "assets/js/facebook_track_event.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'setFacebookUserID',
          jsFunctionArgs: [userId]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> facebookClearUserID() async {
    try {
      String jsPath = "assets/js/facebook_track_event.js";
      await jsHelper.loadJs(
          jsPath: jsPath, jsFunctionName: 'clearFacebookUserID');
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }
}
