import Usercentrics

struct GetTCStringBridge : MethodBridge {

    let name: String = "getTCString"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentrics.shared.getTCString())
    }
}
