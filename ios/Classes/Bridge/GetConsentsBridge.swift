import Usercentrics

struct GetConsentsBridge : MethodBridge {
    let name: String = "getConsents"
    let usercentricsSDK: UsercentricsSDK
    let consentSerializer: ConsentSerializer = ConsentSerializer()

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        validateAndInvoke(call, result) {
            let consents = usercentricsSDK.getConsents()
            result(consents.map { consentSerializer.serialize(value: $0) })
        }
    }
}
