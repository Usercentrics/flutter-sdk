import Usercentrics
import Flutter

struct GetUserSessionDataBridge : MethodBridge {

    let name: String = "getUserSessionData"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentrics.shared.getUserSessionData())
    }
}
