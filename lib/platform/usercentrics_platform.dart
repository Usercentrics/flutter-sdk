import 'package:usercentrics_sdk/model/model.dart';
import 'package:usercentrics_sdk/platform/method_channel_usercentrics.dart';

abstract class UsercentricsPlatform {
  static late UsercentricsPlatform instance = MethodChannelUsercentrics();

  Future<void> initialize({
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

  Future<UsercentricsReadyStatus> restoreUserSession({required String controllerId});
}
