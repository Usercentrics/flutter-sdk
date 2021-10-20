import Usercentrics

struct ResetBridge : MethodBridge {

    let name: String = "reset"
    let usercentricsManager: UsercentricsManagerProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        usercentricsManager.reset()
        result(nil)
    }
}
