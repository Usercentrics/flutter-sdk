import Flutter

protocol FlutterAssetProvider {
    func lookupKey(forAsset: String) -> String
}

struct FlutterAssetProviderImpl : FlutterAssetProvider {

    let registrar: FlutterPluginRegistrar

    func lookupKey(forAsset: String) -> String {
        registrar.lookupKey(forAsset: forAsset)
    }
    
}
