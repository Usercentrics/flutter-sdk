import Flutter
import UIKit
import Usercentrics

public class SwiftUsercentricsPlugin: NSObject, FlutterPlugin {

  private static var gppStreamHandler: GppSectionChangeStreamHandler?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "usercentrics", binaryMessenger: registrar.messenger())
    let instance = SwiftUsercentricsPlugin(assetProvider: FlutterAssetProviderImpl(registrar: registrar))
    registrar.addMethodCallDelegate(instance, channel: channel)

    let gppEventChannel = FlutterEventChannel(name: "usercentrics/onGppSectionChange", binaryMessenger: registrar.messenger())
    let streamHandler = GppSectionChangeStreamHandler()
    gppEventChannel.setStreamHandler(streamHandler)
    gppStreamHandler = streamHandler
  }

    let assetProvider: FlutterAssetProvider
    let usercentrics: UsercentricsProxyProtocol

    init(assetProvider: FlutterAssetProvider, usercentrics: UsercentricsProxyProtocol = UsercentricsProxy()) {
        self.assetProvider = assetProvider
        self.usercentrics = usercentrics
    }

    lazy var methods: [String : MethodBridge] = {
        let bridges: [MethodBridge] = [
            InitializeBridge(usercentrics: usercentrics),
            IsReadyBridge(usercentrics: usercentrics),
            ShowFirstLayerBridge(assetProvider: assetProvider),
            ShowSecondLayerBridge(assetProvider: assetProvider),
            GetControllerIdBridge(usercentrics: usercentrics),
            GetConsentsBridge(usercentrics: usercentrics),
            RestoreUserSessionBridge(usercentrics: usercentrics),
            GetCMPDataBridge(usercentrics: usercentrics),
            ChangeLanguageBridge(usercentrics: usercentrics),
            AcceptAllBridge(usercentrics: usercentrics),
            AcceptAllForTCFBridge(usercentrics: usercentrics),
            DenyAllBridge(usercentrics: usercentrics),
            DenyAllForTCFBridge(usercentrics: usercentrics),
            SaveDecisionsBridge(usercentrics: usercentrics),
            SaveDecisionsForTCFBridge(usercentrics: usercentrics),
            SaveOptOutForCCPABridge(usercentrics: usercentrics),
            SetCMPIdBridge(usercentrics: usercentrics),
            GetUSPDataBridge(usercentrics: usercentrics),
            GetTCFDataBridge(usercentrics: usercentrics),
            GetUserSessionDataBridge(usercentrics: usercentrics),
            SetABTestingVariantBridge(usercentrics: usercentrics),
            GetABTestingVariantBridge(usercentrics: usercentrics),
            TrackBridge(usercentrics: usercentrics),
            GetAdditionalConsentModeBridge(usercentrics: usercentrics),
            ClearUserSessionBridge(usercentrics: usercentrics),
            GetGPPDataBridge(usercentrics: usercentrics),
            GetGPPStringBridge(usercentrics: usercentrics),
            SetGPPConsentBridge(usercentrics: usercentrics),
            GetDpsMetadataBridge(usercentrics: usercentrics)
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
