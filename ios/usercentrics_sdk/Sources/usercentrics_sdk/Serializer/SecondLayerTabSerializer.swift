import Usercentrics

extension SecondLayerTab {
    // An unknown or missing value falls back to the default tab, like a tab the layout does not have.
    static func initialize(from value: Any?) -> SecondLayerTab? {
        switch value as? String {
        case "SERVICES":
            return SecondLayerTab.services
        case "PARTNERS":
            return SecondLayerTab.partners
        default:
            return nil
        }
    }
}
