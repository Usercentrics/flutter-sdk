import Usercentrics
import Flutter

struct GetABTestingVariantBridge : MethodBridge {
    let name: String = "getABTestingVariant"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        result(usercentrics.shared.getABTestingVariant())
    }
}
