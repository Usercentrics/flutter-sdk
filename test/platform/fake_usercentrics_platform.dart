import 'package:usercentrics_sdk/src/model/ccpa_data.dart';
import 'package:usercentrics_sdk/src/model/cmp_data.dart';
import 'package:usercentrics_sdk/src/model/consent_type.dart';
import 'package:usercentrics_sdk/src/model/custom_font.dart';
import 'package:usercentrics_sdk/src/model/custom_image.dart';
import 'package:usercentrics_sdk/src/model/logger_level.dart';
import 'package:usercentrics_sdk/src/model/ready_status.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';
import 'package:usercentrics_sdk/src/model/tcf_data.dart';
import 'package:usercentrics_sdk/src/model/tcf_decision_ui_layer.dart';
import 'package:usercentrics_sdk/src/model/user_decision.dart';
import 'package:usercentrics_sdk/src/model/user_response.dart';
import 'package:usercentrics_sdk/src/platform/usercentrics_platform.dart';

// Mock UsercentricsPlatform implementation
class FakeUsercentricsPlatform extends UsercentricsPlatform {
  FakeUsercentricsPlatform({
    this.consentsAnswer,
    this.controllerIdAnswer,
    this.tcStringAnswer,
    this.restoreUserSessionAnswer,
    this.showCMPAnswer,
    this.statusAnswer,
    this.cmpDataAnswer,
    this.acceptAllAnswer,
    this.acceptAllForTCFAnswer,
    this.denyAllAnswer,
    this.denyAllForTCFAnswer,
    this.saveDecisionsAnswer,
    this.saveDecisionsForTCFAnswer,
    this.saveOptOutForCCPAAnswer,
    this.ccpaDataAnswer,
    this.tcfDataAnswer,
    this.userSessionDataAnswer,
  });

  final List<UsercentricsServiceConsent>? consentsAnswer;
  var consentsCount = 0;

  @override
  Future<List<UsercentricsServiceConsent>> get consents {
    consentsCount++;
    return Future.value(consentsAnswer!);
  }

  final String? controllerIdAnswer;
  var controllerIdCount = 0;

  @override
  Future<String> get controllerId {
    controllerIdCount++;
    return Future.value(controllerIdAnswer!);
  }

  final String? tcStringAnswer;
  var tcStringCount = 0;

  @override
  Future<String> get tcString {
    tcStringCount++;
    return Future.value(tcStringAnswer!);
  }

  var initializeCount = 0;
  String? initializeSettingsIdArgument;
  String? initializeDefaultLanguageArgument;
  UsercentricsLoggerLevel? initializeLoggerLevelArgument;
  int? initializeTimeoutMillisArgument;
  String? initializeVersionArgument;

  @override
  void initialize({
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  }) {
    initializeCount++;
    initializeSettingsIdArgument = settingsId;
    initializeDefaultLanguageArgument = defaultLanguage;
    initializeLoggerLevelArgument = loggerLevel;
    initializeTimeoutMillisArgument = timeoutMillis;
    initializeVersionArgument = version;
  }

  var resetCount = 0;

  @override
  void reset() {
    resetCount++;
  }

  final UsercentricsReadyStatus? restoreUserSessionAnswer;
  var restoreUserSessionCount = 0;
  String? restoreUserSessionControllerIdArgument;

  @override
  Future<UsercentricsReadyStatus> restoreUserSession({
    required String controllerId,
  }) {
    restoreUserSessionCount++;
    restoreUserSessionControllerIdArgument = controllerId;
    return Future.value(restoreUserSessionAnswer!);
  }

  final UsercentricsConsentUserResponse? showCMPAnswer;
  var showCMPCount = 0;
  bool? showCMPshowCloseButtonArgument;
  UsercentricsImage? showCMPcustomLogoArgument;
  UsercentricsFont? showCMPcustomFontArgument;

  @override
  Future<UsercentricsConsentUserResponse?> showCMP({
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  }) {
    showCMPCount++;
    showCMPshowCloseButtonArgument = showCloseButton;
    showCMPcustomLogoArgument = customLogo;
    showCMPcustomFontArgument = customFont;
    return Future.value(showCMPAnswer!);
  }

  final UsercentricsReadyStatus? statusAnswer;
  var statusCount = 0;

  @override
  Future<UsercentricsReadyStatus> get status {
    statusCount++;
    return Future.value(statusAnswer!);
  }

  final UsercentricsCMPData? cmpDataAnswer;
  var cmpDataCount = 0;

  @override
  Future<UsercentricsCMPData> get cmpData {
    cmpDataCount++;
    return Future.value(cmpDataAnswer!);
  }

  final List<UsercentricsServiceConsent>? acceptAllAnswer;
  var acceptAllCount = 0;
  UsercentricsConsentType? acceptAllConsentTypeArgument;

  @override
  Future<List<UsercentricsServiceConsent>> acceptAll({
    required UsercentricsConsentType consentType,
  }) {
    acceptAllConsentTypeArgument = consentType;
    acceptAllCount++;
    return Future.value(acceptAllAnswer!);
  }

  final List<UsercentricsServiceConsent>? acceptAllForTCFAnswer;
  var acceptAllForTCFCount = 0;
  UsercentricsConsentType? acceptAllForTCFConsentTypeArgument;
  TCFDecisionUILayer? acceptAllForTCFFromLayerArgument;

  @override
  Future<List<UsercentricsServiceConsent>> acceptAllForTCF({
    required UsercentricsConsentType consentType,
    required TCFDecisionUILayer fromLayer,
  }) {
    acceptAllForTCFConsentTypeArgument = consentType;
    acceptAllForTCFFromLayerArgument = fromLayer;
    acceptAllForTCFCount++;
    return Future.value(acceptAllForTCFAnswer!);
  }

  final List<UsercentricsServiceConsent>? denyAllAnswer;
  var denyAllCount = 0;
  UsercentricsConsentType? denyAllConsentTypeArgument;

  @override
  Future<List<UsercentricsServiceConsent>> denyAll({
    required UsercentricsConsentType consentType,
  }) {
    denyAllConsentTypeArgument = consentType;
    denyAllCount++;
    return Future.value(denyAllAnswer!);
  }

  final List<UsercentricsServiceConsent>? denyAllForTCFAnswer;
  var denyAllForTCFCount = 0;
  UsercentricsConsentType? denyAllForTCFConsentTypeArgument;
  TCFDecisionUILayer? denyAllForTCFFromLayerArgument;

  @override
  Future<List<UsercentricsServiceConsent>> denyAllForTCF({
    required UsercentricsConsentType consentType,
    required TCFDecisionUILayer fromLayer,
  }) {
    denyAllForTCFFromLayerArgument = fromLayer;
    denyAllForTCFConsentTypeArgument = consentType;
    denyAllForTCFCount++;
    return Future.value(denyAllForTCFAnswer!);
  }

  final List<UsercentricsServiceConsent>? saveDecisionsAnswer;
  var saveDecisionsCount = 0;
  UsercentricsConsentType? saveDecisionsConsentTypeArgument;
  List<UserDecision>? saveDecisionsDecisionsArgument;

  @override
  Future<List<UsercentricsServiceConsent>> saveDecisions({
    required List<UserDecision> decisions,
    required UsercentricsConsentType consentType,
  }) {
    saveDecisionsDecisionsArgument = decisions;
    saveDecisionsConsentTypeArgument = consentType;
    saveDecisionsCount++;
    return Future.value(saveDecisionsAnswer!);
  }

  final List<UsercentricsServiceConsent>? saveDecisionsForTCFAnswer;
  var saveDecisionsForTCFCount = 0;
  UsercentricsConsentType? saveDecisionsForTCFConsentTypeArgument;
  TCFUserDecisions? saveDecisionsForTCFDecisionsArgument;
  TCFDecisionUILayer? saveDecisionsForTCFFromLayerArgument;
  List<UserDecision>? saveDecisionsForTCFServiceDecisionsArgument;

  @override
  Future<List<UsercentricsServiceConsent>> saveDecisionsForTCF({
    required TCFUserDecisions tcfDecisions,
    required TCFDecisionUILayer fromLayer,
    required List<UserDecision> serviceDecisions,
    required UsercentricsConsentType consentType,
  }) {
    saveDecisionsForTCFDecisionsArgument = tcfDecisions;
    saveDecisionsForTCFFromLayerArgument = fromLayer;
    saveDecisionsForTCFServiceDecisionsArgument = serviceDecisions;
    saveDecisionsConsentTypeArgument = consentType;
    saveDecisionsForTCFCount++;
    return Future.value(saveDecisionsForTCFAnswer!);
  }

  final List<UsercentricsServiceConsent>? saveOptOutForCCPAAnswer;
  var saveOptOutForCCPACount = 0;
  UsercentricsConsentType? saveOptOutForCCPAConsentTypeArgument;
  bool? saveOptOutForCCPAIsOptedOutArgument;

  @override
  Future<List<UsercentricsServiceConsent>> saveOptOutForCCPA({
    required bool isOptedOut,
    required UsercentricsConsentType consentType,
  }) {
    saveOptOutForCCPAIsOptedOutArgument = isOptedOut;
    saveOptOutForCCPAConsentTypeArgument = consentType;
    saveOptOutForCCPACount++;
    return Future.value(saveOptOutForCCPAAnswer!);
  }

  String? changeLanguageArgument;
  var changeLanguageCount = 0;

  @override
  Future<void> changeLanguage({
    required String language,
  }) {
    changeLanguageArgument = language;
    changeLanguageCount++;
    return Future.value(null);
  }

  int? setCmpIdForTCFArgument;
  var setCmpIdForTCFCount = 0;

  @override
  Future<void> setCmpIdForTCF({
    required int id,
  }) {
    setCmpIdForTCFArgument = id;
    setCmpIdForTCFCount++;
    return Future.value(null);
  }

  final CCPAData? ccpaDataAnswer;
  var ccpaDataCount = 0;

  @override
  Future<CCPAData> get ccpaData {
    ccpaDataCount++;
    return Future.value(ccpaDataAnswer!);
  }

  final TCFData? tcfDataAnswer;
  var tcfDataCount = 0;

  @override
  Future<TCFData> get tcfData {
    tcfDataCount++;
    return Future.value(tcfDataAnswer!);
  }

  final String? userSessionDataAnswer;
  var userSessionDataCount = 0;

  @override
  Future<String> get userSessionData {
    userSessionDataCount++;
    return Future.value(userSessionDataAnswer!);
  }
}
