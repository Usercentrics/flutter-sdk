import Usercentrics

struct SaveOptOutForCCPABridge : MethodBridge {

    let name: String = "saveOptOutForCCPA"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        let isOptedOut = argsDict["isOptedOut"] as! Bool
        let consentType = UsercentricsConsentType.initialize(from: argsDict["consentType"])!
        let consents = usercentrics.shared.saveOptOutForCCPA(isOptedOut: isOptedOut, consentType: consentType)
        result(consents.map { $0.serialize() })
    }
}
