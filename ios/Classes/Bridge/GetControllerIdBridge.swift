import Usercentrics

struct GetControllerIdBridge : MethodBridge {

    let name: String = "getControllerId"
    let usercentricsManager: UsercentricsManagerProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentricsManager.shared.getControllerId())
    }
}
