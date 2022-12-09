import Usercentrics

struct SetABTestingVariantBridge : MethodBridge {

    let name: String = "setABTestingVariant"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        usercentrics.shared.setABTestingVariant(variantName: call.arguments as! String)
        result(nil)
    }
}
