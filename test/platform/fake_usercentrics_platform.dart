import 'package:usercentrics_sdk/src/model/cmp_data.dart';
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
    this.consentsAnswer,
    this.controllerIdAnswer,
    this.tcStringAnswer,
    this.restoreUserSessionAnswer,
    this.showCMPAnswer,
    this.statusAnswer,
    this.cmpDataAnswer,
  });

  final List<UsercentricsServiceConsent>? consentsAnswer;
  var consentsCount = 0;

  @override
  Future<List<UsercentricsServiceConsent>> get consents() {
    consentsCount++;
    return Future.value(consentsAnswer!);
  }

  final String? controllerIdAnswer;
  var controllerIdCount = 0;

  @override
  Future<String> get controllerId {
    controllerIdCount++;
    return Future.value(controllerIdAnswer!);
  }

  final String? tcStringAnswer;
  var tcStringCount = 0;

  @override
  Future<String> get tcString {
    tcStringCount++;
    return Future.value(tcStringAnswer!);
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

  final UsercentricsCMPData? cmpDataAnswer;
  var cmpDataCount = 0;

  @override
  Future<UsercentricsCMPData> get cmpData {
    cmpDataCount++;
    return Future.value(cmpDataAnswer!);
  }
}
