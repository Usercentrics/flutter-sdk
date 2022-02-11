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

        var font: UIFont?
        if let fontValue = dict["font"] as? Dictionary<String,Any> {
            font = UIFont.initialize(from: fontValue, assetProvider: assetProvider)
        }

        self.init(font: font,
                  logo: logo)
    }
}
