import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/src/model/model.dart';
import 'package:usercentrics_sdk/src/platform/platform.dart';

class Usercentrics {
  Usercentrics._();

  // Cached & lazily loaded instance of [UsercentricsPlatform].
  // Avoids a [MethodChannelUsercentrics] being initialized until the user
  // starts using Usercentrics.
  /// The property is visible for testing to allow tests to set a mock
  /// instance directly as a static property since the class is not initialized.
  @visibleForTesting
  static UsercentricsPlatform? delegatePackingProperty;

  static UsercentricsPlatform get _delegate {
    return delegatePackingProperty ??= UsercentricsPlatform.instance;
  }

  static void initialize({
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  }) =>
      _delegate.initialize(
        settingsId: settingsId,
        defaultLanguage: defaultLanguage,
        loggerLevel: loggerLevel,
        timeoutMillis: timeoutMillis,
        version: version,
      );

  static void reset() => _delegate.reset();

  static Future<UsercentricsReadyStatus> get status => _delegate.status;

  static Future<UsercentricsConsentUserResponse?> showCMP({
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  }) =>
      _delegate.showCMP(
        showCloseButton: showCloseButton,
        customLogo: customLogo,
        customFont: customFont,
      );

  static Future<List<UsercentricsServiceConsent>> getConsents() =>
      _delegate.getConsents();

  static Future<String> getControllerId() => _delegate.getControllerId();

  static Future<String> getTCString() => _delegate.getTCString();

  static Future<UsercentricsReadyStatus> restoreUserSession({
    required String controllerId,
  }) =>
      _delegate.restoreUserSession(controllerId: controllerId);
}
