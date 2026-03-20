import Usercentrics

struct GetDpsMetadataBridge : MethodBridge {

    let name: String = "getDpsMetadata"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        guard let templateId = call.arguments as? String else {
            result(FlutterError(code: "usercentrics_flutter_getDpsMetadata_error",
                                message: "Invalid Parameter",
                                details: nil ))
            return
        }

        result(usercentrics.shared.getDpsMetadata(templateId: templateId))
    }
}
