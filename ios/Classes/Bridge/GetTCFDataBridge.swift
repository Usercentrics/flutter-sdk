import Usercentrics

struct GetTCFDataBridge : MethodBridge {

    let name: String = "getTCFData"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentrics.shared.getTCFData().serialize())
    }
}
