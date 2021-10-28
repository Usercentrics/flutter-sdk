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

  Future<UsercentricsConsentUserResponse?> showCMP({
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  });

  Future<List<UsercentricsServiceConsent>> getConsents();

  Future<String> getControllerId();

  Future<String> getTCString();

  Future<UsercentricsReadyStatus> restoreUserSession(
      {required String controllerId});

  Future<UsercentricsCMPData> get cmpData;
}
