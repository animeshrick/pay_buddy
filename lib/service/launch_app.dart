import 'package:flutter/services.dart';

class LaunchAppService {
  static const platform = MethodChannel('com.dbnus.app/launchApp');

  // Function to invoke the native method
  Future<void> launchApp() async {
    try {
      await platform.invokeMethod('launchApp');
    } on PlatformException catch (e) {
      print("Failed to launch app: ${e.message}");
    }
  }
}
