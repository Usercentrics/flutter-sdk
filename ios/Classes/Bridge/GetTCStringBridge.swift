import Usercentrics

struct GetTCStringBridge : MethodBridge {

    let name: String = "getTCString"
    let usercentricsSDK: UsercentricsSDK

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        validateAndInvoke(call, result) {
            result(usercentricsSDK.getTCString())
        }
    }
}
