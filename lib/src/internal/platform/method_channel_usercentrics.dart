import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/model.dart';
import 'package:usercentrics_sdk/src/platform/usercentrics_platform.dart';

class MethodChannelUsercentrics extends UsercentricsPlatform {
  MethodChannelUsercentrics({
    this.initializeBridge = const MethodChannelInitialize(),
    this.isReadyBridge = const MethodChannelIsReady(),
    this.getConsentsBridge = const MethodChannelGetConsents(),
    this.getControllerIdBridge = const MethodChannelGetControllerId(),
    this.resetBridge = const MethodChannelReset(),
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
  });

  static const MethodChannel _channel = MethodChannel('usercentrics');

  final InitializeBridge initializeBridge;
  final IsReadyBridge isReadyBridge;
  final GetConsentsBridge getConsentsBridge;
  final GetControllerIdBridge getControllerIdBridge;
  final ResetBridge resetBridge;
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

  @visibleForTesting
  Completer? isReadyCompleter;

  @override
  void initialize({
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
    NetworkMode? networkMode,
  }) async {
    final ongoingInit = isReadyCompleter;
    isReadyCompleter = Completer();
    if (ongoingInit != null) await ongoingInit.future;
    initializeBridge.invoke(
      channel: _channel,
      settingsId: settingsId,
      defaultLanguage: defaultLanguage,
      loggerLevel: loggerLevel,
      timeoutMillis: timeoutMillis,
      version: version,
      networkMode: networkMode,
    );
    status.whenComplete(() => isReadyCompleter?.complete());
  }

  @override
  void reset() {
    isReadyCompleter = null;
    resetBridge.invoke(channel: _channel);
  }

  @override
  Future<UsercentricsReadyStatus> get status =>
      isReadyBridge.invoke(channel: _channel);

  @override
  Future<UsercentricsConsentUserResponse?> showFirstLayer({
    required UsercentricsLayout layout,
    BannerImage? logo,
    BannerFont? font,
    LegalLinksSettings? links,
    FirstLayerStyleSettings? firstLayerSettings,
    SecondLayerStyleSettings? secondLayerSettings,
  }) async {
    await _ensureIsReady();
    return await showFirstLayerBridge.invoke(
      channel: _channel,
      layout: layout,
      logo: logo,
      font: font,
      links: links,
      firstLayerSettings: firstLayerSettings,
      secondLayerSettings: secondLayerSettings,
    );
  }

  @override
  Future<UsercentricsConsentUserResponse?> showSecondLayer({
    BannerImage? logo,
    BannerFont? font,
    LegalLinksSettings? links,
    SecondLayerStyleSettings? secondLayerSettings,
  }) async {
    await _ensureIsReady();
    return await showSecondLayerBridge.invoke(
      channel: _channel,
      logo: logo,
      font: font,
      links: links,
      secondLayerSettings: secondLayerSettings,
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
  // TODO: implement ccpaData
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
  // TODO: implement tcfData
  Future<TCFData> get tcfData async {
    await _ensureIsReady();
    return await getTCFDataBridge.invoke(channel: _channel);
  }

  @override
  // TODO: implement userSessionData
  Future<String> get userSessionData async {
    await _ensureIsReady();
    return await getUserSessionDataBridge.invoke(channel: _channel);
  }

  Future<void> _ensureIsReady() async {
    final completer = isReadyCompleter;
    if (completer == null) {
      throw const NotInitializedException();
    }
    await completer.future;
  }
}

class NotInitializedException implements Exception {
  static const message =
      "Usercentrics was not initialized, please ensure that you invoke 'Usercentrics.initialize()' before you start using it";

  const NotInitializedException();

  @override
  String toString() => "$NotInitializedException(message: $message)";
}
