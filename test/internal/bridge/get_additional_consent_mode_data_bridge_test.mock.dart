part of 'get_additional_consent_mode_data_test.dart';

const mockResponse = {
  "acString": "2~1.2.3~dv.4.5",
  "adTechProviders": _responseAdTechProviders
};

const _responseAdTechProviders = [
  {
    "id": 1,
    "name": "atp1",
    "privacyPolicyUrl": "www.atp1.com",
    "consent": true
  },
  {
    "id": 2,
    "name": "atp2",
    "privacyPolicyUrl": "www.atp2.com",
    "consent": true
  },
  {
    "id": 3,
    "name": "atp3",
    "privacyPolicyUrl": "www.atp3.com",
    "consent": true
  },
  {
    "id": 4,
    "name": "atp4",
    "privacyPolicyUrl": "www.atp4.com",
    "consent": false
  },
  {
    "id": 5,
    "name": "atp5",
    "privacyPolicyUrl": "www.atp5.com",
    "consent": false
  }
];