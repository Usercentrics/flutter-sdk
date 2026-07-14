import Usercentrics

private func kotlinInt(_ value: Any?) -> KotlinInt? {
    guard let value = value as? Int else { return nil }
    return KotlinInt(int: Int32(value))
}

private func kotlinFloat(_ value: Any?) -> KotlinFloat? {
    guard let value = value as? Double else { return nil }
    return KotlinFloat(float: Float(value))
}

private func kotlinBool(_ value: Any?) -> KotlinBoolean? {
    guard let value = value as? Bool else { return nil }
    return KotlinBoolean(bool: value)
}

extension BannerInitCustomization {
    static func from(value: Any?) -> BannerInitCustomization? {
        guard let dict = value as? Dictionary<String, Any> else { return nil }

        var purposeListStyle: PurposeListStyle?
        if let purposeListStyleString = dict["purposeListStyle"] as? String {
            purposeListStyle = PurposeListStyle.initialize(from: purposeListStyleString)
        }

        return BannerInitCustomization(
            paddingTop: kotlinInt(dict["paddingTop"]),
            paddingBottom: kotlinInt(dict["paddingBottom"]),
            paddingStart: kotlinInt(dict["paddingStart"]),
            paddingEnd: kotlinInt(dict["paddingEnd"]),
            lineSpacingMultiplier: kotlinFloat(dict["lineSpacingMultiplier"]),
            titleFontSize: kotlinInt(dict["titleFontSize"]),
            bodyFontSize: kotlinInt(dict["bodyFontSize"]),
            linkFontSize: kotlinInt(dict["linkFontSize"]),
            titleFontBold: kotlinBool(dict["titleFontBold"]),
            headerPaddingTop: kotlinInt(dict["headerPaddingTop"]),
            headerPaddingSides: kotlinInt(dict["headerPaddingSides"]),
            headerPaddingBetweenElements: kotlinInt(dict["headerPaddingBetweenElements"]),
            buttonBorderColor: dict["buttonBorderColor"] as? String,
            buttonBorderWidth: kotlinInt(dict["buttonBorderWidth"]),
            purposeListStyle: purposeListStyle,
            stickyHeader: kotlinBool(dict["stickyHeader"]),
            hideLanguageSwitcher: kotlinBool(dict["hideLanguageSwitcher"]),
            buttonHeightDp: kotlinInt(dict["buttonHeightDp"]),
            buttonHorizontalPaddingDp: kotlinInt(dict["buttonHorizontalPaddingDp"]),
            buttonSpacingDp: kotlinInt(dict["buttonSpacingDp"]),
            linkUnderline: kotlinBool(dict["linkUnderline"]),
            showSecondLayerCloseButton: kotlinBool(dict["showSecondLayerCloseButton"]),
            tabFontSize: kotlinInt(dict["tabFontSize"]),
            tabActiveColor: dict["tabActiveColor"] as? String,
            denyAllButtonBackground: dict["denyAllButtonBackground"] as? String,
            acceptAllButtonBackground: dict["acceptAllButtonBackground"] as? String,
            linkColor: dict["linkColor"] as? String
        )
    }
}

extension PurposeListStyle {
    static func initialize(from value: String) -> PurposeListStyle? {
        switch value {
        case "BOXED":
            return PurposeListStyle.boxed
        case "FLAT":
            return PurposeListStyle.flat
        default:
            assert(false)
            return nil
        }
    }
}
