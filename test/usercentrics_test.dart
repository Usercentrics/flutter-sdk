import 'package:test/test.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

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

  test('getConsents', () async {
    const expectedConsents = <UsercentricsServiceConsent>[];
    final delegate =
        FakeUsercentricsPlatform(getConsentsAnswer: expectedConsents);
    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.getConsents();

    expect(delegate.getConsentsCount, 1);
    expect(result, expectedConsents);
  });

  test('getControllerId', () async {
    const expectedControllerId = "ABC";
    final delegate =
        FakeUsercentricsPlatform(getControllerIdAnswer: expectedControllerId);
    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.getControllerId();

    expect(delegate.getControllerIdCount, 1);
    expect(result, expectedControllerId);
  });

  test('getTCString', () async {
    const expectedTCSting = "ABC";
    final delegate =
        FakeUsercentricsPlatform(getTCStringAnswer: expectedTCSting);
    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.getTCString();

    expect(delegate.getTCStringCount, 1);
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
}
