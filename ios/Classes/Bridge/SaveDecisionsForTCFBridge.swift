import Usercentrics
import Flutter

struct SaveDecisionsForTCFBridge : MethodBridge {

    let name: String = "saveDecisionsForTCF"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        let tcfDecisions = TCFUserDecisions(from: argsDict["tcfDecisions"] as! NSDictionary)
        let serviceDecisions = (argsDict["serviceDecisions"] as! [Any]).map { UserDecision(from: $0 as! NSDictionary)}
        let consentType = UsercentricsConsentType.initialize(from: argsDict["consentType"])!
        let fromLayer = TCFDecisionUILayer.initialize(from: argsDict["fromLayer"])!
        let consents = usercentrics.shared.saveDecisionsForTCF(tcfDecisions: tcfDecisions, fromLayer: fromLayer, serviceDecisions: serviceDecisions, consentType: consentType)
        result(consents.map { $0.serialize() })
    }
}
