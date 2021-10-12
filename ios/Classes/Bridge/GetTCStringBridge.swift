import Usercentrics

struct GetTCStringBridge : MethodBridge {

    let name: String = "getTCString"

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        result(UsercentricsCore.shared.getTCString())
    }
}
