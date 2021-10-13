import Usercentrics

struct InitializeBridge : MethodBridge {

    let name: String = "initialize"

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        // Avoid the Already Initialized Runtime Exception
        // because it messes with the Hot Reload Flutter System
        // (Dart VM restart and the JVM don't)
        // TODO: replace this workaround with a catch of the AlreadyInitializedException
        var alreadyInitialized = false
        UsercentricsCore.isReady { _ in
            alreadyInitialized = true
        } onFailure: { _ in
            alreadyInitialized = true
        }

        if !alreadyInitialized {
            let options = InitializeOptionsSerializer().deserialize(value: call.arguments)
            UsercentricsCore.configure(options: options)
        }

        result(nil)
    }
}
