import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/consent_type.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';
import 'package:usercentrics_sdk/src/model/tcf_decision_ui_layer.dart';

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
      ],
      "category": "essential"
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
        category: "essential")
  ];
  const mockFromLayer = TCFDecisionUILayer.firstLayer;
  const mockConsentType = UsercentricsConsentType.explicit;
  const expectedArguments = {
    "fromLayer": "FIRST_LAYER",
    "consentType": "EXPLICIT"
  };

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

    const instance = MethodChannelDenyAllForTCF();

    final result = await instance.invoke(
      channel: channel,
      fromLayer: mockFromLayer,
      consentType: mockConsentType,
    );

    expect(callCounter, 1);
    expect(receivedCall?.method, 'denyAllForTCF');
    expect(receivedCall?.arguments, expectedArguments);
    expect(result, expectedResult);
  });
}
