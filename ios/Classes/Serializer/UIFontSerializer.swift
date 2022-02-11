import UsercentricsUI

extension UIFont {
    static func initialize(from value: Dictionary<String,Any>, assetProvider: FlutterAssetProvider) -> UIFont? {
        if let fontAsset = value["fontAssetPath"] as? String {
            return UIFont.initialize(from: fontAsset, fontSizeValue: value["fontSize"] as? CGFloat, assetProvider: assetProvider)
        } else {
            return nil
        }
    }

    static func initialize(from fontAssetValue: String?, fontSizeValue: CGFloat?, assetProvider: FlutterAssetProvider) -> UIFont? {
        let fontSize = fontSizeValue ?? UIFont.systemFontSize

        // System font with custom size
        if fontAssetValue == nil, fontSizeValue != nil {
            return UIFont.systemFont(ofSize: fontSize)
        }

        // Custom font
        if let fontAsset = fontAssetValue,
        let url = Bundle.main.url(forResource: assetProvider.lookupKey(forAsset: fontAsset), withExtension: nil),
           let fontDataProvider = CGDataProvider(url: url as CFURL),
           let cgFont = CGFont(fontDataProvider),
           let fontName = cgFont.fullName {

            if UIFont(name: String(describing: fontName), size: fontSize) == nil {
                UIFont.register(from: cgFont)
            }
            return UIFont(name: String(describing: fontName), size: fontSize)
        }

        return nil
    }

    public static func register(from cgFont: CGFont) {
        guard CTFontManagerRegisterGraphicsFont(cgFont, nil) else {
            assert(false)
            return
        }
    }
}
