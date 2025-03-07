import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/model.dart';
import 'package:usercentrics_sdk/src/platform/usercentrics_platform.dart';

class MethodChannelUsercentrics extends UsercentricsPlatform {
  MethodChannelUsercentrics(
      {this.initializeBridge = const MethodChannelInitialize(),
      this.isReadyBridge = const MethodChannelIsReady(),
      this.getConsentsBridge = const MethodChannelGetConsents(),
      this.getControllerIdBridge = const MethodChannelGetControllerId(),
      this.restoreUserSessionBridge = const MethodChannelRestoreUserSession(),
      this.showFirstLayerBridge = const MethodChannelShowFirstLayer(),
      this.showSecondLayerBridge = const MethodChannelShowSecondLayer(),
      this.getCMPDataBridge = const MethodChannelGetCMPData(),
      this.acceptAllBridge = const MethodChannelAcceptAll(),
      this.acceptAllForTCFBridge = const MethodChannelAcceptAllForTCF(),
      this.changeLanguageBridge = const MethodChannelChangeLanguage(),
      this.denyAllBridge = const MethodChannelDenyAll(),
      this.denyAllForTCFBridge = const MethodChannelDenyAllForTCF(),
      this.getTCFDataBridge = const MethodChannelGetTCFData(),
      this.getUserSessionDataBridge = const MethodChannelGetUserSessionData(),
      this.getUSPDataBridge = const MethodChannelGetUSPData(),
      this.saveDecisionsBridge = const MethodChannelSaveDecisions(),
      this.saveDecisionsForTCFBridge = const MethodChannelSaveDecisionsForTCF(),
      this.saveOptOutForCCPABridge = const MethodChannelSaveOptOutForCCPA(),
      this.setCMPIdBridge = const MethodChannelSetCMPId(),
      this.getABTestingVariantBridge = const MethodChannelGetABTestingVariant(),
      this.setABTestingVariantBridge = const MethodChannelSetABTestingVariant(),
      this.trackBridge = const MethodChannelTrack(),
      this.getAdditionalConsentModeData =
          const MethodChannelGetAdditionalConsentModeData(),
      this.clearUserSessionBridge = const MethodChannelClearUserSession()});

  static const MethodChannel _channel = MethodChannel('usercentrics');

  final InitializeBridge initializeBridge;
  final IsReadyBridge isReadyBridge;
  final GetConsentsBridge getConsentsBridge;
  final GetControllerIdBridge getControllerIdBridge;
  final RestoreUserSessionBridge restoreUserSessionBridge;
  final ShowFirstLayerBridge showFirstLayerBridge;
  final ShowSecondLayerBridge showSecondLayerBridge;
  final GetCMPDataBridge getCMPDataBridge;
  final AcceptAllBridge acceptAllBridge;
  final AcceptAllForTCFBridge acceptAllForTCFBridge;
  final ChangeLanguageBridge changeLanguageBridge;
  final DenyAllBridge denyAllBridge;
  final DenyAllForTCFBridge denyAllForTCFBridge;
  final GetTCFDataBridge getTCFDataBridge;
  final GetUserSessionDataBridge getUserSessionDataBridge;
  final GetUSPDataBridge getUSPDataBridge;
  final SaveDecisionsBridge saveDecisionsBridge;
  final SaveDecisionsForTCFBridge saveDecisionsForTCFBridge;
  final SaveOptOutForCCPABridge saveOptOutForCCPABridge;
  final SetCMPIdBridge setCMPIdBridge;
  final GetABTestingVariantBridge getABTestingVariantBridge;
  final SetABTestingVariantBridge setABTestingVariantBridge;
  final TrackBridge trackBridge;
  final GetAdditionalConsentModeDataBridge getAdditionalConsentModeData;
  final ClearUserSessionBridge clearUserSessionBridge;

  @visibleForTesting
  Completer<Object?>? isReadyCompleter;

  @override
  void initialize({
    String settingsId = "",
    String ruleSetId = "",
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
    NetworkMode? networkMode,
    bool? consentMediation,
    int? initTimeoutMillis,
  }) async {
    final ongoingInit = isReadyCompleter;

    isReadyCompleter = Completer();

    if (ongoingInit != null) {
      await ongoingInit.future;
    }

    try {
      initializeBridge.invoke(
          channel: _channel,
          settingsId: settingsId,
          ruleSetId: ruleSetId,
          defaultLanguage: defaultLanguage,
          loggerLevel: loggerLevel,
          timeoutMillis: timeoutMillis,
          version: version,
          networkMode: networkMode,
          consentMediation: consentMediation,
          initTimeoutMillis: initTimeoutMillis);

      await status.then((value) => isReadyCompleter?.complete(null));
    } catch (error, stackTrace) {
      isReadyCompleter?.completeError(
        FailedInitializationException(error.toString(), stackTrace),
      );
    }
  }

  @override
  Future<UsercentricsReadyStatus> get status =>
      isReadyBridge.invoke(channel: _channel);

  @override
  Future<UsercentricsConsentUserResponse?> showFirstLayer({
    BannerSettings? settings,
  }) async {
    await _ensureIsReady();
    return await showFirstLayerBridge.invoke(
      channel: _channel,
      settings: settings,
    );
  }

  @override
  Future<UsercentricsConsentUserResponse?> showSecondLayer({
    BannerSettings? settings,
  }) async {
    await _ensureIsReady();
    return await showSecondLayerBridge.invoke(
      channel: _channel,
      settings: settings,
    );
  }

  @override
  Future<List<UsercentricsServiceConsent>> get consents async {
    await _ensureIsReady();
    return await getConsentsBridge.invoke(channel: _channel);
  }

  @override
  Future<String> get controllerId async {
    await _ensureIsReady();
    return await getControllerIdBridge.invoke(channel: _channel);
  }

  @override
  Future<UsercentricsReadyStatus> restoreUserSession({
    required String controllerId,
  }) async {
    await _ensureIsReady();
    return await restoreUserSessionBridge.invoke(
        channel: _channel, controllerId: controllerId);
  }

  @override
  Future<UsercentricsCMPData> get cmpData async {
    await _ensureIsReady();
    return await getCMPDataBridge.invoke(channel: _channel);
  }

  @override
  Future<List<UsercentricsServiceConsent>> acceptAll({
    required UsercentricsConsentType consentType,
  }) async {
    await _ensureIsReady();
    return await acceptAllBridge.invoke(
      channel: _channel,
      consentType: consentType,
    );
  }

  @override
  Future<List<UsercentricsServiceConsent>> acceptAllForTCF({
    required UsercentricsConsentType consentType,
    required TCFDecisionUILayer fromLayer,
  }) async {
    await _ensureIsReady();
    return await acceptAllForTCFBridge.invoke(
      channel: _channel,
      fromLayer: fromLayer,
      consentType: consentType,
    );
  }

  @override
  Future<CCPAData> get ccpaData async {
    await _ensureIsReady();
    return await getUSPDataBridge.invoke(channel: _channel);
  }

  @override
  Future<void> changeLanguage({
    required String language,
  }) async {
    await _ensureIsReady();
    return await changeLanguageBridge.invoke(
      channel: _channel,
      language: language,
    );
  }

  @override
  Future<List<UsercentricsServiceConsent>> denyAll({
    required UsercentricsConsentType consentType,
  }) async {
    await _ensureIsReady();
    return await denyAllBridge.invoke(
      channel: _channel,
      consentType: consentType,
    );
  }

  @override
  Future<List<UsercentricsServiceConsent>> denyAllForTCF({
    required UsercentricsConsentType consentType,
    required TCFDecisionUILayer fromLayer,
  }) async {
    await _ensureIsReady();
    return await denyAllForTCFBridge.invoke(
      channel: _channel,
      fromLayer: fromLayer,
      consentType: consentType,
    );
  }

  @override
  Future<List<UsercentricsServiceConsent>> saveDecisions({
    required List<UserDecision> decisions,
    required UsercentricsConsentType consentType,
  }) async {
    await _ensureIsReady();
    return await saveDecisionsBridge.invoke(
      channel: _channel,
      decisions: decisions,
      consentType: consentType,
    );
  }

  @override
  Future<List<UsercentricsServiceConsent>> saveDecisionsForTCF({
    required TCFUserDecisions tcfDecisions,
    required TCFDecisionUILayer fromLayer,
    required List<UserDecision> serviceDecisions,
    required UsercentricsConsentType consentType,
  }) async {
    await _ensureIsReady();
    return await saveDecisionsForTCFBridge.invoke(
      channel: _channel,
      tcfDecisions: tcfDecisions,
      fromLayer: fromLayer,
      serviceDecisions: serviceDecisions,
      consentType: consentType,
    );
  }

  @override
  Future<List<UsercentricsServiceConsent>> saveOptOutForCCPA({
    required bool isOptedOut,
    required UsercentricsConsentType consentType,
  }) async {
    await _ensureIsReady();
    return await saveOptOutForCCPABridge.invoke(
      channel: _channel,
      isOptedOut: isOptedOut,
      consentType: consentType,
    );
  }

  @override
  Future<void> setCmpIdForTCF({
    required int id,
  }) async {
    await _ensureIsReady();
    return await setCMPIdBridge.invoke(channel: _channel, id: id);
  }

  @override
  Future<TCFData> get tcfData async {
    await _ensureIsReady();
    return await getTCFDataBridge.invoke(channel: _channel);
  }

  @override
  Future<String> get userSessionData async {
    await _ensureIsReady();
    return await getUserSessionDataBridge.invoke(channel: _channel);
  }

  @override
  Future<String?> get aBTestingVariant async {
    await _ensureIsReady();
    return await getABTestingVariantBridge.invoke(channel: _channel);
  }

  @override
  Future<void> setABTestingVariant({
    required String variant,
  }) async {
    await _ensureIsReady();
    return await setABTestingVariantBridge.invoke(
        channel: _channel, variant: variant);
  }

  Future<void> _ensureIsReady() async {
    final completer = isReadyCompleter;
    if (completer == null) {
      throw const NotInitializedException();
    }
    final error = await completer.future;
    if (error != null) {
      // Remove PlatformException wrapper
      final details = error is PlatformException ? error.message : null;
      throw FailedInitializationException(details ?? error.toString());
    }
  }

  @override
  Future<void> track({required UsercentricsAnalyticsEventType event}) async {
    await _ensureIsReady();
    return await trackBridge.invoke(channel: _channel, event: event);
  }

  @override
  Future<AdditionalConsentModeData> get additionalConsentModeData async {
    await _ensureIsReady();
    return await getAdditionalConsentModeData.invoke(channel: _channel);
  }

  @override
  Future<UsercentricsReadyStatus> clearUserSession() async {
    await _ensureIsReady();
    return await clearUserSessionBridge.invoke(channel: _channel);
  }
}
