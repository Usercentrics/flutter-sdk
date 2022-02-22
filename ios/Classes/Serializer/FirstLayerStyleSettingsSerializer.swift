import UsercentricsUI

extension FirstLayerStyleSettings {
    init?(from value: Any?, bannerFont: BannerFontHolder?, assetProvider: FlutterAssetProvider) {
        guard
            let dict = value as? Dictionary<String, Any>
        else { return nil }

        self.init(headerImage: HeaderImageSettings.from(dict: dict["headerImage"] as? NSDictionary, assetProvider: assetProvider),
                  title: TitleSettings(from: dict["title"] as? NSDictionary, fallbackFont: bannerFont?.boldFont, assetProvider: assetProvider),
                  message: MessageSettings(from: dict["message"] as? NSDictionary, fallbackFont: bannerFont?.regularFont, assetProvider: assetProvider),
                  buttonLayout: ButtonLayout.from(dict: dict["buttonLayout"] as? [[NSDictionary]], fallbackFont: bannerFont?.boldFont, assetProvider: assetProvider),
                  backgroundColor: UIColor(unsafeHex: dict["backgroundColor"] as? String),
                  cornerRadius: dict["cornerRadius"] as? CGFloat,
                  overlayColor: UIColor(unsafeHex: dict["overlayColor"] as? String))
    }
}

extension HeaderImageSettings {
    static func from(dict: NSDictionary?, assetProvider: FlutterAssetProvider) -> HeaderImageSettings? {
        guard let dict = dict else { return nil }

        if let isHidden = dict["isHidden"] as? Bool, isHidden {
            return .hidden
        }

        guard
            let logoValue = dict["image"] as? String,
            let logo = UIImage(from: logoValue, assetProvider: assetProvider)
        else { return nil }

        if let isExtended = dict["isExtended"] as? Bool, isExtended {
            return .extended(image: logo)
        }

        return .logo(settings: LogoSettings(image: logo,
                                            url: nil,
                                            position: SectionPosition.from(enumString: dict["alignment"] as? String),
                                            height: dict["height"] as? CGFloat))
    }
}

extension TitleSettings {
    init?(from dict: NSDictionary?, fallbackFont: UIFont?, assetProvider: FlutterAssetProvider) {
        guard let dict = dict else { return nil }

        let font = UIFont.initialize(from: dict["fontAssetPath"] as? String,
                                     fontSizeValue: dict["textSize"] as? CGFloat,
                                     fallbackFont: fallbackFont,
                                     assetProvider: assetProvider)

        self.init(font: font,
                  textColor: UIColor(unsafeHex: dict["textColor"] as? String),
                  textAlignment: NSTextAlignment.from(enumString: dict["alignment"] as? String))
    }
}

extension MessageSettings {
    init?(from dict: NSDictionary?, fallbackFont: UIFont?, assetProvider: FlutterAssetProvider) {
        guard let dict = dict else { return nil }

        let font = UIFont.initialize(from: dict["fontAssetPath"] as? String,
                                     fontSizeValue: dict["textSize"] as? CGFloat,
                                     fallbackFont: fallbackFont,
                                     assetProvider: assetProvider)

        if let linkTextUnderline = dict["linkTextUnderline"] as? Bool {
            self.init(font: font,
                      textColor: UIColor(unsafeHex: dict["textColor"] as? String ?? ""),
                      textAlignment: NSTextAlignment.from(enumString: dict["alignment"] as? String),
                      linkTextColor: UIColor(unsafeHex: dict["linkTextColor"] as? String ?? ""),
                      linkTextUnderline: linkTextUnderline)
        } else {
            self.init(font: font,
                      textColor: UIColor(unsafeHex: dict["textColor"] as? String ?? ""),
                      textAlignment: NSTextAlignment.from(enumString: dict["alignment"] as? String),
                      linkTextColor: UIColor(unsafeHex: dict["linkTextColor"] as? String ?? ""))
        }
    }
}

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

extension UsercentricsLayout {
    static func from(enumString: String) -> UsercentricsLayout? {
        switch enumString {
        case "FULL":
            return .full
        case "SHEET":
            return .sheet
        case "POPUP_CENTER":
            return .popup(position: .center)
        case "POPUP_BOTTOM":
            return .popup(position: .bottom)
        default:
            return nil
        }
    }
}

extension SectionPosition {
    static func from(enumString: String?) -> SectionPosition? {
        guard let enumString = enumString else { return nil }

        switch enumString {
        case "CENTER":
            return .center
        case "END":
            return .right
        case "START":
            return .left
        default:
            return nil
        }
    }
}

extension NSTextAlignment {
    static func from(enumString: String?) -> NSTextAlignment? {
        guard let enumString = enumString else { return nil }

        switch enumString {
        case "CENTER":
            return .center
        case "END":
            return .right
        case "START":
            return .left
        default:
            return nil
        }
    }
}
