import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/consent_type.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';

void main() {
  // Data from the debugger
  const mockResponse = [
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
  ];
  const expectedResult = [
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
    )
  ];
  const mockConsentType = UsercentricsConsentType.explicit;
  const expectedArguments = "EXPLICIT";

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
    const instance = MethodChannelAcceptAll();

    final result = await instance.invoke(
      channel: channel,
      consentType: mockConsentType,
    );

    expect(callCounter, 1);
    expect(receivedCall?.method, 'acceptAll');
    expect(receivedCall?.arguments, expectedArguments);
    expect(result, expectedResult);
  });
}
