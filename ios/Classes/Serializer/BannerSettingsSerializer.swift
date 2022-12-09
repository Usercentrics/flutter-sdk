import UsercentricsUI

extension BannerSettings {

    init?(from value: Any?, assetProvider: FlutterAssetProvider) {
        guard
            let dict = value as? Dictionary<String, Any>
        else { return nil }

        let generalStyleDict = dict["generalStyleSettings"] as? Dictionary<String, Any> ?? [:]

        var bannerFont: BannerFont?
        if let fontValue = generalStyleDict["font"] as? Dictionary<String,Any> {
            bannerFont = BannerFont.initialize(from: fontValue, assetProvider: assetProvider)
        }

        let firstLayerSettings = FirstLayerStyleSettings(from: dict["firstLayerStyleSettings"],
                                                         bannerFont: bannerFont,
                                                         assetProvider: assetProvider)

        let secondLayerSettings = SecondLayerStyleSettings(from: dict["secondLayerStyleSettings"],
                                                           bannerFont: bannerFont,
                                                           assetProvider: assetProvider)

        let generalStyleSettings = GeneralStyleSettings(from: generalStyleDict, bannerFont: bannerFont, assetProvider: assetProvider)

        self.init(generalStyleSettings: generalStyleSettings,
                  firstLayerStyleSettings: firstLayerSettings,
                  secondLayerStyleSettings: secondLayerSettings,
                  variantName: dict["variantName"] as? String)
    }
}
