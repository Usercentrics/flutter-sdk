import UsercentricsUI

struct ShowSecondLayerBridge : MethodBridge {

    let assetProvider: FlutterAssetProvider
    let bannerProxy: UsercentricsBannerProxyProtocol = UsercentricsBannerProxy()
    let name: String = "showSecondLayer"

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        bannerProxy.showSecondLayer(bannerSettings: BannerSettings(from: argsDict["bannerSettings"], assetProvider: assetProvider),
                                    showCloseButton: argsDict["showCloseButton"] as! Bool) { response in
            result(response.serialize())
        }
    }
}
