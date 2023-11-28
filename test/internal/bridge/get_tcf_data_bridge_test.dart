import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/consent_disclosure.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

part 'get_tcf_data_bridge_test.mock.dart';

// Exposed to make the creation of a mock instance of TCFData easier
const mockTCFData = expectedResult;

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
    const instance = MethodChannelGetTCFData();

    final result = await instance.invoke(channel: channel);

    expect(1, callCounter);
    expect('getTCFData', receivedCall?.method);
    expect(expectedResult, result);
  });
}
