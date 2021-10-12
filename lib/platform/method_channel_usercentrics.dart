import 'dart:async';

import 'package:flutter/services.dart';
import 'package:usercentrics_sdk/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/model/model.dart';
import 'package:usercentrics_sdk/platform/usercentrics_platform.dart';

class MethodChannelUsercentrics extends UsercentricsPlatform {
  static const MethodChannel _channel = MethodChannel('usercentrics');

  Completer? _isReadyCompleter;

  @override
  Future<void> initialize({
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  }) async {
    _ensureNotInitialized();
    _isReadyCompleter = Completer();
    InitializeBridge.invoke(
      channel: _channel,
      settingsId: settingsId,
      defaultLanguage: defaultLanguage,
      loggerLevel: loggerLevel,
      timeoutMillis: timeoutMillis,
      version: version,
    );
    status.whenComplete(() => _isReadyCompleter?.complete());
  }

  @override
  void reset() {
    _isReadyCompleter = null;
    ResetBridge.invoke(channel: _channel);
  }

  @override
  Future<UsercentricsReadyStatus> get status =>
      IsReadyBridge.invoke(channel: _channel);

  @override
  Future<UsercentricsConsentUserResponse?> showCMP({
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  }) async {
    await _ensureIsReady();
    return await ShowCMPBridge.invoke(
      channel: _channel,
      showCloseButton: showCloseButton,
      customLogo: customLogo,
      customFont: customFont,
    );
  }

  void _ensureNotInitialized() {
    if (_isReadyCompleter != null) {
      throw const AlreadyInitializedException();
    }
  }

  Future<void> _ensureIsReady() async {
    final completer = _isReadyCompleter;
    if (completer == null) {
      throw const NotInitializedException();
    }
    await completer.future;
  }

  @override
  Future<List<UsercentricsServiceConsent>> getConsents() async {
    await _ensureIsReady();
    return await GetConsentsBridge.invoke(channel: _channel);
  }

  @override
  Future<String> getControllerId() async {
    await _ensureIsReady();
    return await GetControllerIdBridge.invoke(channel: _channel);
  }

  @override
  Future<String> getTCString() async {
    await _ensureIsReady();
    return await GetTCStringBridge.invoke(channel: _channel);
  }

  @override
  Future<UsercentricsReadyStatus> restoreUserSession({required String controllerId}) async {
    await _ensureIsReady();
    return await RestoreUserSessionBridge.invoke(channel: _channel, controllerId: controllerId);
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
