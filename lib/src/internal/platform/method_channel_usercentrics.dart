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
    this.getTCStringBridge = const MethodChannelGetTCString(),
    this.resetBridge = const MethodChannelReset(),
    this.restoreUserSessionBridge = const MethodChannelRestoreUserSession(),
    this.showCMPBridge = const MethodChannelShowCMP(),
    this.getCMPDataBridge = const MethodChannelGetCMPData(),
  });

  static const MethodChannel _channel = MethodChannel('usercentrics');

  final InitializeBridge initializeBridge;
  final IsReadyBridge isReadyBridge;
  final GetConsentsBridge getConsentsBridge;
  final GetControllerIdBridge getControllerIdBridge;
  final GetTCStringBridge getTCStringBridge;
  final ResetBridge resetBridge;
  final RestoreUserSessionBridge restoreUserSessionBridge;
  final ShowCMPBridge showCMPBridge;
  final GetCMPDataBridge getCMPDataBridge;

  @visibleForTesting
  Completer? isReadyCompleter;

  @override
  void initialize({
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  }) async {
    _ensureNotInitialized();
    isReadyCompleter = Completer();
    initializeBridge.invoke(
      channel: _channel,
      settingsId: settingsId,
      defaultLanguage: defaultLanguage,
      loggerLevel: loggerLevel,
      timeoutMillis: timeoutMillis,
      version: version,
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
  Future<UsercentricsConsentUserResponse?> showCMP({
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  }) async {
    await _ensureIsReady();
    return await showCMPBridge.invoke(
      channel: _channel,
      showCloseButton: showCloseButton,
      customLogo: customLogo,
      customFont: customFont,
    );
  }

  @override
  Future<List<UsercentricsServiceConsent>> getConsents() async {
    await _ensureIsReady();
    return await getConsentsBridge.invoke(channel: _channel);
  }

  @override
  Future<String> getControllerId() async {
    await _ensureIsReady();
    return await getControllerIdBridge.invoke(channel: _channel);
  }

  @override
  Future<String> getTCString() async {
    await _ensureIsReady();
    return await getTCStringBridge.invoke(channel: _channel);
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

  void _ensureNotInitialized() {
    if (isReadyCompleter != null) {
      throw const AlreadyInitializedException();
    }
  }

  Future<void> _ensureIsReady() async {
    final completer = isReadyCompleter;
    if (completer == null) {
      throw const NotInitializedException();
    }
    await completer.future;
  }
}

class AlreadyInitializedException implements Exception {
  static const message =
      "Usercentrics was already initialized, please ensure that you invoke 'Usercentrics.initialize()' only once";

  const AlreadyInitializedException();

  @override
  String toString() => "$AlreadyInitializedException(message: $message)";
}

class NotInitializedException implements Exception {
  static const message =
      "Usercentrics was not initialized, please ensure that you invoke 'Usercentrics.initialize()' before you start using it";

  const NotInitializedException();

  @override
  String toString() => "$NotInitializedException(message: $message)";
}
