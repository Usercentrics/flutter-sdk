import Foundation

@testable import usercentrics_sdk

final class FakeFlutterAssetProvider: FlutterAssetProvider {
    func lookupKey(forAsset: String) -> String {
        return forAsset
    }
}
