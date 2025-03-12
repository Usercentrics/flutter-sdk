import Usercentrics
import Flutter

struct GetCMPDataBridge : MethodBridge {
    let name: String = "getCMPData"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let cmpData = usercentrics.shared.getCMPData()
        result(cmpData.serialize())
    }
}
