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

  test('invoke returns string', () async {
    int callCounter = 0;
    MethodCall? receivedCall;

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      callCounter++;
      receivedCall = methodCall;
      return 'DBABLA~BVQqAAAACgA.QA';
    });

    const instance = MethodChannelGetGPPString();

    final result = await instance.invoke(channel: channel);

    expect(callCounter, 1);
    expect(receivedCall?.method, 'getGPPString');
    expect(result, 'DBABLA~BVQqAAAACgA.QA');
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

    const instance = MethodChannelGetGPPString();

    final result = await instance.invoke(channel: channel);

    expect(callCounter, 1);
    expect(receivedCall?.method, 'getGPPString');
    expect(result, isNull);
  });
}
