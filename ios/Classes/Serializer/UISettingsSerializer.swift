import UsercentricsUI

struct UISettingsSerializer : DataDeserializer {

    let assetProvider: FlutterAssetProvider

    typealias T = UsercentricsUISettings

    let loggerLevelSerializer = UsercentricsLoggerLevelSerializer()

    func deserialize(value: Any?) -> UsercentricsUISettings {
        let dict = value as! Dictionary<String,Any>
        var settings = UsercentricsUISettings()

        if let showCloseButton = dict["showCloseButton"] as? Bool {
            settings.showCloseButton = showCloseButton
        }

        if let customLogo = dict["customLogo"] as? String {
            settings.customLogo = deserializeImage(value: customLogo)
        }

        if let customFont = dict["customFont"] as? Dictionary<String,Any> {
            settings.customFont = deserializeFont(value: customFont)
        }

        return settings
    }

    func deserializeImage(value: String) -> UIImage? {
        let path = assetProvider.lookupKey(forAsset: value)
        return UIImage(named: path)
    }

    func deserializeFont(value: Dictionary<String,Any>) -> UIFont? {
        if let fontAsset = value["fontAssetPath"] as? String,
           let fontSize = value["fontSize"] as? CGFloat,
           let url = Bundle.main.url(forResource: assetProvider.lookupKey(forAsset: fontAsset), withExtension: nil),
           let fontDataProvider = CGDataProvider(url: url as CFURL),
           let cgFont = CGFont(fontDataProvider),
           let fontName = cgFont.fullName {

            let uiFont = UIFont(name: String(describing: fontName), size: fontSize)

            if (uiFont == nil) {
                // Register font and retry to create it
                UIFont.register(from: cgFont)
                return UIFont(name: String(describing: fontName), size: fontSize)
            } else {
                return uiFont
            }
        }
        return nil
    }

}


extension UIFont {
    public static func register(from cgFont: CGFont) {
        guard CTFontManagerRegisterGraphicsFont(cgFont, nil) else {
            assert(false)
        }
    }
}
