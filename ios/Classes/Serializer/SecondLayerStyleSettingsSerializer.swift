import UsercentricsUI

extension SecondLayerStyleSettings {
    init?(from value: Any?, bannerFont: BannerFont?, assetProvider: FlutterAssetProvider) {
        guard
            let dict = value as? Dictionary<String, Any>
        else { return nil }

        self.init(buttonLayout: ButtonLayout.from(dict: dict["buttonLayout"] as? [[NSDictionary]], fallbackFont: bannerFont?.boldFont, assetProvider: assetProvider),
                  showCloseButton: dict["showCloseButton"] as? Bool)
    }
}
