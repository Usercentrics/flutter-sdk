part of 'get_tcf_data_bridge_test.dart';

// Data from the debugger
const mockResponse = {
  "features": _responseFeatures,
  "purposes": _responsePurposes,
  "specialFeatures": _responseSpecialFeatures,
  "specialPurposes": _responseSpecialPurposes,
  "stacks": _responseStacks,
  "vendors": _responseVendors,
  "tcString":
      "CPzYJkAPzYJkAAFADBENAVEsAP_gAEPgAAYgAawAQAagBrABABqAAAAA.YAAAAAAAAAAA",
  "thirdPartyCount": 2
};

const _responseFeatures = [
  {
    "id": 3,
    "illustrations": ["feature illustration"],
    "name": "Identify devices based on information transmitted automatically",
    "purposeDescription":
        "Your device might be distinguished from other devices based on information it automatically sends when accessing the Internet"
  },
  {
    "name": "Link different devices",
    "illustrations": ["feature illustration"],
    "purposeDescription":
        "In support of the purposes explained in this notice, your device might be considered as likely linked to other devices that belong to you or your household",
    "id": 2
  },
  {
    "illustrations": ["feature illustration"],
    "name": "Match and combine data from other data sources",
    "purposeDescription":
        "Information about your activity on this service may be matched and combined with other information relating to you and originating from various sources",
    "id": 1
  }
];

const _responsePurposes = [
  {
    "showLegitimateInterestToggle": false,
    "stackId": null,
    "showConsentToggle": true,
    "purposeDescription":
        "Information about your activity on this service (such as forms you submit, content you look at) can be stored and combined with other information about you",
    "isPartOfASelectedStack": false,
    "legitimateInterestConsent": false,
    "name": "Create profiles for personalised advertising",
    "id": 3,
    "consent": true,
    "illustrations": [
      "If you read several articles about the best bike accessories to buy",
      "An apparel company wishes to promote its new line of high-end baby clothes."
    ],
    "numberOfVendors": 12
  },
  {
    "consent": true,
    "legitimateInterestConsent": false,
    "stackId": null,
    "name": "Create profiles to personalise content",
    "isPartOfASelectedStack": false,
    "showLegitimateInterestToggle": false,
    "showConsentToggle": true,
    "id": 5,
    "purposeDescription":
        "Information about your activity on this service (for instance, forms you submit, non-advertising content you look at) can be stored and combined with other information about you",
    "illustrations": [
      "You read several articles on how to build a treehouse on a social media platform.",
      "You have viewed three videos on space exploration across different TV apps."
    ],
    "numberOfVendors": 12
  }
];

const _responseSpecialFeatures = [
  {
    "purposeDescription":
        "Your device might be distinguished from other devices based on information it automatically sends when accessing the Internet",
    "illustrations": ["feature illustration"],
    "id": 1,
    "name": "special feature 1",
    "consent": true,
    "isPartOfASelectedStack": false,
    "stackId": 111,
    "showConsentToggle": true
  },
  {
    "purposeDescription":
        "With your acceptance, certain characteristics specific to your device might be requested and used to distinguish it from other devices (such as the installed fonts or plugins, the resolution of your screen) in support of the purposes explained in this notice.",
    "illustrations": ["feature illustration"],
    "id": 2,
    "name": "special feature 2",
    "consent": true,
    "isPartOfASelectedStack": false,
    "stackId": 222,
    "showConsentToggle": true
  }
];

const _responseSpecialPurposes = [
  {
    "name": "Deliver and present advertising and content",
    "id": 2,
    "illustrations": [
      "Clicking on a link in an article might normally send you to another page or part of the article."
    ],
    "purposeDescription":
        "Certain information (like an IP address or device capabilities) is used to ensure the technical compatibility of the content or advertising"
  },
  {
    "name": "Ensure security, prevent and detect fraud, and fix errors",
    "purposeDescription":
        "Your data can be used to monitor for and prevent unusual and possibly fraudulent activity (for example, regarding advertising, ad clicks by bots)",
    "illustrations": [
      "An advertising intermediary delivers ads from various advertisers to its network of partnering websites."
    ],
    "id": 1
  }
];

const _responseStacks = [
  {
    "description":
        "Precise geolocation and information about device characteristics can be used.",
    "id": 1,
    "name":
        "Precise geolocation data, and identification through device scanning",
    "purposeIds": [1, 2, 3],
    "specialFeatureIds": [1, 2]
  },
  {
    "description":
        "Advertising can be presented based on limited data. Advertising performance can be measured.",
    "id": 2,
    "name": "Advertising based on limited data and advertising measurement",
    "purposeIds": [2, 7],
    "specialFeatureIds": [1, 2]
  }
];

const _responseVendors = [
  {
    "usesNonCookieAccess": true,
    "cookieRefresh": true,
    "specialFeatures": [],
    "flexiblePurposes": [2, 7, 8, 10, 11],
    "legitimateInterestConsent": null,
    "purposes": [1, 3, 4, 5, 6, 9],
    "dataSharedOutsideEU": false,
    "dataCategories": [1, 3, 4, 5, 6, 7, 8, 10, 11],
    "vendorUrls": [
      {
        "langId": "en",
        "privacy": "https://www.sirdata.com/en/Privacy",
        "legIntClaim": "https://www.sirdata.com/en/Privacy#legitimateinterest"
      },
      {
        "langId": "fr",
        "privacy": "https://www.sirdata.com/fr/Vie-Privee",
        "legIntClaim":
            "https://www.sirdata.com/fr/Vie-Privee#legitimateinterest"
      }
    ],
    "showConsentToggle": true,
    "policyUrl": "https://policyUrl.com",
    "features": [1, 2, 3],
    "id": 53,
    "dataRetention": {
      "stdRetention": 185,
      "specialPurposes": {1: 0, 2: 0},
      "purposes": {2: 0, 3: 0},
    },
    "legitimateInterestPurposes": [2, 7, 8, 10, 11],
    "name": "Sirdata",
    "showLegitimateInterestToggle": true,
    "specialPurposes": [1, 2],
    "usesCookies": true,
    "consent": true,
    "deviceStorageDisclosureUrl":
        "https://cdn.sirdata.eu/sirdata_device_storage_disclosure.json",
    "cookieMaxAgeSeconds": 31536000.0,
    "deviceStorage": [
      {
        "identifier": "identifier",
        "type": "APP",
        "name": "name",
        "maxAgeSeconds": 10,
        "cookieRefresh": false,
        "purposes": [1, 2, 3],
        "domain": "domain",
        "description": "description"
      }
    ],
    "restrictions": [
      {"purposeId": 1, "restrictionType": "REQUIRE_LI"}
    ]
  }
];

// Expected
const expectedResult = TCFData(
  features: _expectedFeatures,
  purposes: _expectedPurposes,
  specialFeatures: _expectedSpecialFeatures,
  specialPurposes: _expectedSpecialPurposes,
  stacks: _expectedStacks,
  vendors: _expectedVendors,
  tcString:
      "CPzYJkAPzYJkAAFADBENAVEsAP_gAEPgAAYgAawAQAagBrABABqAAAAA.YAAAAAAAAAAA",
  thirdPartyCount: 2,
);

const _expectedFeatures = [
  TCFFeature(
      id: 3,
      illustrations: ["feature illustration"],
      name: "Identify devices based on information transmitted automatically",
      purposeDescription:
          "Your device might be distinguished from other devices based on information it automatically sends when accessing the Internet"),
  TCFFeature(
      name: "Link different devices",
      illustrations: ["feature illustration"],
      purposeDescription:
          "In support of the purposes explained in this notice, your device might be considered as likely linked to other devices that belong to you or your household",
      id: 2),
  TCFFeature(
      illustrations: ["feature illustration"],
      name: "Match and combine data from other data sources",
      purposeDescription:
          "Information about your activity on this service may be matched and combined with other information relating to you and originating from various sources",
      id: 1)
];

const _expectedPurposes = [
  TCFPurpose(
      showLegitimateInterestToggle: false,
      stackId: null,
      showConsentToggle: true,
      purposeDescription:
          "Information about your activity on this service (such as forms you submit, content you look at) can be stored and combined with other information about you",
      isPartOfASelectedStack: false,
      legitimateInterestConsent: false,
      name: "Create profiles for personalised advertising",
      id: 3,
      consent: true,
      illustrations: [
        "If you read several articles about the best bike accessories to buy",
        "An apparel company wishes to promote its new line of high-end baby clothes."
      ],
      numberOfVendors: 12),
  TCFPurpose(
      consent: true,
      legitimateInterestConsent: false,
      stackId: null,
      name: "Create profiles to personalise content",
      isPartOfASelectedStack: false,
      showLegitimateInterestToggle: false,
      showConsentToggle: true,
      id: 5,
      purposeDescription:
          "Information about your activity on this service (for instance, forms you submit, non-advertising content you look at) can be stored and combined with other information about you",
      illustrations: [
        "You read several articles on how to build a treehouse on a social media platform.",
        "You have viewed three videos on space exploration across different TV apps."
      ],
      numberOfVendors: 12)
];

const _expectedSpecialFeatures = [
  TCFSpecialFeature(
      purposeDescription:
          "Your device might be distinguished from other devices based on information it automatically sends when accessing the Internet",
      illustrations: ["feature illustration"],
      id: 1,
      name: "special feature 1",
      consent: true,
      isPartOfASelectedStack: false,
      stackId: 111,
      showConsentToggle: true),
  TCFSpecialFeature(
      purposeDescription:
          "With your acceptance, certain characteristics specific to your device might be requested and used to distinguish it from other devices (such as the installed fonts or plugins, the resolution of your screen) in support of the purposes explained in this notice.",
      illustrations: ["feature illustration"],
      id: 2,
      name: "special feature 2",
      consent: true,
      isPartOfASelectedStack: false,
      stackId: 222,
      showConsentToggle: true)
];

const _expectedSpecialPurposes = [
  TCFSpecialPurpose(
      name: "Deliver and present advertising and content",
      id: 2,
      illustrations: [
        "Clicking on a link in an article might normally send you to another page or part of the article."
      ],
      purposeDescription:
          "Certain information (like an IP address or device capabilities) is used to ensure the technical compatibility of the content or advertising"),
  TCFSpecialPurpose(
      name: "Ensure security, prevent and detect fraud, and fix errors",
      purposeDescription:
          "Your data can be used to monitor for and prevent unusual and possibly fraudulent activity (for example, regarding advertising, ad clicks by bots)",
      illustrations: [
        "An advertising intermediary delivers ads from various advertisers to its network of partnering websites."
      ],
      id: 1)
];

const _expectedStacks = [
  TCFStack(
      description:
          "Precise geolocation and information about device characteristics can be used.",
      id: 1,
      name: "Precise geolocation data, and identification through device scanning",
      purposeIds: [1, 2, 3],
      specialFeatureIds: [1, 2]),
  TCFStack(
      description:
          "Advertising can be presented based on limited data. Advertising performance can be measured.",
      id: 2,
      name: "Advertising based on limited data and advertising measurement",
      purposeIds: [2, 7],
      specialFeatureIds: [1, 2]),
];

const _expectedVendors = [
  TCFVendor(
      usesNonCookieAccess: true,
      cookieRefresh: true,
      specialFeatures: [],
      flexiblePurposes: [2, 7, 8, 10, 11],
      legitimateInterestConsent: null,
      purposes: [1, 3, 4, 5, 6, 9],
      dataSharedOutsideEU: false,
      dataCategories: [1, 3, 4, 5, 6, 7, 8, 10, 11],
      vendorUrls: [
        VendorUrl(
            langId: "en",
            privacy: "https://www.sirdata.com/en/Privacy",
            legIntClaim:
                "https://www.sirdata.com/en/Privacy#legitimateinterest"),
        VendorUrl(
            langId: "fr",
            privacy: "https://www.sirdata.com/fr/Vie-Privee",
            legIntClaim:
                "https://www.sirdata.com/fr/Vie-Privee#legitimateinterest")
      ],
      showConsentToggle: true,
      policyUrl: "https://policyUrl.com",
      features: [1, 2, 3],
      id: 53,
      dataRetention: DataRetention(
          stdRetention: 185,
          specialPurposes: RetentionPeriod(idAndPeriod: {1: 0, 2: 0}),
          purposes: RetentionPeriod(idAndPeriod: {2: 0, 3: 0})),
      legitimateInterestPurposes: [2, 7, 8, 10, 11],
      name: "Sirdata",
      showLegitimateInterestToggle: true,
      specialPurposes: [1, 2],
      usesCookies: true,
      consent: true,
      deviceStorageDisclosureUrl:
          "https://cdn.sirdata.eu/sirdata_device_storage_disclosure.json",
      cookieMaxAgeSeconds: 31536000.0,
      deviceStorage: ConsentDisclosureObject(disclosures: [
        ConsentDisclosure(
            identifier: "identifier",
            type: ConsentDisclosureType.app,
            name: "name",
            maxAgeSeconds: 10,
            cookieRefresh: false,
            purposes: [1, 2, 3],
            domain: "domain",
            description: "description")
      ]),
      restrictions: [
        TCFVendorRestriction(
            purposeId: 1, restrictionType: RestrictionType.requireLi)
      ])
];
