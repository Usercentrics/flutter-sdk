import UsercentricsUI
import Flutter

extension UIImage {
    convenience init?(from value: String, assetProvider: FlutterAssetProvider) {
        let path = assetProvider.lookupKey(forAsset: value)
        self.init(named: path)
    }
}
