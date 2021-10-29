import Usercentrics

struct GetControllerIdBridge : MethodBridge {

    let name: String = "getControllerId"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentrics.shared.getControllerId())
    }
}
