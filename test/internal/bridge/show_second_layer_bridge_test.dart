import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

void main() {
  // Data from the debugger
  const mockResponse = {
    "controllerId":
        "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45",
    "userInteraction": "ACCEPT_ALL",
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
  const expectedResult = UsercentricsConsentUserResponse(
    controllerId:
        "8620135313b043696b806868b20da905886a3a2598ddddc2b52973f9807d6b45",
    userInteraction: UsercentricsUserInteraction.acceptAll,
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
  const expectedArguments = {
    "showCloseButton": true,
    "bannerSettings": {
      "logo": "images/flutter-logo.png",
      "font": {
        "regularFontAssetPath": "fonts/Lora-Regular.ttf",
        "boldFontAssetPath": "fonts/Lora-Bold.ttf",
        "fontSize": 20,
      },
    }
  };
  const mockShowCloseButton = true;
  const mockFont = BannerFont(
    regularFontAssetPath: "fonts/Lora-Regular.ttf",
    boldFontAssetPath: "fonts/Lora-Bold.ttf",
    fontSize: 20,
  );
  const mockLogo = BannerImage(
    assetPath: "images/flutter-logo.png",
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
    const instance = MethodChannelShowSecondLayer();

    final result = await instance.invoke(
      channel: channel,
      showCloseButton: mockShowCloseButton,
      font: mockFont,
      logo: mockLogo,
    );

    expect(callCounter, 1);
    expect(receivedCall?.method, 'showSecondLayer');
    expect(receivedCall?.arguments, expectedArguments);
    expect(result, expectedResult);
  });
}
