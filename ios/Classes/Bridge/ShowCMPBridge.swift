import UsercentricsUI

struct ShowCMPBridge : MethodBridge {

    let assetProvider: FlutterAssetProvider
    let name: String = "showCMP"

    func invoke(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        assert(call.method == name)
        let controller : FlutterViewController? = UIApplication.shared.delegate?.window??.rootViewController as? FlutterViewController

        let settings = try? UISettingsSerializer(assetProvider: assetProvider).deserialize(value: call.arguments)
        let predefinedUI = UsercentricsUserInterface.getPredefinedUI(settings: settings) { response in
            controller?.dismiss(animated: true, completion: nil)
            result(UserResponseSerializer().serialize(value: response))
        }

        if #available(iOS 13.0, *) { predefinedUI.isModalInPresentation = true }
        controller?.present(predefinedUI, animated: true, completion: nil)
    }
}
