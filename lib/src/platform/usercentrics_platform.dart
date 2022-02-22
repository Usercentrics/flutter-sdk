import 'package:usercentrics_sdk/src/internal/platform/method_channel_usercentrics.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

abstract class UsercentricsPlatform {
  const UsercentricsPlatform();

  static UsercentricsPlatform instance = MethodChannelUsercentrics();

  void initialize({
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  });

  void reset();

  Future<UsercentricsReadyStatus> get status;

  Future<UsercentricsConsentUserResponse?> showFirstLayer({
    required UsercentricsLayout layout,
    UsercentricsImage? logo,
    BannerFont? font,
    FirstLayerStyleSettings? settings,
  });

  Future<UsercentricsConsentUserResponse?> showSecondLayer({
    required bool showCloseButton,
    UsercentricsImage? logo,
    BannerFont? font,
  });

  Future<List<UsercentricsServiceConsent>> get consents;

  Future<String> get controllerId;

  Future<String> get tcString;

  Future<UsercentricsReadyStatus> restoreUserSession({
    required String controllerId,
  });

  Future<UsercentricsCMPData> get cmpData;

  Future<TCFData> get tcfData;

  Future<CCPAData> get ccpaData;

  Future<String> get userSessionData;

  Future<void> setCmpIdForTCF({
    required int id,
  });

  Future<void> changeLanguage({
    required String language,
  });

  Future<List<UsercentricsServiceConsent>> acceptAll({
    required UsercentricsConsentType consentType,
  });

  Future<List<UsercentricsServiceConsent>> acceptAllForTCF({
    required UsercentricsConsentType consentType,
    required TCFDecisionUILayer fromLayer,
  });

  Future<List<UsercentricsServiceConsent>> denyAll({
    required UsercentricsConsentType consentType,
  });

  Future<List<UsercentricsServiceConsent>> denyAllForTCF({
    required UsercentricsConsentType consentType,
    required TCFDecisionUILayer fromLayer,
  });

  Future<List<UsercentricsServiceConsent>> saveDecisions({
    required List<UserDecision> decisions,
    required UsercentricsConsentType consentType,
  });

  Future<List<UsercentricsServiceConsent>> saveDecisionsForTCF({
    required TCFUserDecisions tcfDecisions,
    required TCFDecisionUILayer fromLayer,
    required List<UserDecision> serviceDecisions,
    required UsercentricsConsentType consentType,
  });

  Future<List<UsercentricsServiceConsent>> saveOptOutForCCPA({
    required bool isOptedOut,
    required UsercentricsConsentType consentType,
  });
}
