import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

void main() {
  // Data from the debugger
  const mockResponse = {
    "shouldShowCMP": false,
    "consents": [
      {
        "templateId": "SJKM9Ns_ibQ",
        "status": true,
        "type": "EXPLICIT",
        "version": "10.4.5",
        "dataProcessor": "Facebook Connect",
      },
    ],
  };
  const expectedResult = UsercentricsReadyStatus(
    shouldShowCMP: false,
    consents: [
      UsercentricsServiceConsent(
        templateId: "SJKM9Ns_ibQ",
        status: true,
        dataProcessor: "Facebook Connect",
        version: "10.4.5",
        type: UsercentricsConsentType.explicit,
      ),
    ],
  );

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
    const instance = MethodChannelIsReady();

    final result = await instance.invoke(channel: channel);

    expect(callCounter, 1);
    expect(receivedCall?.method, 'isReady');
    expect(result, expectedResult);
  });
}
