import Usercentrics

struct GetConsentsBridge : MethodBridge {

    let name: String = "getConsents"

    let consentSerializer = ConsentSerializer()

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        let consents = UsercentricsCore.shared.getConsents()
        result(consents.map({ consent in
            consentSerializer.serialize(value: consent)
        }))
    }
}
