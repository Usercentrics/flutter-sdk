library usercentrics_web;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

class UsercentricsWeb extends UsercentricsPlatform {
  static void registerWith(Registrar registrar) {
    UsercentricsPlatform.instance = UsercentricsWeb();
  }

  @override
  // TODO: implement aBTestingVariant
  Future<String?> get aBTestingVariant => throw UnimplementedError();

  @override
  Future<List<UsercentricsServiceConsent>> acceptAll(
      {required UsercentricsConsentType consentType}) {
    // TODO: implement acceptAll
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> acceptAllForTCF(
      {required UsercentricsConsentType consentType,
      required TCFDecisionUILayer fromLayer}) {
    // TODO: implement acceptAllForTCF
    throw UnimplementedError();
  }

  @override
  // TODO: implement additionalConsentModeData
  Future<AdditionalConsentModeData> get additionalConsentModeData =>
      throw UnimplementedError();

  @override
  // TODO: implement ccpaData
  Future<CCPAData> get ccpaData => throw UnimplementedError();

  @override
  Future<void> changeLanguage({required String language}) {
    // TODO: implement changeLanguage
    throw UnimplementedError();
  }

  @override
  Future<UsercentricsReadyStatus> clearUserSession() {
    // TODO: implement clearUserSession
    throw UnimplementedError();
  }

  @override
  // TODO: implement cmpData
  Future<UsercentricsCMPData> get cmpData => throw UnimplementedError();

  @override
  // TODO: implement consents
  Future<List<UsercentricsServiceConsent>> get consents =>
      throw UnimplementedError();

  @override
  // TODO: implement controllerId
  Future<String> get controllerId => throw UnimplementedError();

  @override
  Future<List<UsercentricsServiceConsent>> denyAll(
      {required UsercentricsConsentType consentType}) {
    // TODO: implement denyAll
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> denyAllForTCF(
      {required UsercentricsConsentType consentType,
      required TCFDecisionUILayer fromLayer}) {
    // TODO: implement denyAllForTCF
    throw UnimplementedError();
  }

  @override
  void initialize(
      {String settingsId = '',
      String ruleSetId = '',
      String? defaultLanguage,
      UsercentricsLoggerLevel? loggerLevel,
      int? timeoutMillis,
      String? version,
      NetworkMode? networkMode,
      bool? consentMediation,
      int? initTimeoutMillis}) {
    // TODO: implement initialize
  }

  @override
  Future<UsercentricsReadyStatus> restoreUserSession(
      {required String controllerId}) {
    // TODO: implement restoreUserSession
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> saveDecisions(
      {required List<UserDecision> decisions,
      required UsercentricsConsentType consentType}) {
    // TODO: implement saveDecisions
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> saveDecisionsForTCF(
      {required TCFUserDecisions tcfDecisions,
      required TCFDecisionUILayer fromLayer,
      required List<UserDecision> serviceDecisions,
      required UsercentricsConsentType consentType}) {
    // TODO: implement saveDecisionsForTCF
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> saveOptOutForCCPA(
      {required bool isOptedOut,
      required UsercentricsConsentType consentType}) {
    // TODO: implement saveOptOutForCCPA
    throw UnimplementedError();
  }

  @override
  Future<void> setABTestingVariant({required String variant}) {
    // TODO: implement setABTestingVariant
    throw UnimplementedError();
  }

  @override
  Future<void> setCmpIdForTCF({required int id}) {
    // TODO: implement setCmpIdForTCF
    throw UnimplementedError();
  }

  @override
  Future<UsercentricsConsentUserResponse?> showFirstLayer(
      {BannerSettings? settings}) {
    // TODO: implement showFirstLayer
    throw UnimplementedError();
  }

  @override
  Future<UsercentricsConsentUserResponse?> showSecondLayer(
      {BannerSettings? settings}) {
    // TODO: implement showSecondLayer
    throw UnimplementedError();
  }

  @override
  // TODO: implement status
  Future<UsercentricsReadyStatus> get status => throw UnimplementedError();

  @override
  // TODO: implement tcfData
  Future<TCFData> get tcfData => throw UnimplementedError();

  @override
  Future<void> track({required UsercentricsAnalyticsEventType event}) {
    // TODO: implement track
    throw UnimplementedError();
  }

  @override
  // TODO: implement userSessionData
  Future<String> get userSessionData => throw UnimplementedError();
}
