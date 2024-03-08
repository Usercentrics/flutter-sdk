import Foundation

struct ClearUserSessionBridge : MethodBridge {
    
    let name: String = "clearUserSession"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        
        usercentrics.shared.clearUserSession { status in
            result(status.serialize())
        } onError: { error in
            result(FlutterError(code: "usercentrics_flutter_clearUserSession_error",
                                message: error.localizedDescription,
                                details: nil ))
        }
    }
}
