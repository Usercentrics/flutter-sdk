import Usercentrics

struct GetGPPDataBridge : MethodBridge {

    let name: String = "getGPPData"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentrics.shared.getGPPData().serialize())
    }
}
