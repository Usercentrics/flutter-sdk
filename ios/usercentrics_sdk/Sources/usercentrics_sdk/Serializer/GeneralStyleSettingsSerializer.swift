import UsercentricsUI
import Flutter

extension GeneralStyleSettings {
    init?(from value: Any?, bannerFont: BannerFont?, assetProvider: FlutterAssetProvider) {
        guard
            let dict = value as? Dictionary<String, Any>
        else { return nil }

        var logo: UIImage?
        if let logoValue = dict["logo"] as? String {
            logo = UIImage(from: logoValue, assetProvider: assetProvider)
        }
        let links = LegalLinksSettings.from(enumString: dict["links"] as? String)

        let toggleStyleSettings = ToggleStyleSettings(from: dict["toggleStyleSettings"])

        self.init(font: bannerFont,
                  logo: logo,
                  links: links,
                  textColor: UIColor(unsafeHex: dict["textColor"] as? String),
                  layerBackgroundColor: UIColor(unsafeHex: dict["layerBackgroundColor"] as? String),
                  layerBackgroundSecondaryColor: UIColor(unsafeHex: dict["layerBackgroundSecondaryColor"] as? String),
                  linkColor: UIColor(unsafeHex: dict["linkColor"] as? String),
                  tabColor: UIColor(unsafeHex: dict["tabColor"] as? String),
                  bordersColor: UIColor(unsafeHex: dict["bordersColor"] as? String),
                  toggleStyleSettings: toggleStyleSettings)
    }
}
