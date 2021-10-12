import Flutter
import UIKit

public class SwiftUsercentricsPlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "usercentrics", binaryMessenger: registrar.messenger())
    let instance = SwiftUsercentricsPlugin(assetProvider: FlutterAssetProviderImpl(registrar: registrar))
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    let assetProvider: FlutterAssetProvider

    init(assetProvider: FlutterAssetProvider) {
        self.assetProvider = assetProvider
    }

    lazy var methods: [String : MethodBridge] = {
        let bridges: [MethodBridge] = [
            InitializeBridge(),
            IsReadyBridge(),
            ResetBridge(),
            ShowCMPBridge(assetProvider: assetProvider),
            GetControllerIdBridge(),
            GetConsentsBridge(),
            GetTCStringBridge(),
            RestoreUserSessionBridge(),
        ]
        return bridges.reduce([String : MethodBridge]()) { dict, value in
            var dict = dict
            dict[value.name] = value
            return dict
        }
    }()

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let method = methods[call.method] else {
        result(FlutterMethodNotImplemented)
        return
    }
    method.invoke(call, result)
  }
}
