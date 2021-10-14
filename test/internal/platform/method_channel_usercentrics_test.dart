import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/all.dart';
import 'package:usercentrics_sdk/internal/platform/method_channel_usercentrics.dart';

import '../bridge/fake_initialize_bridge.dart';
import '../bridge/fake_is_ready_bridge.dart';
import '../bridge/fake_reset_bridge.dart';
import '../bridge/fake_show_cmp_bridge.dart';

void main() {
  group('initialize', () {
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

  test('reset', () {
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

  test('status', () async {
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

  group('showCMP', () {
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
}
