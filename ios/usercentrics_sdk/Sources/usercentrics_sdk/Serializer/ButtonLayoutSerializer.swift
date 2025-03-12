import UsercentricsUI
import Flutter

extension ButtonLayout {
    static func from(dict: [[NSDictionary]]?, fallbackFont: UIFont?, assetProvider: FlutterAssetProvider) -> ButtonLayout? {
        guard let dict = dict else { return nil }
        return .grid(buttons: dict.map { $0.compactMap { button in ButtonSettings(from: button, fallbackFont: fallbackFont, assetProvider: assetProvider) }})
    }
}

extension ButtonSettings {
    init?(from dict: NSDictionary?, fallbackFont: UIFont?, assetProvider: FlutterAssetProvider) {
        guard
            let dict = dict,
            let buttonTypeValue = dict["type"] as? String,
            let buttonType = ButtonType.from(enumString: buttonTypeValue)
        else { return nil }

        let font = UIFont.initialize(from: dict["fontAssetPath"] as? String,
                                     fontSizeValue: dict["textSize"] as? CGFloat,
                                     fallbackFont: fallbackFont,
                                     assetProvider: assetProvider)

        self.init(type: buttonType,
                  font: font,
                  textColor: UIColor(unsafeHex: dict["textColor"] as? String),
                  backgroundColor: UIColor(unsafeHex: dict["backgroundColor"] as? String),
                  cornerRadius: dict["cornerRadius"] as? CGFloat)
    }
}

extension ButtonType {
    static func from(enumString: String) -> ButtonType? {
        switch enumString {
        case "ACCEPT_ALL":
            return .acceptAll
        case "DENY_ALL":
            return .denyAll
        case "MORE":
            return .more
        case "SAVE":
            return .save
        default:
            return nil
        }
    }
}

