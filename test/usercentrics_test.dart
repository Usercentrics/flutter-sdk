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
        shouldCollectConsent: true,
        consents: [],
        geolocationRuleset: GeolocationRuleset(
            activeSettingsId: "settingsId", bannerRequiredAtLocation: true),
        location: UsercentricsLocation(
            countryCode: "PT",
            regionCode: "PT11",
            isInEU: true,
            isInUS: false,
            isInCalifornia: false));

    final delegate = FakeUsercentricsPlatform(statusAnswer: expectedStatus);
    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.status;

    expect(delegate.statusCount, 1);
    expect(result, expectedStatus);
  });

  test('showFirstLayer', () async {
    const expectedResponse = UsercentricsConsentUserResponse(
      controllerId: "abc",
      userInteraction: UsercentricsUserInteraction.acceptAll,
      consents: [],
    );
    final delegate =
        FakeUsercentricsPlatform(showFirstLayerAnswer: expectedResponse);
    Usercentrics.delegatePackingProperty = delegate;

    const firstLayerSettings = FirstLayerStyleSettings(
        layout: UsercentricsLayout.sheet, cornerRadius: 100);
    const secondLayerSettings = SecondLayerStyleSettings(showCloseButton: true);
    const logo = BannerImage(assetPath: "asset/logo.png");
    const font = BannerFont(
      regularFontAssetPath: "asset/font-regular.ttf",
      boldFontAssetPath: "asset/font-bold.ttf",
      fontSize: 20,
    );
    const generalStyleSettings = GeneralStyleSettings(font: font, logo: logo);
    const variantName = "variantA";
    const bannerSettings = BannerSettings(
      firstLayer: firstLayerSettings,
      secondLayer: secondLayerSettings,
      general: generalStyleSettings,
      variantName: variantName,
    );

    final result = await Usercentrics.showFirstLayer(
      settings: bannerSettings,
    );

    expect(delegate.showFirstLayerCount, 1);
    expect(delegate.showFirstLayerSettingsArgument, bannerSettings);
    expect(result, expectedResponse);
  });

  test('showSecondLayer', () async {
    const expectedResponse = UsercentricsConsentUserResponse(
      controllerId: "abc",
      userInteraction: UsercentricsUserInteraction.acceptAll,
      consents: [],
    );
    final delegate =
        FakeUsercentricsPlatform(showSecondLayerAnswer: expectedResponse);
    Usercentrics.delegatePackingProperty = delegate;

    const secondLayerSettings = SecondLayerStyleSettings(showCloseButton: true);

    const logo = BannerImage(assetPath: "asset/logo.png");
    const font = BannerFont(
      regularFontAssetPath: "asset/font-regular.ttf",
      boldFontAssetPath: "asset/font-bold.ttf",
      fontSize: 20,
    );
    const generalStyleSettings = GeneralStyleSettings(font: font, logo: logo);
    const variantName = "variantA";
    const bannerSettings = BannerSettings(
      secondLayer: secondLayerSettings,
      general: generalStyleSettings,
      variantName: variantName,
    );

    final result = await Usercentrics.showSecondLayer(
      settings: bannerSettings,
    );

    expect(delegate.showSecondLayerCount, 1);
    expect(delegate.showSecondLayerSettingsArgument, bannerSettings);
    expect(result, expectedResponse);
  });

  test('consents', () async {
    const expectedConsents = <UsercentricsServiceConsent>[];
    final delegate = FakeUsercentricsPlatform(consentsAnswer: expectedConsents);
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

  test('restoreUserSession', () async {
    const expectedStatus = UsercentricsReadyStatus(
        shouldCollectConsent: true,
        consents: [],
        geolocationRuleset: GeolocationRuleset(
            activeSettingsId: "settingsId", bannerRequiredAtLocation: true),
        location: UsercentricsLocation(
            countryCode: "PT",
            regionCode: "PT11",
            isInEU: true,
            isInUS: false,
            isInCalifornia: false));

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

  test('track', () async {
    final delegate = FakeUsercentricsPlatform();
    Usercentrics.delegatePackingProperty = delegate;

    await Usercentrics.track(
        event: UsercentricsAnalyticsEventType.acceptAllFirstLayer);

    expect(delegate.trackCalls.length, 1);
    expect(delegate.trackCalls[0],
        UsercentricsAnalyticsEventType.acceptAllFirstLayer);
  });

  test('clearUserSession', () async {
    const expectedStatus = UsercentricsReadyStatus(
        shouldCollectConsent: true,
        consents: [],
        geolocationRuleset: GeolocationRuleset(
            activeSettingsId: "settingsId", bannerRequiredAtLocation: true),
        location: UsercentricsLocation(
            countryCode: "PT",
            regionCode: "PT11",
            isInEU: true,
            isInUS: false,
            isInCalifornia: false));

    final delegate =
    FakeUsercentricsPlatform(clearUserSessionAnswer: expectedStatus);

    Usercentrics.delegatePackingProperty = delegate;

    final result = await Usercentrics.clearUserSession();

    expect(delegate.clearUserSessionCount, 1);
    expect(result, expectedStatus);
  });
}
