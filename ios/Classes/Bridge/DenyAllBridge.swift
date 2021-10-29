import Usercentrics

struct DenyAllBridge : MethodBridge {

    let name: String = "denyAll"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let consents = usercentrics.shared.denyAll(consentType: UsercentricsConsentType.initialize(from: call.arguments)!)
        result(consents.map { $0.serialize() })
    }
}
