import Usercentrics

struct GetConsentsBridge : MethodBridge {
    let name: String = "getConsents"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let consents = usercentrics.shared.getConsents()
        result(consents.map { $0.serialize() })
    }
}
