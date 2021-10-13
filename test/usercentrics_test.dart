import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/model/logger_level.dart';
import 'package:usercentrics_sdk/usercentrics.dart';

import 'platform/fake_usercentrics_platform.dart';

void main() {
  tearDown(() async {
    Usercentrics.delegatePackingProperty = null;
  });

  test('creation', () {
    final delegate = FakeUsercentricsPlatform();
    Usercentrics.delegatePackingProperty = delegate;
    final settingsId = "ABC";
    final defaultLanguage = "en";
    final loggerLevel = UsercentricsLoggerLevel.debug;
    final timeoutMillis = 10000;
    final version = "1.1.1";

    Usercentrics.initialize(
      settingsId: settingsId,
      defaultLanguage: defaultLanguage,
      loggerLevel: loggerLevel,
      timeoutMillis: timeoutMillis,
      version: version,
    );

    expect(delegate.initializeCount, 1);
    expect(delegate.initializeSettingsIdArgument, settingsId);
    expect(delegate.initializeDefaultLanguageArgument, defaultLanguage);
    expect(delegate.initializeLoggerLevelArgument, loggerLevel);
    expect(delegate.initializeTimeoutMillisArgument, timeoutMillis);
    expect(delegate.initializeVersionArgument, version);
  });
}

// const MethodChannel channel = MethodChannel('usercentrics');
//
// TestWidgetsFlutterBinding.ensureInitialized();
//
// setUp(() {
//   channel.setMockMethodCallHandler((MethodCall methodCall) async {
//     return '42';
//   });
// });
//
// tearDown(() {
//   channel.setMockMethodCallHandler(null);
// });
//
// test('getPlatformVersion', () async {
//   expect(await Usercentrics.platformVersion, '42');
// });
