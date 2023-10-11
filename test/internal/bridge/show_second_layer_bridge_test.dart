import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

part 'show_second_layer_bridge_test.mock.dart';

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
    const instance = MethodChannelShowSecondLayer();

    final result = await instance.invoke(
      channel: channel,
      settings: BannerSettings(
        secondLayer: mockSecondLayerSettings,
        general: mockGeneralStyleSettings,
        variantName: mockVariant,
      ),
    );

    expect(callCounter, 1);
    expect(receivedCall?.method, 'showSecondLayer');
    expect(receivedCall?.arguments, expectedArguments);
    expect(result, expectedResult);
  });
}
