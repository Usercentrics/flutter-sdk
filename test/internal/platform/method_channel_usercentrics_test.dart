import 'dart:async';

import 'package:test/test.dart';
import 'package:usercentrics_sdk/all.dart';
import 'package:usercentrics_sdk/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/internal/platform/method_channel_usercentrics.dart';

import '../bridge/fake_get_consents_bridge.dart';
import '../bridge/fake_get_controller_id_bridge.dart';
import '../bridge/fake_get_tcstring_bridge.dart';
import '../bridge/fake_initialize_bridge.dart';
import '../bridge/fake_is_ready_bridge.dart';
import '../bridge/fake_reset_bridge.dart';
import '../bridge/fake_restore_user_session_bridge.dart';
import '../bridge/fake_show_cmp_bridge.dart';

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
          shouldShowCMP: false,
          consents: [],
        ),
      );
      final instance = MethodChannelUsercentrics(
        initializeBridge: initializeBridge,
        isReadyBridge: isReadyBridge,
      );

      const settingsId = "ABC";
      const defaultLanguage = "en";
      const loggerLevel = UsercentricsLoggerLevel.debug;
      const timeoutMillis = 10000;
      const version = "1.1.1";

      instance.initialize(
        settingsId: settingsId,
        defaultLanguage: defaultLanguage,
        loggerLevel: loggerLevel,
        timeoutMillis: timeoutMillis,
        version: version,
      );
      await instance.isReadyCompleter?.future;

      expect(initializeBridge.invokeCount, 1);
      expect(initializeBridge.invokeChannelArgument?.name, "usercentrics");
      expect(initializeBridge.invokeSettingsIdArgument, settingsId);
      expect(initializeBridge.invokeDefaultLanguageArgument, defaultLanguage);
      expect(initializeBridge.invokeLoggerLevelArgument, loggerLevel);
      expect(initializeBridge.invokeTimeoutMillisArgument, timeoutMillis);
      expect(initializeBridge.invokeVersionArgument, version);

      expect(isReadyBridge.invokeCount, 1);
      expect(isReadyBridge.invokeChannelArgument?.name, "usercentrics");

      expect(instance.isReadyCompleter?.isCompleted, true);
    });

    test('more than once', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      expect(
        () => instance.initialize(settingsId: "ABC"),
        throwsA(const TypeMatcher<AlreadyInitializedException>()),
      );
    });
  });

  group('reset', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.resetBridge, const TypeMatcher<MethodChannelReset>());
    });

    test('success', () {
      final resetBridge = FakeResetBridge();
      final instance = MethodChannelUsercentrics(
        resetBridge: resetBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      instance.reset();

      expect(resetBridge.invokeChannelArgument?.name, "usercentrics");
      expect(resetBridge.invokeCount, 1);
      expect(instance.isReadyCompleter, null);
    });
  });

  group('status', () {
    test('default', () async {
      final instance = MethodChannelUsercentrics();
      expect(instance.isReadyBridge, const TypeMatcher<MethodChannelIsReady>());
    });

    test('success', () async {
      const expectedStatus = UsercentricsReadyStatus(
        shouldShowCMP: false,
        consents: [],
      );
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

  group('showCMP', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.showCMPBridge, const TypeMatcher<MethodChannelShowCMP>());
    });

    test('success', () async {
      const expectedResponse = UsercentricsConsentUserResponse(
        controllerId: "ABC",
        userInteraction: UsercentricsUserInteraction.acceptAll,
        consents: [],
      );
      final showCMPBridge = FakeShowCMPBridge(
        invokeAnswer: expectedResponse,
      );
      final instance = MethodChannelUsercentrics(
        showCMPBridge: showCMPBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      const showCloseButton = true;
      const customLogo = UsercentricsImage(assetPath: "assetPath");
      const customFont =
          UsercentricsFont(fontAssetPath: "fontAssetPath", fontSize: 12);

      final response = await instance.showCMP(
        showCloseButton: showCloseButton,
        customLogo: customLogo,
        customFont: customFont,
      );

      expect(showCMPBridge.invokeCount, 1);
      expect(showCMPBridge.invokeChannelArgument?.name, "usercentrics");
      expect(showCMPBridge.invokeShowCloseButtonArgument, showCloseButton);
      expect(showCMPBridge.invokeCustomLogoArgument, customLogo);
      expect(showCMPBridge.invokeCustomFontArgument, customFont);
      expect(response, expectedResponse);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.showCMP(),
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
        ),
      ];
      final getConsentsBridge = FakeGetConsentsBridge(
        invokeAnswer: expectedResponse,
      );
      final instance = MethodChannelUsercentrics(
        getConsentsBridge: getConsentsBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      final response = await instance.getConsents();

      expect(getConsentsBridge.invokeCount, 1);
      expect(getConsentsBridge.invokeChannelArgument?.name, "usercentrics");
      expect(response, expectedResponse);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.getConsents(),
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

      final response = await instance.getControllerId();

      expect(getControllerIdBridge.invokeCount, 1);
      expect(getControllerIdBridge.invokeChannelArgument?.name, "usercentrics");
      expect(response, expectedResponse);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.getControllerId(),
        throwsA(const TypeMatcher<NotInitializedException>()),
      );
    });
  });

  group('getTCString', () {
    test('default', () {
      final instance = MethodChannelUsercentrics();
      expect(instance.getTCStringBridge,
          const TypeMatcher<MethodChannelGetTCString>());
    });

    test('success', () async {
      const expectedResponse = "ABCD";
      final getTCStringBridge = FakeGetTCStringBridge(
        invokeAnswer: expectedResponse,
      );
      final instance = MethodChannelUsercentrics(
        getTCStringBridge: getTCStringBridge,
      );
      instance.isReadyCompleter = Completer();
      instance.isReadyCompleter?.complete();

      final response = await instance.getTCString();

      expect(getTCStringBridge.invokeCount, 1);
      expect(getTCStringBridge.invokeChannelArgument?.name, "usercentrics");
      expect(response, expectedResponse);
    });

    test('when it is not ready', () {
      final instance = MethodChannelUsercentrics();
      instance.isReadyCompleter = null;

      expect(
        () => instance.getTCString(),
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
        shouldShowCMP: false,
        consents: [],
      );
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
}
