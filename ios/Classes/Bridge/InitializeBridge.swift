import Usercentrics

struct InitializeBridge : MethodBridge {

    let name: String = "initialize"
    let usercentricsManager: UsercentricsManagerProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        validateAndInvoke(call, result) {
            // Avoid the Already Initialized Runtime Exception
            // because it messes with the Hot Reload Flutter System
            // (Dart VM restart and the JVM don't)
            // TODO: replace this workaround with a catch of the AlreadyInitializedException

            var alreadyInitialized = false
            usercentricsManager.isReady { _ in
                alreadyInitialized = true
            } onFailure: { _ in
                alreadyInitialized = true
            }

            if !alreadyInitialized {
                do {
                    let options = try InitializeOptionsSerializer().deserialize(value: call.arguments)
                    usercentricsManager.configure(options: options)
                    result(nil)

                } catch {
                    result(FlutterError(code: "usercentrics_flutter_Initialize_error",
                                        message: error.localizedDescription,
                                        details: nil))
                }
            }
        }
    }
}
