import UsercentricsUI
import Flutter

extension BannerFont {
    static func initialize(from value: Dictionary<String,Any>, assetProvider: FlutterAssetProvider) -> BannerFont? {
        if let regularFontAsset = value["regularFontAssetPath"] as? String,
           let boldFontAsset = value["boldFontAssetPath"] as? String,
           let fontSizeValue = value["fontSize"] as? CGFloat,
           let regularFont = UIFont.initialize(from: regularFontAsset, fontSizeValue: fontSizeValue, fallbackFont: nil, assetProvider: assetProvider),
           let boldFont = UIFont.initialize(from: boldFontAsset, fontSizeValue: fontSizeValue, fallbackFont: nil, assetProvider: assetProvider) {
            return BannerFont(regularFont: regularFont, boldFont: boldFont)
        } else {
            return nil
        }
    }
}

extension UIFont {

    static func initialize(from fontAssetValue: String?, fontSizeValue: CGFloat?, fallbackFont: UIFont?, assetProvider: FlutterAssetProvider) -> UIFont? {
        let fontSize = fontSizeValue ?? UIFont.systemFontSize

        // System font with custom size
        if fontAssetValue == nil, fontSizeValue != nil {
            return fallbackFont?.withSize(fontSize) ?? UIFont.systemFont(ofSize: fontSize)
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
