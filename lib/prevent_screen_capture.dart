import 'dart:async';

import 'package:flutter/services.dart';

class PreventScreenCapture {
  static const MethodChannel _channel =
      const MethodChannel('prevent_screen_capture');

  static Future<void> protected() async {
    await _channel.invokeMethod('onProtectScreenCapture');
  }

  static Future<void> unprotected() async {
    await _channel.invokeMethod('offProtectScreenCapture');
  }
}
