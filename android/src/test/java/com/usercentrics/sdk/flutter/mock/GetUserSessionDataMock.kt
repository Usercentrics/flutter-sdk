package com.usercentrics.sdk.flutter.mock

import com.usercentrics.sdk.flutter.api.FakeFlutterMethodCall

internal object GetUserSessionDataMock {

    const val fake = """
            {
  "consents": [
    {
      "settingsVersion": "10.11.0",
      "status": true,
      "templateId": "H1VdjWX",
      "timestamp": 1621951642000
    },
    {
      "settingsVersion": "10.11.0",
      "status": true,
      "templateId": "l5NidjWX",
      "timestamp": 1621951642000
    }
  ],
  "controllerId": "2c75BB964d3fea93AAAAfd2ffa8b37e9f6",
  "language": "en",
  "tcf": {
    "tcString": "CPGwGwDBENBbCsHvAAIYgG5QCQADAAAeABnAAAAAAAAAbIbAAAAAAAA",
    "vendorsDisclosed": [
      62,
      59,
      84,
      82,
      539,
      882,
      878,
      206,
      6,
      120
    ]
  },
  "ccpa": null
}
        """

    // From the debugger
    val call = FakeFlutterMethodCall(method = "getUserSessionData", arguments = null)
    const val expected = fake

}