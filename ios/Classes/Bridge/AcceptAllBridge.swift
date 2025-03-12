import Usercentrics
import Flutter

struct AcceptAllBridge : MethodBridge {

    let name: String = "acceptAll"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let consents = usercentrics.shared.acceptAll(consentType: UsercentricsConsentType.initialize(from: call.arguments)!)
        result(consents.map { $0.serialize() })
    }
}
