import Usercentrics
import Flutter

struct GetUSPDataBridge : MethodBridge {

    let name: String = "getUSPData"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentrics.shared.getUSPData().serialize())
    }
}
