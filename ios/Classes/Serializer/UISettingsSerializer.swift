import UsercentricsUI

extension UsercentricsUISettings {
    init?(from value: Any?, assetProvider: FlutterAssetProvider) {
        guard
            let dict = value as? Dictionary<String, Any>
        else { return nil }

        var settings = UsercentricsUISettings()

        if let showCloseButton = dict["showCloseButton"] as? Bool {
            settings.showCloseButton = showCloseButton
        }

        if let customLogo = dict["customLogo"] as? String {
            settings.customLogo = UIImage(from: customLogo, assetProvider: assetProvider)
        }

        if let customFont = dict["customFont"] as? Dictionary<String,Any> {
            settings.customFont = UIFont(from: customFont, assetProvider: assetProvider)
        }

        self.init(customFont: settings.customFont,
                  customLogo: settings.customLogo,
                  showCloseButton: settings.showCloseButton)
    }
}


extension UIImage {
    convenience init?(from value: String, assetProvider: FlutterAssetProvider) {
        let path = assetProvider.lookupKey(forAsset: value)
        self.init(named: path)
    }
}


extension UIFont {
    convenience init?(from value: Dictionary<String,Any>, assetProvider: FlutterAssetProvider) {
        if let fontAsset = value["fontAssetPath"] as? String,
           let fontSize = value["fontSize"] as? CGFloat,
           let url = Bundle.main.url(forResource: assetProvider.lookupKey(forAsset: fontAsset), withExtension: nil),
           let fontDataProvider = CGDataProvider(url: url as CFURL),
           let cgFont = CGFont(fontDataProvider),
           let fontName = cgFont.fullName {

            if UIFont(name: String(describing: fontName), size: fontSize) == nil {
                UIFont.register(from: cgFont)
            }
            self.init(name: String(describing: fontName), size: fontSize)
        } else {
            return nil
        }
    }

    public static func register(from cgFont: CGFont) {
        guard CTFontManagerRegisterGraphicsFont(cgFont, nil) else {
            assert(false)
            return
        }
    }
}
