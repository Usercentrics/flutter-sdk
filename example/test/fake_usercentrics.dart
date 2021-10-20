import 'package:usercentrics_sdk/all.dart';

// You can use your own Usercentrics implementation to test the integration.
// Optionally, you can use a mock library such as `mockito`.
// Feel free to take a look to our own test implementation:
// test/platform/fake_usercentrics_platform.dart
class FakeUsercentrics extends UsercentricsPlatform {
  var initializeCount = 0;

  @override
  void initialize({
    required String settingsId,
    String? defaultLanguage,
    UsercentricsLoggerLevel? loggerLevel,
    int? timeoutMillis,
    String? version,
  }) {
    initializeCount++;
  }

  @override
  void reset() {}

  @override
  Future<List<UsercentricsServiceConsent>> getConsents() {
    throw UnimplementedError();
  }

  @override
  Future<String> getControllerId() {
    throw UnimplementedError();
  }

  @override
  Future<String> getTCString() {
    throw UnimplementedError();
  }

  @override
  Future<UsercentricsReadyStatus> restoreUserSession(
      {required String controllerId}) {
    throw UnimplementedError();
  }

  @override
  Future<UsercentricsConsentUserResponse?> showCMP(
      {bool? showCloseButton,
      UsercentricsImage? customLogo,
      UsercentricsFont? customFont}) {
    throw UnimplementedError();
  }

  @override
  Future<UsercentricsReadyStatus> get status => throw UnimplementedError();
}
