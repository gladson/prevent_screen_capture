import Flutter
import UIKit

public class SwiftPreventScreenCapturePlugin: NSObject, FlutterPlugin {

    static var enabled = true

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "prevent_screen_capture", binaryMessenger: registrar.messenger())
        let instance = SwiftPreventScreenCapturePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)

        // Registrar os eventos
        let notifier = NotificationCenter.default
        notifier.addObserver(self, selector: #selector(appMovedToBackground(_:)), name: UIApplication.Name.UIApplicationWillResignActive, object: nil)
        notifier.addObserver(self, selector: #selector(appResumed(_:)), name: UIApplication.Name.UIApplicationDidBecomeActive, object: nil)
    }

    @objc static func appMovedToBackground(_ notification:Notification) {
        if( enabled ){
        let app : UIApplication = notification.object! as! UIApplication;
        let uiViewWindow : UIView! = app.keyWindow?.rootViewController?.view
        uiViewWindow.backgroundColor = .clear
        let effectBlur = UIBlurEffect(style: .light)
        let effectBlurView = UIVisualEffectView(effect: effectBlur)
        effectBlurView.frame = uiViewWindow.bounds
        effectBlurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effectBlurView.tag = 55
        uiViewWindow?.addSubview(effectBlurView)
        }
    }

    @objc static func appResumed(_ notification:Notification) {
        if( enabled ){
        let app : UIApplication = notification.object! as! UIApplication;
        app.keyWindow?.rootViewController?.view?.viewWithTag(55)?.removeFromSuperview()
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "onProtectScreenCapture":
            SwiftPreventScreenCapturePlugin.enabled = true;
            result(true)
            break
        case "offProtectScreenCapture":
            SwiftPreventScreenCapturePlugin.enabled = false;
            result(true)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}