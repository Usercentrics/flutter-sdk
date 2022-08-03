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
    "bannerSettings": {
      "firstLayerStyleSettings": null,
      "secondLayerStyleSettings": {
        "showCloseButton": true,
        'buttonLayout': [
          [
            {
              'type': 'MORE',
              'isAllCaps': null,
              'fontAssetPath': null,
              'textSize': null,
              'textColor': null,
              'backgroundColor': null,
              'cornerRadius': null
            },
            {
              'type': 'ACCEPT_ALL',
              'isAllCaps': null,
              'fontAssetPath': null,
              'textSize': null,
              'textColor': null,
              'backgroundColor': null,
              'cornerRadius': null
            }
          ]
        ],
      },
      "generalStyleSettings": {
        'textColor': null,
        'layerBackgroundColor': null,
        'layerBackgroundSecondaryColor': null,
        'linkColor': null,
        'tabColor': null,
        'bordersColor': null,
        'toggleStyleSettings': null,
        'font': {
          'regularFontAssetPath': 'fonts/Lora-Regular.ttf',
          'boldFontAssetPath': 'fonts/Lora-Bold.ttf',
          'fontSize': 20.0
        },
        'logo': 'images/flutter-logo.png',
        'links': 'NONE'
      }
    }
  };
  const mockFont = BannerFont(
    regularFontAssetPath: "fonts/Lora-Regular.ttf",
    boldFontAssetPath: "fonts/Lora-Bold.ttf",
    fontSize: 20,
  );
  const mockLogo = BannerImage(
    assetPath: "images/flutter-logo.png",
  );
  final mockSecondLayerSettings = SecondLayerStyleSettings(
    showCloseButton: true,
    buttonLayout: ButtonLayout.row(buttons: [
      const ButtonSettings(
        type: ButtonType.more,
      ),
      const ButtonSettings(
        type: ButtonType.acceptAll,
      ),
    ]),
  );

  const mockGeneralStyleSettings = GeneralStyleSettings(
      font: mockFont, logo: mockLogo, links: LegalLinksSettings.none);

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
        secondLayerSettings: mockSecondLayerSettings,
        generalStyleSettings: mockGeneralStyleSettings);

    expect(callCounter, 1);
    expect(receivedCall?.method, 'showSecondLayer');
    expect(receivedCall?.arguments, expectedArguments);
    expect(result, expectedResult);
  });
}
