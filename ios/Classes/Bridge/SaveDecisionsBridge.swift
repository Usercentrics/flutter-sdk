import Usercentrics

struct SaveDecisionsBridge : MethodBridge {

    let name: String = "saveDecisions"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        let decisions = (argsDict["decisions"] as! [Any]).map { UserDecision(from: $0 as! NSDictionary)}
        let consentType = UsercentricsConsentType.initialize(from: argsDict["consentType"])!
        let consents = usercentrics.shared.saveDecisions(decisions: decisions, consentType: consentType)
        result(consents.map { $0.serialize() })
    }
}
