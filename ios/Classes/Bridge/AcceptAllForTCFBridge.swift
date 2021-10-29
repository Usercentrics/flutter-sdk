import Usercentrics

struct AcceptAllForTCFBridge : MethodBridge {

    let name: String = "acceptAllForTCF"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        let fromLayer = TCFDecisionUILayer.initialize(from: argsDict["fromLayer"])!
        let consentType = UsercentricsConsentType.initialize(from: argsDict["consentType"])!
        let consents = usercentrics.shared.acceptAllForTCF(fromLayer: fromLayer, consentType: consentType)
        result(consents.map { $0.serialize() })
    }
}
