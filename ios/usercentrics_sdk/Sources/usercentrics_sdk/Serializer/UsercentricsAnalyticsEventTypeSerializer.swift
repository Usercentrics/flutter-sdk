import Usercentrics

internal let usercentricsAnalyticsEventKeysAndValues = [
    "CMP_SHOWN": UsercentricsAnalyticsEventType.cmpShown,
    "ACCEPT_ALL_FIRST_LAYER": UsercentricsAnalyticsEventType.acceptAllFirstLayer,
    "DENY_ALL_FIRST_LAYER": UsercentricsAnalyticsEventType.denyAllFirstLayer,
    "SAVE_FIRST_LAYER": UsercentricsAnalyticsEventType.saveFirstLayer,
    "ACCEPT_ALL_SECOND_LAYER": UsercentricsAnalyticsEventType.acceptAllSecondLayer,
    "DENY_ALL_SECOND_LAYER": UsercentricsAnalyticsEventType.denyAllSecondLayer,
    "SAVE_SECOND_LAYER": UsercentricsAnalyticsEventType.saveSecondLayer,
    "IMPRINT_LINK": UsercentricsAnalyticsEventType.imprintLink,
    "MORE_INFORMATION_LINK": UsercentricsAnalyticsEventType.moreInformationLink,
    "PRIVACY_POLICY_LINK": UsercentricsAnalyticsEventType.privacyPolicyLink,
    "CCPA_TOGGLES_ON": UsercentricsAnalyticsEventType.ccpaTogglesOn,
    "CCPA_TOGGLES_OFF": UsercentricsAnalyticsEventType.ccpaTogglesOff,
]

extension UsercentricsAnalyticsEventType {

    static func initialize(from value: Any?) -> UsercentricsAnalyticsEventType? {
        let valueString = value as! String
        guard let eventType = usercentricsAnalyticsEventKeysAndValues[valueString] else {
            return nil
        }
        return eventType
    }
}
