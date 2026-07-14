import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/banner_init_customization.dart';
import 'package:usercentrics_sdk/src/model/logger_level.dart';
import 'package:usercentrics_sdk/src/model/network_mode.dart';

void main() {
  // Data from the debugger
  const mockResponse = null;
  const expectedArguments = {
    "settingsId": "Yi9N3aXia",
    "ruleSetId": "XXxXXXYYyyyYY",
    "defaultLanguage": "en",
    "loggerLevel": "DEBUG",
    "version": "1.0.0",
    "timeoutMillis": 20000,
    "networkMode": "EU",
    'consentMediation': true,
    "initTimeoutMillis": 25000,
    "bannerCustomization": {
      'paddingTop': 16,
      'paddingBottom': null,
      'paddingStart': null,
      'paddingEnd': null,
      'lineSpacingMultiplier': null,
      'titleFontSize': null,
      'bodyFontSize': null,
      'linkFontSize': null,
      'titleFontBold': null,
      'headerPaddingTop': null,
      'headerPaddingSides': null,
      'headerPaddingBetweenElements': null,
      'buttonBorderColor': '#004dcf',
      'buttonBorderWidth': null,
      'purposeListStyle': 'FLAT',
      'stickyHeader': null,
      'hideLanguageSwitcher': null,
      'buttonHeightDp': null,
      'buttonHorizontalPaddingDp': null,
      'buttonSpacingDp': null,
      'linkUnderline': null,
      'showSecondLayerCloseButton': null,
      'tabFontSize': null,
      'tabActiveColor': null,
      'denyAllButtonBackground': null,
      'acceptAllButtonBackground': null,
      'linkColor': null,
    },
  };
  const mockSettingsId = 'Yi9N3aXia';
  const mockRuleSetId = 'XXxXXXYYyyyYY';
  const mockLoggerLevel = UsercentricsLoggerLevel.debug;
  const mockVersion = "1.0.0";
  const mockDefaultLanguage = "en";
  const mockTimeoutMillis = 20000;
  const mockInitTimeoutMillis = 25000;
  const mockNetworkMode = NetworkMode.eu;
  const mockConsentMediation = true;
  // ignore: deprecated_member_use
  const mockBannerCustomization = BannerInitCustomization(
    paddingTop: 16,
    buttonBorderColor: '#004dcf',
    purposeListStyle: PurposeListStyle.flat,
  );

  const MethodChannel channel = MethodChannel('usercentrics');
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('invoke', () {
    int callCounter = 0;
    MethodCall? receivedCall;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      callCounter++;
      receivedCall = methodCall;
      return mockResponse;
    });
    const instance = MethodChannelInitialize();

    instance.invoke(
        channel: channel,
        settingsId: mockSettingsId,
        ruleSetId: mockRuleSetId,
        loggerLevel: mockLoggerLevel,
        version: mockVersion,
        defaultLanguage: mockDefaultLanguage,
        timeoutMillis: mockTimeoutMillis,
        networkMode: mockNetworkMode,
        consentMediation: mockConsentMediation,
        initTimeoutMillis: mockInitTimeoutMillis,
        // ignore: deprecated_member_use
        bannerCustomization: mockBannerCustomization);

    expect(callCounter, 1);
    expect(receivedCall?.method, 'initialize');
    expect(receivedCall?.arguments, expectedArguments);
  });
}
