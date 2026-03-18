import Usercentrics

struct SetGPPConsentBridge : MethodBridge {

    let name: String = "setGPPConsent"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let argsDict = call.arguments as! Dictionary<String, Any>
        let sectionName = argsDict["sectionName"] as! String
        let fieldName = argsDict["fieldName"] as! String
        let value = argsDict["value"] ?? NSNull()
        usercentrics.shared.setGPPConsent(sectionName: sectionName, fieldName: fieldName, value: value)
        result(nil)
    }
}
