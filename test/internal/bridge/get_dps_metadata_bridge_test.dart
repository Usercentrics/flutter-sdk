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

  test('invoke returns map', () async {
    int callCounter = 0;
    MethodCall? receivedCall;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      callCounter++;
      receivedCall = methodCall;
      return <String, dynamic>{'key': 'value', 'count': 42};
    });

    const instance = MethodChannelGetDpsMetadata();

    final result =
        await instance.invoke(channel: channel, templateId: 'templateId123');

    expect(callCounter, 1);
    expect(receivedCall?.method, 'getDpsMetadata');
    expect(receivedCall?.arguments, 'templateId123');
    expect(result, {'key': 'value', 'count': 42});
  });

  test('invoke returns null', () async {
    int callCounter = 0;
    MethodCall? receivedCall;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      callCounter++;
      receivedCall = methodCall;
      return null;
    });

    const instance = MethodChannelGetDpsMetadata();

    final result =
        await instance.invoke(channel: channel, templateId: 'unknownTemplate');

    expect(callCounter, 1);
    expect(receivedCall?.method, 'getDpsMetadata');
    expect(receivedCall?.arguments, 'unknownTemplate');
    expect(result, isNull);
  });

  test('invoke returns empty map', () async {
    int callCounter = 0;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      callCounter++;
      return <String, dynamic>{};
    });

    const instance = MethodChannelGetDpsMetadata();

    final result =
        await instance.invoke(channel: channel, templateId: 'templateId456');

    expect(callCounter, 1);
    expect(result, isA<Map<String, dynamic>>());
    expect(result, isEmpty);
  });
}
