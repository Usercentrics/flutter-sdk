class CCPASettings {
  const CCPASettings({
    required this.optOutNoticeLabel,
    required this.btnSave,
    required this.firstLayerTitle,
    required this.isActive,
    required this.showOnPageLoad,
    required this.reshowAfterDays,
    required this.iabAgreementExists,
    required this.appFirstLayerDescription,
    required this.firstLayerMobileDescriptionIsActive,
    required this.firstLayerMobileDescription,
    required this.secondLayerTitle,
    required this.secondLayerDescription,
    required this.secondLayerHideLanguageSwitch,
    required this.btnMoreInfo,
  });

  final String optOutNoticeLabel;
  final String btnSave;
  final String firstLayerTitle;
  final bool isActive;
  final bool showOnPageLoad;
  final int reshowAfterDays;
  final bool iabAgreementExists;
  final String appFirstLayerDescription;
  final bool firstLayerMobileDescriptionIsActive;
  final String firstLayerMobileDescription;
  final String secondLayerTitle;
  final String secondLayerDescription;
  final bool secondLayerHideLanguageSwitch;
  final String btnMoreInfo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CCPASettings &&
          runtimeType == other.runtimeType &&
          optOutNoticeLabel == other.optOutNoticeLabel &&
          btnSave == other.btnSave &&
          firstLayerTitle == other.firstLayerTitle &&
          isActive == other.isActive &&
          showOnPageLoad == other.showOnPageLoad &&
          reshowAfterDays == other.reshowAfterDays &&
          iabAgreementExists == other.iabAgreementExists &&
          appFirstLayerDescription == other.appFirstLayerDescription &&
          firstLayerMobileDescriptionIsActive ==
              other.firstLayerMobileDescriptionIsActive &&
          firstLayerMobileDescription == other.firstLayerMobileDescription &&
          secondLayerTitle == other.secondLayerTitle &&
          secondLayerDescription == other.secondLayerDescription &&
          secondLayerHideLanguageSwitch ==
              other.secondLayerHideLanguageSwitch &&
          btnMoreInfo == other.btnMoreInfo;

  @override
  int get hashCode =>
      optOutNoticeLabel.hashCode +
      btnSave.hashCode +
      firstLayerTitle.hashCode +
      isActive.hashCode +
      showOnPageLoad.hashCode +
      reshowAfterDays.hashCode +
      iabAgreementExists.hashCode +
      appFirstLayerDescription.hashCode +
      firstLayerMobileDescriptionIsActive.hashCode +
      firstLayerMobileDescription.hashCode +
      secondLayerTitle.hashCode +
      secondLayerDescription.hashCode +
      secondLayerHideLanguageSwitch.hashCode +
      btnMoreInfo.hashCode;

  @override
  String toString() => "$CCPASettings($hashCode)";
}
