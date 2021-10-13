import Usercentrics

struct GetConsentsBridge : MethodBridge {
    let name: String = "getConsents"
    let consentSerializer: ConsentSerializer
    let usercentricsSDK: UsercentricsSDK

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        guard call.method == name else {
            result(FlutterMethodNotImplemented)
            return
        }
        let consents = usercentricsSDK.getConsents()
        result(consents.map { consentSerializer.serialize(value: $0) })
    }
}
