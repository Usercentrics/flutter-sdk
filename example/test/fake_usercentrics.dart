import 'package:usercentrics_sdk/usercentrics_sdk.dart';

// You can use your own Usercentrics implementation to test the integration.
// Optionally, you can use a mock library such as `mockito`.
// Feel free to take a look to our own test implementation:
// test/platform/fake_usercentrics_platform.dart
class FakeUsercentrics extends UsercentricsPlatform {
  var initializeCount = 0;

  @override
  void initialize({
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  }) {
    initializeCount++;
  }

  @override
  void reset() {}

  @override
  Future<List<UsercentricsServiceConsent>> get consents {
    throw UnimplementedError();
  }

  @override
  Future<String> get controllerId {
    throw UnimplementedError();
  }

  @override
  Future<String> get tcString {
    throw UnimplementedError();
  }

  @override
  Future<UsercentricsReadyStatus> restoreUserSession(
      {required String controllerId}) {
    throw UnimplementedError();
  }

  @override
  Future<UsercentricsReadyStatus> get status => throw UnimplementedError();

  @override
  Future<UsercentricsCMPData> get cmpData {
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> acceptAll({
    required UsercentricsConsentType consentType,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> acceptAllForTCF({
    required UsercentricsConsentType consentType,
    required TCFDecisionUILayer fromLayer,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<CCPAData> get ccpaData => throw UnimplementedError();

  @override
  Future<void> changeLanguage({required String language}) {
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> denyAll({
    required UsercentricsConsentType consentType,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> denyAllForTCF({
    required UsercentricsConsentType consentType,
    required TCFDecisionUILayer fromLayer,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> saveDecisions({
    required List<UserDecision> decisions,
    required UsercentricsConsentType consentType,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> saveDecisionsForTCF({
    required TCFUserDecisions tcfDecisions,
    required TCFDecisionUILayer fromLayer,
    required List<UserDecision> serviceDecisions,
    required UsercentricsConsentType consentType,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<UsercentricsServiceConsent>> saveOptOutForCCPA({
    required bool isOptedOut,
    required UsercentricsConsentType consentType,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> setCmpIdForTCF({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future<TCFData> get tcfData => throw UnimplementedError();

  @override
  Future<String> get userSessionData => throw UnimplementedError();

  @override
  Future<UsercentricsConsentUserResponse?> showFirstLayer({
    required UsercentricsLayout layout,
    UsercentricsImage? logo,
    UsercentricsFont? font,
    FirstLayerStyleSettings? settings,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<UsercentricsConsentUserResponse?> showSecondLayer({
    required bool showCloseButton,
    UsercentricsImage? logo,
    UsercentricsFont? font,
  }) {
    throw UnimplementedError();
  }
}
