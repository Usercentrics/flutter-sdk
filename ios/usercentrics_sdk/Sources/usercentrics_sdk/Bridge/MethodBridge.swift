import Flutter

protocol MethodBridge {
    var name: String { get }
    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult)
}
