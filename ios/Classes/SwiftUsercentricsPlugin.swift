import Flutter
import UIKit
import Usercentrics

public class SwiftUsercentricsPlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "usercentrics", binaryMessenger: registrar.messenger())
    let instance = SwiftUsercentricsPlugin(assetProvider: FlutterAssetProviderImpl(registrar: registrar))
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    let assetProvider: FlutterAssetProvider
    var usercentricsManager: UsercentricsManagerProtocol

    init(assetProvider: FlutterAssetProvider, usercentricsManager: UsercentricsManagerProtocol = UsercentricsManager()) {
        self.assetProvider = assetProvider
        self.usercentricsManager = usercentricsManager
    }

    lazy var methods: [String : MethodBridge] = {
        let bridges: [MethodBridge] = [
            InitializeBridge(usercentricsManager: usercentricsManager),
            IsReadyBridge(usercentricsManager: usercentricsManager),
            ResetBridge(usercentricsManager: usercentricsManager),
            ShowCMPBridge(assetProvider: assetProvider),
            GetControllerIdBridge(usercentricsSDK: usercentricsManager.shared),
            GetConsentsBridge(usercentricsSDK: usercentricsManager.shared),
            GetTCStringBridge(usercentricsSDK: usercentricsManager.shared),
            RestoreUserSessionBridge(usercentricsSDK: usercentricsManager.shared),
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
