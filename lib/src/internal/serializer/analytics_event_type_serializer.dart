import 'package:usercentrics_sdk/src/model/analytics_event_type.dart';

class AnalyticsEventTypeSerializer {
  static dynamic serialize(UsercentricsAnalyticsEventType value) {
    switch (value) {
      case UsercentricsAnalyticsEventType.cmpShown:
        return 'CMP_SHOWN';
      case UsercentricsAnalyticsEventType.acceptAllFirstLayer:
        return 'ACCEPT_ALL_FIRST_LAYER';
      case UsercentricsAnalyticsEventType.denyAllFirstLayer:
        return 'DENY_ALL_FIRST_LAYER';
      case UsercentricsAnalyticsEventType.saveFirstLayer:
        return 'SAVE_FIRST_LAYER';
      case UsercentricsAnalyticsEventType.acceptAllSecondLayer:
        return 'ACCEPT_ALL_SECOND_LAYER';
      case UsercentricsAnalyticsEventType.denyAllSecondLayer:
        return 'DENY_ALL_SECOND_LAYER';
      case UsercentricsAnalyticsEventType.saveSecondLayer:
        return 'SAVE_SECOND_LAYER';
      case UsercentricsAnalyticsEventType.imprintLink:
        return 'IMPRINT_LINK';
      case UsercentricsAnalyticsEventType.moreInformationLink:
        return 'MORE_INFORMATION_LINK';
      case UsercentricsAnalyticsEventType.privacyPolicyLink:
        return 'PRIVACY_POLICY_LINK';
      case UsercentricsAnalyticsEventType.ccpaTogglesOn:
        return 'CCPA_TOGGLES_ON';
      case UsercentricsAnalyticsEventType.ccpaTogglesOff:
        return 'CCPA_TOGGLES_OFF';
    }
  }
}
