import Usercentrics
import Flutter

struct GetTCFDataBridge : MethodBridge {

    let name: String = "getTCFData"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        usercentrics.shared.getTCFData() {
            result($0.serialize())
        }
    }
}
