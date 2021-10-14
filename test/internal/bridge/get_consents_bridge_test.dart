import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/all.dart';
import 'package:usercentrics_sdk/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/model/service_consent.dart';

void main() {
  // Data from a real call of the debugger
  const mockResponse = [
    {
      "templateId": "SJKM9Ns_ibQ",
      "status": true,
      "type": "EXPLICIT",
      "version": "10.4.5",
      "dataProcessor": "Facebook Connect"
    },
  ];
  const expectedResult = [
    UsercentricsServiceConsent(
      templateId: "SJKM9Ns_ibQ",
      status: true,
      dataProcessor: "Facebook Connect",
      version: "10.4.5",
      type: UsercentricsConsentType.explicit,
    )
  ];

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
    const instance = MethodChannelGetConsents();

    final result = await instance.invoke(channel: channel);

    expect(callCounter, 1);
    expect(receivedCall?.method, 'getConsents');
    expect(result, expectedResult);
  });
}
