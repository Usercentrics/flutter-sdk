import 'package:test/test.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

import 'internal/bridge/get_cmp_data_bridge_test.dart';
import 'platform/fake_usercentrics_platform.dart';

void main() {
  tearDown(() async {
    Usercentrics.delegatePackingProperty = null;
  });

  test('initialize', () {
    final delegate = FakeUsercentricsPlatform();
    Usercentrics.delegatePackingProperty = delegate;

    const settingsId = "ABC";
    const defaultLanguage = "en";
    const loggerLevel = UsercentricsLoggerLevel.debug;
    const timeoutMillis = 10000;
    const version = "1.1.1";

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

  test('reset', () {
    final delegate = FakeUsercentricsPlatform();
    Usercentrics.delegatePackingProperty = delegate;

    Usercentrics.reset();

    expect(delegate.resetCount, 1);
  });

  test('status', () async {
    const expectedStatus = UsercentricsReadyStatus(
      shouldShowCMP: true,
      consents: [],
    );
    final delegate = FakeUsercentricsPlatform(statusAnswer: expectedStatus);
    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.status;

    expect(delegate.statusCount, 1);
    expect(result, expectedStatus);
  });

  test('showCMP', () async {
    const expectedResponse = UsercentricsConsentUserResponse(
      controllerId: "abc",
      userInteraction: UsercentricsUserInteraction.acceptAll,
      consents: [],
    );
    final delegate = FakeUsercentricsPlatform(showCMPAnswer: expectedResponse);
    Usercentrics.delegatePackingProperty = delegate;

    const showCloseButton = true;
    const customLogo = UsercentricsImage(assetPath: "asset/logo.png");
    const customFont = UsercentricsFont(
      fontAssetPath: "asset/font.ttf",
      fontSize: 20,
    );

    final result = await Usercentrics.showCMP(
      showCloseButton: showCloseButton,
      customLogo: customLogo,
      customFont: customFont,
    );

    expect(delegate.showCMPCount, 1);
    expect(delegate.showCMPcustomFontArgument, customFont);
    expect(delegate.showCMPcustomLogoArgument, customLogo);
    expect(delegate.showCMPshowCloseButtonArgument, showCloseButton);
    expect(result, expectedResponse);
  });

  test('consents', () async {
    const expectedConsents = <UsercentricsServiceConsent>[];
    final delegate =
        FakeUsercentricsPlatform(consentsAnswer: expectedConsents);
    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.consents;

    expect(delegate.consentsCount, 1);
    expect(result, expectedConsents);
  });

  test('controllerId', () async {
    const expectedControllerId = "ABC";
    final delegate =
        FakeUsercentricsPlatform(controllerIdAnswer: expectedControllerId);
    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.controllerId;

    expect(delegate.controllerIdCount, 1);
    expect(result, expectedControllerId);
  });

  test('tcString', () async {
    const expectedTCSting = "ABC";
    final delegate =
        FakeUsercentricsPlatform(tcStringAnswer: expectedTCSting);
    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.tcString;

    expect(delegate.tcStringCount, 1);
    expect(result, expectedTCSting);
  });

  test('restoreUserSession', () async {
    const expectedStatus = UsercentricsReadyStatus(
      shouldShowCMP: true,
      consents: [],
    );
    final delegate =
        FakeUsercentricsPlatform(restoreUserSessionAnswer: expectedStatus);
    Usercentrics.delegatePackingProperty = delegate;

    const controllerId = "ABC";

    final result =
        await Usercentrics.restoreUserSession(controllerId: controllerId);

    expect(delegate.restoreUserSessionCount, 1);
    expect(delegate.restoreUserSessionControllerIdArgument, controllerId);
    expect(result, expectedStatus);
  });

  test('cmpData', () async {
    final delegate = FakeUsercentricsPlatform(cmpDataAnswer: mockCMPData);
    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.cmpData;

    expect(delegate.cmpDataCount, 1);
    expect(result, mockCMPData);
  });
}
