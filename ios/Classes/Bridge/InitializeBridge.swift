import Usercentrics

struct InitializeBridge : MethodBridge {

    let name: String = "initialize"
    let usercentrics: UsercentricsProxyProtocol

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        
        // Avoid the Already Initialized Runtime Exception
        // because it messes with the Hot Reload Flutter System
        // (Dart VM restart and the JVM don't)
        // TODO: replace this workaround with a catch of the AlreadyInitializedException

        var alreadyInitialized = false
        usercentrics.isReady { _ in
            alreadyInitialized = true
        } onFailure: { _ in
            alreadyInitialized = true
        }

        if !alreadyInitialized {
            guard
                let options = UsercentricsOptions(from: call.arguments)
            else {
                assert(false)
                return
            }

            usercentrics.configure(options: options)
            result(nil)
        }
    }
}
