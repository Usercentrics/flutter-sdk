import Usercentrics

struct DenyAllForTCFBridge : MethodBridge {

    let name: String = "denyAllForTCF"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        let fromLayer = TCFDecisionUILayer.initialize(from: argsDict["fromLayer"])!
        let consentType = UsercentricsConsentType.initialize(from: argsDict["consentType"])!
        let unsavedPurposeLIDecisions = (argsDict["unsavedPurposeLIDecisions"] as? [Int: Bool])?.asKotlinIntBooleanDict()
        let consents = usercentrics.shared.denyAllForTCF(fromLayer: fromLayer, consentType: consentType, unsavedPurposeLIDecisions: unsavedPurposeLIDecisions)
        result(consents.map { $0.serialize() })
    }
}
