import Usercentrics

struct ResetBridge : MethodBridge {

    let name: String = "reset"

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        UsercentricsCore.reset()
        result(nil)
    }
}
