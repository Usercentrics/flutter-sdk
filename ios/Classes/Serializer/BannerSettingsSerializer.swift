import UsercentricsUI

extension BannerSettings {

    init?(from value: Any?, assetProvider: FlutterAssetProvider) {
        guard
            let dict = value as? Dictionary<String, Any>
        else { return nil }

        var logo: UIImage?
        if let logoValue = dict["logo"] as? String {
            logo = UIImage(from: logoValue, assetProvider: assetProvider)
        }

        var bannerFont: BannerFont?
        if let fontValue = dict["font"] as? Dictionary<String,Any> {
            bannerFont = BannerFont.initialize(from: fontValue, assetProvider: assetProvider)
        }

        let links = LegalLinksSettings.from(enumString: dict["links"] as? String)

        let firstLayerSettings = FirstLayerStyleSettings(from: dict["firstLayerSettings"],
                                                         bannerFont: bannerFont,
                                                         assetProvider: assetProvider)

        let secondLayerSettings = SecondLayerStyleSettings(from: dict["secondLayerSettings"],
                                                           bannerFont: bannerFont,
                                                           assetProvider: assetProvider)
        self.init(font: bannerFont,
                  logo: logo,
                  links: links,
                  firstLayerSettings: firstLayerSettings,
                  secondLayerSettings: secondLayerSettings)
    }
}
