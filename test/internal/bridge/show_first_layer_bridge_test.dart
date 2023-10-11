import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

part 'show_first_layer_bridge_test.mock.dart';

void main() {
  const MethodChannel channel = MethodChannel('usercentrics');
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('invoke', () async {
    int callCounter = 0;
    MethodCall? receivedCall;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      callCounter++;
      receivedCall = methodCall;
      return mockResponse;
    });
    const instance = MethodChannelShowFirstLayer();

    final result = await instance.invoke(
      channel: channel,
      settings: BannerSettings(
        firstLayer: mockFirstLayerSettings,
        secondLayer: null,
        general: mockGeneralStyleSettings,
        variantName: mockVariant,
      ),
    );

    expect(callCounter, 1);
    expect(receivedCall?.method, 'showFirstLayer');
    expect(receivedCall?.arguments, expectedArguments);
    expect(result, expectedResult);
  });
}
