import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/src/model/model.dart';
import 'package:usercentrics_sdk/src/platform/platform.dart';

/// The the entry point class for Usercentrics SDK.
class Usercentrics {
  Usercentrics._();

  /// The property is visible for testing to allow tests to set a mock
  /// instance directly as a static property since the class is not initialized.
  /// Cached & lazily loaded instance of [UsercentricsPlatform].
  /// By default, it does not get initialized until the user starts using Usercentrics.
  @visibleForTesting
  static UsercentricsPlatform? delegatePackingProperty;

  static UsercentricsPlatform get _delegate {
    return delegatePackingProperty ??= UsercentricsPlatform.instance;
  }

  /// Initialize Usercentrics with the given arguments. Call this method only once in the whole life of the application. If you want to change the configuration and initialize again, please use the [reset] method before.
  /// - The [settingsId] is a Usercentrics generated ID, used to identify a unique CMP configuration.
  /// - The [defaultLanguage] sets the default language in the language selection hierarchy. E.g. "en", "de", "fr". The default value is empty.
  /// - The [loggerLevel] provides a set of logs in the standard output depending on the Level: [UsercentricsLoggerLevel.debug] (most detailed logs, includes every other level), [UsercentricsLoggerLevel.warning] (non-problematic operations) and [UsercentricsLoggerLevel.error] (relevant logs to any blocking problems). The default value is [UsercentricsLoggerLevel.none].
  /// - The [timeoutMillis] sets a timeout for network requests in milliseconds. The default value is 10000 milliseconds.
  /// - The [version] freezes the configuration version shown to your users, you may pass a specific version here. E.g. "3.0.4". The default value is "latest".
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

  /// {@template initialize}
  /// Reset Usercentrics to enable the [initialize] again.
  /// {@endtemplate}
  static void reset() => _delegate.reset();

  /// Get the [UsercentricsReadyStatus] to catch the consent status of the user.
  static Future<UsercentricsReadyStatus> get status => _delegate.status;

  /// Show the CMP with the UsercentricsUI to collect and manage consents.
  /// - The [showCloseButton] show/hide the close button at the top-right corner of the CMP. If you are opening the CMP from your App's settings. We always recommend to enable a close button, so that users can easily dismiss the CMP. By default, close button is hidden.
  /// - The [customLogo] sets an image as Logo to go at the top of your CMP. By default, it is null and that means that the CMP will use the logo defined at the Admin Interface.
  /// - The [customFont] sets the font to be used in the CMP. By default, it is null and that means that the CMP will use the font defined at the Admin Interface.
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

  /// Get the complete list of [UsercentricsServiceConsent] with the last status of the user.
  static Future<List<UsercentricsServiceConsent>> get consents =>
      _delegate.consents;

  /// Get a Usercentrics generated ID, used to identify a user's consent history.
  static Future<String> get controllerId => _delegate.controllerId;

  /// Get the IAB consent string.
  static Future<String> get tcString => _delegate.tcString;

  /// Restore a user session in another Usercentrics supported platform.
  /// - The [controllerId] is a Usercentrics generated ID, used to identify a user's consent history.
  static Future<UsercentricsReadyStatus> restoreUserSession({
    required String controllerId,
  }) =>
      _delegate.restoreUserSession(controllerId: controllerId);

  /// Get all the CMP Data.
  static Future<UsercentricsCMPData> get cmpData => _delegate.cmpData;
}
