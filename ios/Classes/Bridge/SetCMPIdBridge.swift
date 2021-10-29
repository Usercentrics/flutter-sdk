import Usercentrics

struct SetCMPIdBridge : MethodBridge {

    let name: String = "setCMPId"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        usercentrics.shared.setCMPId(id: call.arguments as! Int32)
        result(nil)
    }
}
