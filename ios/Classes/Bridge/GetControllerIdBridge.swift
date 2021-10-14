import Usercentrics

struct GetControllerIdBridge : MethodBridge {

    let name: String = "getControllerId"
    let usercentricsSDK: UsercentricsSDK

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        validateAndInvoke(call, result) {
            result(usercentricsSDK.getControllerId())
        }
    }
}
