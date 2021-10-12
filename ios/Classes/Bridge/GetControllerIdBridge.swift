import Usercentrics

struct GetControllerIdBridge : MethodBridge {

    let name: String = "getControllerId"

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        result(UsercentricsCore.shared.getControllerId())
    }
}
