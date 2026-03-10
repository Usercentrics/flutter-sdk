import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';

void main() {
  const MethodChannel channel = MethodChannel('usercentrics');
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('invoke with int value', () async {
    int callCounter = 0;
    MethodCall? receivedCall;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      callCounter++;
      receivedCall = methodCall;
      return null;
    });

    const instance = MethodChannelSetGPPConsent();

    await instance.invoke(
      channel: channel,
      sectionName: 'usnat',
      fieldName: 'SaleOptOut',
      value: 2,
    );

    expect(callCounter, 1);
    expect(receivedCall?.method, 'setGPPConsent');
    expect(receivedCall?.arguments, {
      'sectionName': 'usnat',
      'fieldName': 'SaleOptOut',
      'value': 2,
    });
  });

  test('invoke with bool value', () async {
    int callCounter = 0;
    MethodCall? receivedCall;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      callCounter++;
      receivedCall = methodCall;
      return null;
    });

    const instance = MethodChannelSetGPPConsent();

    await instance.invoke(
      channel: channel,
      sectionName: 'usnat',
      fieldName: 'GpcSegmentIncluded',
      value: true,
    );

    expect(callCounter, 1);
    expect(receivedCall?.method, 'setGPPConsent');
    expect(receivedCall?.arguments, {
      'sectionName': 'usnat',
      'fieldName': 'GpcSegmentIncluded',
      'value': true,
    });
  });
}
