import Usercentrics
import Flutter

struct InitializeBridge : MethodBridge {

    let name: String = "initialize"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)

        guard
            let options = UsercentricsOptions.initialize(from: call.arguments)
        else {
            assert(false)
            return
        }

        usercentrics.configure(options: options)
        result(nil)
    }
}
