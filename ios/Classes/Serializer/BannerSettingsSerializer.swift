import UsercentricsUI

struct BannerSettingsHolder {
    public let settings: BannerSettings
    public let fontHolder: BannerFontHolder?

    static func initialize(from value: Any?, assetProvider: FlutterAssetProvider) -> BannerSettingsHolder? {
        guard
            let dict = value as? Dictionary<String, Any>
        else { return nil }

        var logo: UIImage?
        if let logoValue = dict["logo"] as? String {
            logo = UIImage(from: logoValue, assetProvider: assetProvider)
        }

        var fontHolder: BannerFontHolder?
        if let fontValue = dict["font"] as? Dictionary<String,Any> {
            fontHolder = BannerFontHolder.initialize(from: fontValue, assetProvider: assetProvider)
        }

        let settings = BannerSettings(font: fontHolder?.font,
                                      logo: logo)

        return BannerSettingsHolder(settings: settings, fontHolder: fontHolder)
    }
}

// TODO Remove the holder class when the properties are public
//extension BannerSettings {
//    init?(from value: Any?, assetProvider: FlutterAssetProvider) {
//        guard
//            let dict = value as? Dictionary<String, Any>
//        else { return nil }
//
//        var logo: UIImage?
//        if let logoValue = dict["logo"] as? String {
//            logo = UIImage(from: logoValue, assetProvider: assetProvider)
//        }
//
//        var font: BannerFont?
//        if let fontValue = dict["font"] as? Dictionary<String,Any> {
//            font = BannerFont.initialize(from: fontValue, assetProvider: assetProvider)
//        }
//
//        self.init(font: font,
//                  logo: logo)
//    }
//}
