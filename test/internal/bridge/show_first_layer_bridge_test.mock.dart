part of 'show_first_layer_bridge_test.dart';

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
    "logo": "images/flutter-logo.png",
    "font": {
      "regularFontAssetPath": "fonts/Lora-Regular.ttf",
      "boldFontAssetPath": "fonts/Lora-Bold.ttf",
      "fontSize": 20,
    },
  },
  "layout": "SHEET",
  "settings": {
    'headerImage': {
      'image': 'images/header_extended.png',
      'height': null,
      'isExtended': true,
      'isHidden': null,
      'alignment': null
    },
    'title': {
      'alignment': 'START',
      'fontAssetPath': 'fonts/AndadaPro.ttf',
      'textColor': '#ff000000',
      'textSize': 20.0
    },
    'message': {
      'alignment': 'START',
      'fontAssetPath': null,
      'textColor': '#8a000000',
      'linkTextColor': '#ff000000',
      'linkTextUnderline': false,
      'textSize': 16.0
    },
    'buttonLayout': [
      [
        {
          'type': 'MORE',
          'isAllCaps': null,
          'fontAssetPath': 'fonts/AndadaPro.ttf',
          'textSize': 16.0,
          'textColor': '#ff000000',
          'backgroundColor': '#00000000',
          'cornerRadius': 20
        },
        {
          'type': 'ACCEPT_ALL',
          'isAllCaps': null,
          'fontAssetPath': 'fonts/AndadaPro.ttf',
          'textSize': 16.0,
          'textColor': null,
          'backgroundColor': null,
          'cornerRadius': 20
        }
      ]
    ],
    'backgroundColor': null,
    'overlayColor': null,
    'cornerRadius': 50
  }
};
const mockLayout = UsercentricsLayout.sheet;
const mockFont = BannerFont(
  regularFontAssetPath: "fonts/Lora-Regular.ttf",
  boldFontAssetPath: "fonts/Lora-Bold.ttf",
  fontSize: 20,
);
const mockLogo = BannerImage(
  assetPath: "images/flutter-logo.png",
);

const _buttonTextSizeInSp = 16.0;
const _buttonCornerRadius = 20;
const _customFontPath = "fonts/AndadaPro.ttf";
final mockSettings = FirstLayerStyleSettings(
  headerImage: HeaderImageSettings.extended(
    imageAssetPath: "images/header_extended.png",
  ),
  title: const TitleSettings(
    alignment: SectionAlignment.start,
    fontAssetPath: _customFontPath,
    textColor: Colors.black,
    textSize: 20,
  ),
  message: const MessageSettings(
    alignment: SectionAlignment.start,
    textSize: 16,
    textColor: Colors.black54,
    linkTextColor: Colors.black,
    linkTextUnderline: false,
  ),
  cornerRadius: 50,
  buttonLayout: ButtonLayout.row(buttons: [
    const ButtonSettings(
      type: ButtonType.more,
      fontAssetPath: _customFontPath,
      backgroundColor: Colors.transparent,
      textColor: Colors.black,
      textSize: _buttonTextSizeInSp,
      cornerRadius: _buttonCornerRadius,
    ),
    const ButtonSettings(
      type: ButtonType.acceptAll,
      fontAssetPath: _customFontPath,
      textSize: _buttonTextSizeInSp,
      cornerRadius: _buttonCornerRadius,
    ),
  ]),
);
