import 'package:usercentrics_sdk/src/model/custom_font.dart';
import 'package:usercentrics_sdk/src/model/custom_image.dart';
import 'package:usercentrics_sdk/src/model/logger_level.dart';
import 'package:usercentrics_sdk/src/model/ready_status.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';
import 'package:usercentrics_sdk/src/model/user_response.dart';
import 'package:usercentrics_sdk/src/platform/usercentrics_platform.dart';

// Mock UsercentricsPlatform implementation
class FakeUsercentricsPlatform extends UsercentricsPlatform {
  FakeUsercentricsPlatform({
    this.getConsentsAnswer,
    this.getControllerIdAnswer,
    this.getTCStringAnswer,
    this.restoreUserSessionAnswer,
    this.showCMPAnswer,
    this.statusAnswer,
  });

  final List<UsercentricsServiceConsent>? getConsentsAnswer;
  var getConsentsCount = 0;

  @override
  Future<List<UsercentricsServiceConsent>> getConsents() {
    getConsentsCount++;
    return Future.value(getConsentsAnswer!);
  }

  final String? getControllerIdAnswer;
  var getControllerIdCount = 0;

  @override
  Future<String> getControllerId() {
    getControllerIdCount++;
    return Future.value(getControllerIdAnswer!);
  }

  final String? getTCStringAnswer;
  var getTCStringCount = 0;

  @override
  Future<String> getTCString() {
    getTCStringCount++;
    return Future.value(getTCStringAnswer!);
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
}
