class CCPASettings {
  const CCPASettings({
    required this.optOutNoticeLabel,
    required this.btnSave,
    required this.firstLayerTitle,
    required this.isActive,
    required this.showOnPageLoad,
    required this.reshowCMP,
    required this.reshowAfterDays,
    required this.iabAgreementExists,
    required this.firstLayerDescription,
    required this.appFirstLayerDescription,
    required this.firstLayerMobileDescriptionIsActive,
    required this.firstLayerMobileDescription,
    required this.firstLayerHideLanguageSwitch,
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
  final bool reshowCMP;
  final int reshowAfterDays;
  final bool iabAgreementExists;
  final String firstLayerDescription;
  final String appFirstLayerDescription;
  final bool firstLayerMobileDescriptionIsActive;
  final String firstLayerMobileDescription;
  final bool firstLayerHideLanguageSwitch;
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
          reshowCMP == other.reshowCMP &&
          reshowAfterDays == other.reshowAfterDays &&
          iabAgreementExists == other.iabAgreementExists &&
          firstLayerDescription == other.firstLayerDescription &&
          appFirstLayerDescription == other.appFirstLayerDescription &&
          firstLayerMobileDescriptionIsActive ==
              other.firstLayerMobileDescriptionIsActive &&
          firstLayerMobileDescription == other.firstLayerMobileDescription &&
          firstLayerHideLanguageSwitch == other.firstLayerHideLanguageSwitch &&
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
      reshowCMP.hashCode +
      reshowAfterDays.hashCode +
      iabAgreementExists.hashCode +
      firstLayerDescription.hashCode +
      appFirstLayerDescription.hashCode +
      firstLayerMobileDescriptionIsActive.hashCode +
      firstLayerMobileDescription.hashCode +
      firstLayerHideLanguageSwitch.hashCode +
      secondLayerTitle.hashCode +
      secondLayerDescription.hashCode +
      secondLayerHideLanguageSwitch.hashCode +
      btnMoreInfo.hashCode;

  @override
  String toString() => "$CCPASettings($hashCode)";
}
