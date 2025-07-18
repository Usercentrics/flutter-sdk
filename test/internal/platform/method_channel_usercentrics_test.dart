import 'dart:async';

import 'package:test/test.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

import '../bridge/fake_get_cmp_data_bridge.dart';
import '../bridge/fake_get_consents_bridge.dart';
import '../bridge/fake_get_controller_id_bridge.dart';
import '../bridge/fake_initialize_bridge.dart';
import '../bridge/fake_is_ready_bridge.dart';
import '../bridge/fake_restore_user_session_bridge.dart';
import '../bridge/fake_clear_user_session_bridge.dart';
import '../bridge/fake_show_first_layer_bridge.dart';
import '../bridge/fake_show_second_layer_bridge.dart';
import '../bridge/get_cmp_data_bridge_test.dart';

void main() {
  group('initialize', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.initializeBridge,
          const TypeMatcher<MethodChannelInitialize>());
    });

    test('success', () async {
      final initializeBridge = FakeInitializeBridge();
      final isReadyBridge = FakeIsReadyBridge(
        invokeAnswer: const UsercentricsReadyStatus(
            shouldCollectConsent: false,
            consents: [],
            geolocationRuleset: null,
            location: UsercentricsLocation(
                countryCode: "PT",
                regionCode: "PT11",
                isInEU: true,
                isInUS: false,
                isInCalifornia: false)),
      );
      final instance = MethodChannelUsercentrics(
        initializeBridge: initializeBridge,
        isReadyBridge: isReadyBridge,
      );

      const settingsId = "ABC";
      const ruleSetId = "QWER";
      const defaultLanguage = "en";
      const loggerLevel = UsercentricsLoggerLevel.debug;
      const timeoutMillis = 10000;
      const version = "1.1.1";
      const networkMode = NetworkMode.eu;
      const consentMediation = true;
      const initTimeoutMillis = 7000;

      instance.initialize(
          settingsId: settingsId,
          ruleSetId: ruleSetId,
          defaultLanguage: defaultLanguage,
          loggerLevel: loggerLevel,
          timeoutMillis: timeoutMillis,
          version: version,
          networkMode: networkMode,
          consentMediation: consentMediation,
          initTimeoutMillis: initTimeoutMillis);
      await instance.isReadyCompleter?.future;

      expect(initializeBridge.invokeCount, 1);
      expect(initializeBridge.invokeChannelArgument?.name, "usercentrics");
      expect(initializeBridge.invokeSettingsIdArgument, settingsId);
      expect(initializeBridge.invokeRuleSetIdArgument, ruleSetId);
      expect(initializeBridge.invokeDefaultLanguageArgument, defaultLanguage);
      expect(initializeBridge.invokeLoggerLevelArgument, loggerLevel);
      expect(initializeBridge.invokeTimeoutMillisArgument, timeoutMillis);
      expect(initializeBridge.invokeVersionArgument, version);
      expect(initializeBridge.invokeNetworkModeArgument, networkMode);
      expect(initializeBridge.invokeConsentMediationArgument, consentMediation);
      expect(
          initializeBridge.invokeInitTimeoutMillisArgument, initTimeoutMillis);

      expect(isReadyBridge.invokeCount, 1);
      expect(isReadyBridge.invokeChannelArgument?.name, "usercentrics");

      expect(instance.isReadyCompleter?.isCompleted, true);
    });

    test('expose stackTrace when initialization fails', () async {
      final initializeBridge = FakeInitializeBridge();

      final isReadyBridge = FakeIsReadyBridge(shouldFailInitialization: true);

      final instance = MethodChannelUsercentrics(
        initializeBridge: initializeBridge,
        isReadyBridge: isReadyBridge,
      );

      const settingsId = "ABC";
      const ruleSetId = "QWER";
      const defaultLanguage = "en";
      const loggerLevel = UsercentricsLoggerLevel.debug;
      const timeoutMillis = 10000;
      const version = "1.1.1";
      const networkMode = NetworkMode.eu;
      const consentMediation = true;
      const initTimeoutMillis = 7000;

      instance.initialize(
          settingsId: settingsId,
          ruleSetId: ruleSetId,
          defaultLanguage: defaultLanguage,
          loggerLevel: loggerLevel,
          timeoutMillis: timeoutMillis,
          version: version,
          networkMode: networkMode,
          consentMediation: consentMediation,
          initTimeoutMillis: initTimeoutMillis);

      await expectLater(
        instance.isReadyCompleter!.future,
        throwsA(isA<FailedInitializationException>()),
      );

      expect(initializeBridge.invokeCount, 1);
      expect(instance.isReadyCompleter?.isCompleted, true);

      expect(isReadyBridge.invokeCount, 1);
      expect(isReadyBridge.invokeChannelArgument?.name, "usercentrics");
    });
  });

  group('status', () {
    test('default', () async {
      final instance = MethodChannelUsercentrics();
      expect(instance.isReadyBridge, const TypeMatcher<MethodChannelIsReady>());
    });

    test('success', () async {
      const expectedStatus = UsercentricsReadyStatus(
          shouldCollectConsent: false,
          consents: [],
          geolocationRuleset: null,
          location: UsercentricsLocation(
              countryCode: "PT",
              regionCode: "PT11",
              isInEU: true,
              isInUS: false,
              isInCalifornia: false));
      final isReadyBridge = FakeIsReadyBridge(
        invokeAnswer: expectedStatus,
      );
      final instance = MethodChannelUsercentrics(
        isReadyBridge: isReadyBridge,
      );

      final result = await instance.status;

      expect(isReadyBridge.invokeCount, 1);
      expect(isReadyBridge.invokeChannelArgument?.name, "usercentrics");
      expect(result, expectedStatus);
    });
  });

  group('showFirstLayer', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.showFirstLayerBridge,
          const TypeMatcher<MethodChannelShowFirstLayer>());
    });

    test('success', () async {
      const expectedResponse = UsercentricsConsentUserResponse(
        controllerId: "ABC",
        userInteraction: UsercentricsUserInteraction.acceptAll,
        consents: [],
      );
      final showFirstLayerBridge = FakeShowFirstLayerBridge(
        invokeAnswer: expectedResponse,
      );
      final instance = MethodChannelUsercentrics(
        showFirstLayerBridge: showFirstLayerBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      // const layout = UsercentricsLayout.sheet;
      const firstLayerSettings = FirstLayerStyleSettings(cornerRadius: 100);
      const secondLayerSettings =
          SecondLayerStyleSettings(showCloseButton: true);
      const variant = "variantA";

      const logo = BannerImage(assetPath: "assetPath");
      const font = BannerFont(
        regularFontAssetPath: "fonts/Lora-Regular.ttf",
        boldFontAssetPath: "fonts/Lora-Bold.ttf",
        fontSize: 12,
      );
      const generalStyleSettings = GeneralStyleSettings(font: font, logo: logo);
      const bannerSettings = BannerSettings(
        firstLayer: firstLayerSettings,
        secondLayer: secondLayerSettings,
        general: generalStyleSettings,
        variantName: variant,
      );

      final response = await instance.showFirstLayer(
        settings: bannerSettings,
      );

      expect(showFirstLayerBridge.invokeCount, 1);
      expect(showFirstLayerBridge.invokeChannelArgument?.name, "usercentrics");
      expect(showFirstLayerBridge.invokeSettingsArgument, bannerSettings);
      expect(response, expectedResponse);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.showFirstLayer(),
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
  });

  group('showSecondLayer', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.showSecondLayerBridge,
          const TypeMatcher<MethodChannelShowSecondLayer>());
    });

    test('success', () async {
      const expectedResponse = UsercentricsConsentUserResponse(
        controllerId: "ABC",
        userInteraction: UsercentricsUserInteraction.acceptAll,
        consents: [],
      );
      final showSecondLayerBridge = FakeShowSecondLayerBridge(
        invokeAnswer: expectedResponse,
      );
      final instance = MethodChannelUsercentrics(
        showSecondLayerBridge: showSecondLayerBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      const secondLayerSettings =
          SecondLayerStyleSettings(showCloseButton: true);
      const logo = BannerImage(assetPath: "assetPath");
      const font = BannerFont(
        regularFontAssetPath: "fonts/Lora-Regular.ttf",
        boldFontAssetPath: "fonts/Lora-Bold.ttf",
        fontSize: 12,
      );
      const generalStyleSettings = GeneralStyleSettings(font: font, logo: logo);
      const bannerSettings = BannerSettings(
        secondLayer: secondLayerSettings,
        general: generalStyleSettings,
      );

      final response = await instance.showSecondLayer(
        settings: bannerSettings,
      );

      expect(showSecondLayerBridge.invokeCount, 1);
      expect(showSecondLayerBridge.invokeChannelArgument?.name, "usercentrics");
      expect(showSecondLayerBridge.invokeSettingsArgument, bannerSettings);
      expect(response, expectedResponse);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.showFirstLayer(),
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
  });

  group('getConsents', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.getConsentsBridge,
          const TypeMatcher<MethodChannelGetConsents>());
    });

    test('success', () async {
      const expectedResponse = [
        UsercentricsServiceConsent(
            templateId: "ABC",
            status: false,
            dataProcessor: "123",
            version: "1.1.1",
            type: UsercentricsConsentType.explicit,
            isEssential: true,
            history: [],
            category: "essential"),
      ];
      final getConsentsBridge = FakeGetConsentsBridge(
        invokeAnswer: expectedResponse,
      );
      final instance = MethodChannelUsercentrics(
        getConsentsBridge: getConsentsBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      final response = await instance.consents;

      expect(getConsentsBridge.invokeCount, 1);
      expect(getConsentsBridge.invokeChannelArgument?.name, "usercentrics");
      expect(response, expectedResponse);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.consents,
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
  });

  group('getControllerId', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.getControllerIdBridge,
          const TypeMatcher<MethodChannelGetControllerId>());
    });

    test('success', () async {
      const expectedResponse = "ABCD";
      final getControllerIdBridge = FakeGetControllerIdBridge(
        invokeAnswer: expectedResponse,
      );
      final instance = MethodChannelUsercentrics(
        getControllerIdBridge: getControllerIdBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      final response = await instance.controllerId;

      expect(getControllerIdBridge.invokeCount, 1);
      expect(getControllerIdBridge.invokeChannelArgument?.name, "usercentrics");
      expect(response, expectedResponse);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.controllerId,
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
  });

  group('restoreUserSession', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.restoreUserSessionBridge,
          const TypeMatcher<MethodChannelRestoreUserSession>());
    });

    test('success', () async {
      const expectedStatus = UsercentricsReadyStatus(
          shouldCollectConsent: false,
          consents: [],
          geolocationRuleset: null,
          location: UsercentricsLocation(
              countryCode: "PT",
              regionCode: "PT11",
              isInEU: true,
              isInUS: false,
              isInCalifornia: false));
      final restoreUserSessionBridge = FakeRestoreUserSessionBridge(
        invokeAnswer: expectedStatus,
      );
      final instance = MethodChannelUsercentrics(
        restoreUserSessionBridge: restoreUserSessionBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      const controllerId = "ABC";
      final response =
          await instance.restoreUserSession(controllerId: controllerId);

      expect(restoreUserSessionBridge.invokeCount, 1);
      expect(
          restoreUserSessionBridge.invokeChannelArgument?.name, "usercentrics");
      expect(restoreUserSessionBridge.invokeControllerIdArgument, controllerId);
      expect(response, expectedStatus);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.restoreUserSession(controllerId: "ABC"),
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
  });

  group('cmpData', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.getCMPDataBridge,
          const TypeMatcher<MethodChannelGetCMPData>());
    });

    test('success', () async {
      final getCMPDataBridge = FakeGetCMPDataBridge(
        invokeAnswer: mockCMPData,
      );
      final instance = MethodChannelUsercentrics(
        getCMPDataBridge: getCMPDataBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      final response = await instance.cmpData;

      expect(getCMPDataBridge.invokeCount, 1);
      expect(getCMPDataBridge.invokeChannelArgument?.name, "usercentrics");
      expect(response, mockCMPData);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.cmpData,
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
  });

  group('clearUserSession', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.clearUserSessionBridge,
          const TypeMatcher<MethodChannelClearUserSession>());
    });

    test('success', () async {
      const expectedStatus = UsercentricsReadyStatus(
          shouldCollectConsent: true,
          consents: [],
          geolocationRuleset: null,
          location: UsercentricsLocation(
              countryCode: "PT",
              regionCode: "PT11",
              isInEU: true,
              isInUS: false,
              isInCalifornia: false));

      final clearUserSessionBridge = FakeClearUserSessionBridge(
        invokeAnswer: expectedStatus,
      );

      final instance = MethodChannelUsercentrics(
        clearUserSessionBridge: clearUserSessionBridge,
      );

      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      final response = await instance.clearUserSession();

      expect(clearUserSessionBridge.invokeCount, 1);
      expect(
          clearUserSessionBridge.invokeChannelArgument?.name, "usercentrics");
      expect(response, expectedStatus);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.clearUserSession(),
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
  });
}
