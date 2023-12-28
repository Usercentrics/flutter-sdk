import Usercentrics

struct GetAdditionalConsentModeBridge : MethodBridge {
    let name: String = "getAdditionalConsentModeData"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let acmData = usercentrics.shared.getAdditionalConsentModeData()
        result(acmData.serialize())
    }
}
