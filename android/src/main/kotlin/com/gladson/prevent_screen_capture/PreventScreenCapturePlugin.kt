package com.gladson.prevent_screen_capture

import android.app.Activity
import android.view.WindowManager

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** PreventScreenCapturePlugin */
class PreventScreenCapturePlugin(private val context: Activity): MethodCallHandler {
  
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      if (null == registrar.activity()) {
        return;
      }
      val channel = MethodChannel(registrar.messenger(), "prevent_screen_capture")
      channel.setMethodCallHandler(PreventScreenCapturePlugin(registrar.activity()))
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if( call.method.equals("onProtectScreenCapture")) {
      context.window.setFlags(
        WindowManager.LayoutParams.FLAG_SECURE,
        WindowManager.LayoutParams.FLAG_SECURE
      )
      result.success(null)
    }
    else if( call.method.equals("offProtectScreenCapture")) {
      context.window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
      result.success(null)
    }
    else {
      result.notImplemented()
    }
  }
  
}
