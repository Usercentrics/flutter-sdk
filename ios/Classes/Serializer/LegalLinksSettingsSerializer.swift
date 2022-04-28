import UsercentricsUI

extension LegalLinksSettings {
    static func from(enumString: String?) -> LegalLinksSettings? {
        switch enumString {
        case "FIRST_LAYER_ONLY":
            return LegalLinksSettings.firstLayerOnly
        case "SECOND_LAYER_ONLY":
            return LegalLinksSettings.secondLayerOnly
        case "BOTH":
            return LegalLinksSettings.both
        case "NONE":
            return LegalLinksSettings.none
        default:
            return nil
        }
    }
}
