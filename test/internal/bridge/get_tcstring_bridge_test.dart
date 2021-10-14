import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/internal/bridge/bridge.dart';

void main() {
  // Data from a real call of the debugger
  const mockResponse =
      "CPRloMgPRloMgAFADBENBXCgALAAAH_AAAYgF5wAwBDACRAXmBgkAUAQwAkQFtALzAYIAAAA.YAAAAAAAAAAA";
  const expectedResult =
      "CPRloMgPRloMgAFADBENBXCgALAAAH_AAAYgF5wAwBDACRAXmBgkAUAQwAkQFtALzAYIAAAA.YAAAAAAAAAAA";

  const MethodChannel channel = MethodChannel('usercentrics');
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    channel.setMockMethodCallHandler(null);
  });

  test('invoke', () async {
    int callCounter = 0;
    MethodCall? receivedCall;
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      callCounter++;
      receivedCall = methodCall;
      return mockResponse;
    });
    const instance = MethodChannelGetTCString();

    final result = await instance.invoke(channel: channel);

    expect(callCounter, 1);
    expect(receivedCall?.method, 'getTCString');
    expect(result, expectedResult);
  });
}
