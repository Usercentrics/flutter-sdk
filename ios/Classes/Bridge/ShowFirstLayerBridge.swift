import UsercentricsUI

struct ShowFirstLayerBridge : MethodBridge {

    let assetProvider: FlutterAssetProvider
    let bannerProxy: UsercentricsBannerProxyProtocol = UsercentricsBannerProxy()
    let name: String = "showFirstLayer"

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        bannerProxy.showFirstLayer(bannerSettings: BannerSettings(from: argsDict["bannerSettings"], assetProvider: assetProvider),
                                   layout: UsercentricsLayout.initialize(from: argsDict["layout"])!,
                                   settings: FirstLayerStyleSettings(from: argsDict["settings"], assetProvider: assetProvider)) { response in
            result(response.serialize())
        }
    }
}
