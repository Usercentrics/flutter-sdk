import Usercentrics

struct GetGPPStringBridge : MethodBridge {

    let name: String = "getGPPString"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentrics.shared.getGPPString())
    }
}
