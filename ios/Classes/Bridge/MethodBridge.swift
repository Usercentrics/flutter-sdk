import Flutter

protocol MethodBridge {
    var name: String { get }
    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult)
}

extension MethodBridge {
    func validateAndInvoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult, codeBlock: (() -> Void)) {
        guard call.method == name else {
            result(FlutterMethodNotImplemented)
            return
        }

        codeBlock()
    }
}
