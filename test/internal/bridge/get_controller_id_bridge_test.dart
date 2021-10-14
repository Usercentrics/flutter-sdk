import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/internal/bridge/bridge.dart';

void main() {
  // Data from a real call of the debugger
  const mockResponse = "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45";
  const expectedResult = "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45";

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
    const instance = MethodChannelGetControllerId();

    final result = await instance.invoke(channel: channel);

    expect(callCounter, 1);
    expect(receivedCall?.method, 'getControllerId');
    expect(result, expectedResult);
  });
}
