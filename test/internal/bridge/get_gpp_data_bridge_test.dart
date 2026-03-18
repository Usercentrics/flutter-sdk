import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/gpp_data.dart';

void main() {
  const mockResponse = {
    'gppString': 'DBABLA~BVQqAAAACgA.QA',
    'applicableSections': [7, 8],
    'sections': {
      'usnat': {
        'Version': 1,
        'SaleOptOut': 2,
        'GpcSegmentIncluded': true,
      },
      'usfl': {
        'Version': 1,
        'SaleOptOut': 0,
      },
    },
  };

  const expectedResult = GppData(
    gppString: 'DBABLA~BVQqAAAACgA.QA',
    applicableSections: [7, 8],
    sections: {
      'usnat': {
        'Version': 1,
        'SaleOptOut': 2,
        'GpcSegmentIncluded': true,
      },
      'usfl': {
        'Version': 1,
        'SaleOptOut': 0,
      },
    },
  );

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

    const instance = MethodChannelGetGPPData();

    final result = await instance.invoke(channel: channel);

    expect(callCounter, 1);
    expect(receivedCall?.method, 'getGPPData');
    expect(result, expectedResult);
  });
}
