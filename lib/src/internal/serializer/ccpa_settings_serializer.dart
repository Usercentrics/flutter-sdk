import 'package:usercentrics_sdk/src/model/ccpa_settings.dart';

class CCPASettingsSerializer {
  static CCPASettings deserialize(dynamic value) {
    return CCPASettings(
      optOutNoticeLabel: value['optOutNoticeLabel'] ?? "",
      btnSave: value['btnSave'] ?? "",
      firstLayerTitle: value['firstLayerTitle'] ?? "",
      isActive: value['isActive'],
      showOnPageLoad: value['showOnPageLoad'],
      reshowCMP: value['reshowCMP'],
      reshowAfterDays: value['reshowAfterDays'],
      iabAgreementExists: value['iabAgreementExists'],
      firstLayerDescription: value['firstLayerDescription'] ?? "",
      appFirstLayerDescription: value['appFirstLayerDescription'] ?? "",
      firstLayerMobileDescriptionIsActive:
          value['firstLayerMobileDescriptionIsActive'],
      firstLayerMobileDescription: value['firstLayerMobileDescription'] ?? "",
      firstLayerHideLanguageSwitch: value['firstLayerHideLanguageSwitch'],
      secondLayerTitle: value['secondLayerTitle'] ?? "",
      secondLayerDescription: value['secondLayerDescription'] ?? "",
      secondLayerHideLanguageSwitch: value['secondLayerHideLanguageSwitch'],
      btnMoreInfo: value['btnMoreInfo'] ?? "",
    );
  }
}
