part of 'show_second_layer_bridge_test.dart';
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
      ],
      "category": "essential",
      "isExempt": false
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
        category: "essential", isExempt: false),
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
      'links': 'HIDDEN',
      'disableSystemBackButton': false
    },
    "variantName": 'variantA',
    "initCustomization": {
      'paddingTop': null,
      'paddingBottom': null,
      'paddingStart': null,
      'paddingEnd': null,
      'lineSpacingMultiplier': null,
      'titleFontSize': null,
      'bodyFontSize': null,
      'linkFontSize': null,
      'titleFontBold': null,
      'headerPaddingTop': null,
      'headerPaddingSides': null,
      'headerPaddingBetweenElements': null,
      'buttonBorderColor': '#004dcf',
      'buttonBorderWidth': null,
      'purposeListStyle': 'FLAT',
      'stickyHeader': null,
      'hideLanguageSwitcher': null,
      'buttonHeightDp': null,
      'buttonHorizontalPaddingDp': null,
      'buttonSpacingDp': null,
      'linkUnderline': null,
      'showSecondLayerCloseButton': null,
      'tabFontSize': null,
      'tabActiveColor': null,
      'denyAllButtonBackground': null,
      'acceptAllButtonBackground': null,
      'linkColor': null,
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
const mockDisableSystemBackButton = false;

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
  font: mockFont,
  logo: mockLogo,
  links: LegalLinksSettings.hidden,
  disableSystemBackButton: mockDisableSystemBackButton,
);

const mockVariant = "variantA";

// ignore: deprecated_member_use_from_same_package
const mockBannerInitCustomization = BannerInitCustomization(
  buttonBorderColor: '#004dcf',
  purposeListStyle: PurposeListStyle.flat,
);
