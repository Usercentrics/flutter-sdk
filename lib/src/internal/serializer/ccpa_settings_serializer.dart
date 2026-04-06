import 'package:usercentrics_sdk/src/model/ccpa_settings.dart';

class CCPASettingsSerializer {
  static CCPASettings deserialize(dynamic value) {
    return CCPASettings(
      optOutNoticeLabel: value['optOutNoticeLabel'] ?? "",
      btnSave: value['btnSave'] ?? "",
      firstLayerTitle: value['firstLayerTitle'] ?? "",
      isActive: value['isActive'],
      showOnPageLoad: value['showOnPageLoad'],
      reshowAfterDays: value['reshowAfterDays'],
      iabAgreementExists: value['iabAgreementExists'],
      appFirstLayerDescription: value['appFirstLayerDescription'] ?? "",
      firstLayerMobileDescriptionIsActive:
          value['firstLayerMobileDescriptionIsActive'],
      firstLayerMobileDescription: value['firstLayerMobileDescription'] ?? "",
      secondLayerTitle: value['secondLayerTitle'] ?? "",
      secondLayerDescription: value['secondLayerDescription'] ?? "",
      secondLayerHideLanguageSwitch: value['secondLayerHideLanguageSwitch'],
      btnMoreInfo: value['btnMoreInfo'] ?? "",
      mspaCoveredTransaction: value['mspaCoveredTransaction'] ?? false,
      mspaMode: MspaModeSerializer.deserialize(value['mspaMode']),
    );
  }
}

class MspaModeSerializer {
  static MspaMode? deserialize(dynamic value) {
    switch (value) {
      case 'NOT_APPLICABLE':
        return MspaMode.notApplicable;
      case 'SERVICE_PROVIDER':
        return MspaMode.serviceProvider;
      case 'OPT_OUT_OPTION':
        return MspaMode.optOutOption;
    }
    return null;
  }
}
