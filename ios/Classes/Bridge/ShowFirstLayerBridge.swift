import UsercentricsUI

struct ShowFirstLayerBridge : MethodBridge {

    let assetProvider: FlutterAssetProvider
    let bannerProxy: UsercentricsBannerProxyProtocol
    let name: String = "showFirstLayer"

    init(assetProvider: FlutterAssetProvider,
         bannerProxy: UsercentricsBannerProxyProtocol = UsercentricsBannerProxy()) {
        self.assetProvider = assetProvider
        self.bannerProxy = bannerProxy
    }

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        let bannerSettingsHolder = BannerSettingsHolder.initialize(from: argsDict["bannerSettings"], assetProvider: assetProvider)
        bannerProxy.showFirstLayer(bannerSettings: bannerSettingsHolder?.settings,
                                   layout: UsercentricsLayout.initialize(from: argsDict["layout"])!,
                                   settings: FirstLayerStyleSettings(from: argsDict["settings"],
                                                                     bannerFont: bannerSettingsHolder?.fontHolder,
                                                                     assetProvider: assetProvider)) { response in
            result(response.serialize())
        }
    }
}
