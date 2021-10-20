import Usercentrics

struct GetTCStringBridge : MethodBridge {

    let name: String = "getTCString"
    let usercentricsManager: UsercentricsManagerProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentricsManager.shared.getTCString())
    }
}
