import Usercentrics

struct TrackBridge : MethodBridge {

    let name: String = "track"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)

        let argsDict = call.arguments as! Dictionary<String, Any>
        let event = UsercentricsAnalyticsEventType.initialize(from: argsDict["event"])!
        usercentrics.shared.track(event: event)

        result(nil)
    }
}
