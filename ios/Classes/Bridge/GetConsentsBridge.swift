import Usercentrics

struct GetConsentsBridge : MethodBridge {
    let name: String = "getConsents"
    let usercentricsManager: UsercentricsManagerProtocol
    let consentSerializer: ConsentSerializer = ConsentSerializer()

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let consents = usercentricsManager.shared.getConsents()
        result(consents.map { consentSerializer.serialize(value: $0) })
    }
}
