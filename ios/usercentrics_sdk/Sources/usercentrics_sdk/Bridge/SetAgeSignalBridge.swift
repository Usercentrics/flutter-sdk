import Flutter
import Usercentrics

struct SetAgeSignalBridge : MethodBridge {

    let name: String = "setAgeSignal"
    let usercentrics: UsercentricsProxyProtocol
    let signalFactory: PublisherAgeSignalFactory

    init(usercentrics: UsercentricsProxyProtocol,
         signalFactory: PublisherAgeSignalFactory = NativePublisherAgeSignalFactory()) {
        self.usercentrics = usercentrics
        self.signalFactory = signalFactory
    }

    // The native API is experimental (MSDK-4778). Neither the signal nor the decision is logged or kept: they only pass through.
    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        guard let signal = UsercentricsPublisherAgeSignal.initialize(from: call.arguments, using: signalFactory) else {
            result(FlutterError(code: "usercentrics_flutter_setAgeSignal_error",
                                message: "Invalid Parameter",
                                details: nil ))
            return
        }

        usercentrics.shared.setAgeSignal(signal: signal, onSuccess: { decision in
            result(decision.serialize())
        }, onError: { error in
            result(FlutterError(code: "usercentrics_flutter_setAgeSignal_error",
                                message: error.localizedDescription,
                                details: nil ))
        })
    }
}
