import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/bridge/get_additional_consent_mode_data_bridge.dart';
import 'package:usercentrics_sdk/src/model/additional_consent_mode_data.dart';

part 'get_additional_consent_mode_data_bridge_test.mock.dart';

const expectedResult = AdditionalConsentModeData(
    acString: "2~1.2.3~dv.4.5", adTechProviders: _expectedAdTechProviders);

const _expectedAdTechProviders = [
  AdTechProvider(
      id: 1, name: "atp1", privacyPolicyUrl: "www.atp1.com", consent: true),
  AdTechProvider(
      id: 2, name: "atp2", privacyPolicyUrl: "www.atp2.com", consent: true),
  AdTechProvider(
      id: 3, name: "atp3", privacyPolicyUrl: "www.atp3.com", consent: true),
  AdTechProvider(
      id: 4, name: "atp4", privacyPolicyUrl: "www.atp4.com", consent: false),
  AdTechProvider(
      id: 5, name: "atp5", privacyPolicyUrl: "www.atp5.com", consent: false)
];

void main() {
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
    const instance = MethodChannelGetAdditionalConsentModeData();

    final result = await instance.invoke(channel: channel);

    expect(1, callCounter);
    expect('getAdditionalConsentModeData', receivedCall?.method);
    expect(expectedResult.acString, result.acString);
    expect(expectedResult.adTechProviders, result.adTechProviders);
  });
}
