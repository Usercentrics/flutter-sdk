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
        let bannerSettings = BannerSettings(from: argsDict["bannerSettings"], assetProvider: assetProvider)
        bannerProxy.showFirstLayer(bannerSettings: bannerSettings,
                                   layout: UsercentricsLayout.initialize(from: argsDict["layout"])!) { response in
            result(response.serialize())
        }
    }
}
