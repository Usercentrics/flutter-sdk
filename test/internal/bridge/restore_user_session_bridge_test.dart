import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

void main() {
  // Data from the debugger
  const mockResponse = {
    "shouldCollectConsent": false,
    "consents": [
      {
        "templateId": "SJKM9Ns_ibQ",
        "status": true,
        "type": "EXPLICIT",
        "version": "10.4.5",
        "dataProcessor": "Facebook Connect",
        "isEssential": true,
        "history": [
          {
            "status": true,
            "timestampInMillis": 123,
            "type": "EXPLICIT",
          }
        ]
      },
    ],
  };
  const expectedResult = UsercentricsReadyStatus(
    shouldCollectConsent: false,
    consents: [
      UsercentricsServiceConsent(
        templateId: "SJKM9Ns_ibQ",
        status: true,
        dataProcessor: "Facebook Connect",
        version: "10.4.5",
        type: UsercentricsConsentType.explicit,
        isEssential: true,
        history: [
          UsercentricsConsentHistoryEntry(
            status: true,
            timestampInMillis: 123,
            type: UsercentricsConsentType.explicit,
          )
        ],
      ),
    ],
  );
  const mockControllerId =
      "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45";
  const expectedArguments =
      "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45";

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
    const instance = MethodChannelRestoreUserSession();

    final result = await instance.invoke(
      channel: channel,
      controllerId: mockControllerId,
    );

    expect(callCounter, 1);
    expect(receivedCall?.method, 'restoreUserSession');
    expect(receivedCall?.arguments, expectedArguments);
    expect(result, expectedResult);
  });
}
