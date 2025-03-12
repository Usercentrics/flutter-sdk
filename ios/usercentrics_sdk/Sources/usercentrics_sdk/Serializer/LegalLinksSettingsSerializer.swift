import UsercentricsUI
import Flutter

extension LegalLinksSettings {
    static func from(enumString: String?) -> LegalLinksSettings? {
        switch enumString {
        case "FIRST_LAYER_ONLY":
            return LegalLinksSettings.firstLayerOnly
        case "SECOND_LAYER_ONLY":
            return LegalLinksSettings.secondLayerOnly
        case "BOTH":
            return LegalLinksSettings.both
        case "HIDDEN":
            return LegalLinksSettings.hidden
        default:
            return nil
        }
    }
}
