import UsercentricsUI

struct ShowSecondLayerBridge : MethodBridge {

    let assetProvider: FlutterAssetProvider
    let bannerProxy: UsercentricsBannerProxyProtocol
    let name: String = "showSecondLayer"

    init(assetProvider: FlutterAssetProvider,
         bannerProxy: UsercentricsBannerProxyProtocol = UsercentricsBannerProxy()) {
        self.assetProvider = assetProvider
        self.bannerProxy = bannerProxy
    }

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        let settingsHolder = BannerSettingsHolder.initialize(from: argsDict["bannerSettings"], assetProvider: assetProvider)
        bannerProxy.showSecondLayer(bannerSettings: settingsHolder?.settings,
                                    showCloseButton: argsDict["showCloseButton"] as! Bool) { response in
            result(response.serialize())
        }
    }
}
