import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/bridge/bridge.dart';
import 'package:usercentrics_sdk/src/model/analytics_event_type.dart';

void main() {
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
      return null;
    });
    const instance = MethodChannelTrack();

    await instance.invoke(
        channel: channel,
        event: UsercentricsAnalyticsEventType.acceptAllFirstLayer);

    expect(1, callCounter);
    expect('track', receivedCall?.method);
    expect({'event': 'ACCEPT_ALL_FIRST_LAYER'}, receivedCall?.arguments);
  });
}
