import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/model.dart';

part 'set_age_signal_bridge_test.mock.dart';

void main() {
  const MethodChannel channel = MethodChannel('usercentrics');
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  // Answers every call with [response] and keeps what it was called with.
  void mockChannel(
    Object? response, {
    required void Function(MethodCall call) onCall,
  }) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      onCall(methodCall);
      return response;
    });
  }

  test('invoke with atLeast', () async {
    int callCounter = 0;
    MethodCall? receivedCall;
    mockChannel(mockAvailableResponse, onCall: (call) {
      callCounter++;
      receivedCall = call;
    });
    const instance = MethodChannelSetAgeSignal();

    final result = await instance.invoke(
      channel: channel,
      signal: const UsercentricsPublisherAgeSignal.atLeast(
        age: 16,
        sourceLabel: 'my-age-gate',
      ),
    );

    expect(callCounter, 1);
    expect(receivedCall?.method, 'setAgeSignal');
    expect(receivedCall?.arguments, {
      'kind': 'atLeast',
      'age': 16,
      'lower': null,
      'upper': null,
      'sourceLabel': 'my-age-gate',
    });
    expect(result, expectedAvailable);
  });

  test('invoke with below and no source label', () async {
    MethodCall? receivedCall;
    mockChannel(mockAvailableResponse, onCall: (call) => receivedCall = call);
    const instance = MethodChannelSetAgeSignal();

    final result = await instance.invoke(
      channel: channel,
      signal: const UsercentricsPublisherAgeSignal.below(age: 16),
    );

    expect(receivedCall?.method, 'setAgeSignal');
    // The key is sent, as null
    expect(receivedCall?.arguments, {
      'kind': 'below',
      'age': 16,
      'lower': null,
      'upper': null,
      'sourceLabel': null,
    });
    expect(result, expectedAvailable);
  });

  test('invoke with between', () async {
    MethodCall? receivedCall;
    mockChannel(mockRangeResponse, onCall: (call) => receivedCall = call);
    const instance = MethodChannelSetAgeSignal();

    final result = await instance.invoke(
      channel: channel,
      signal: const UsercentricsPublisherAgeSignal.between(
        lower: 13,
        upper: 15,
        sourceLabel: 'my-age-gate',
      ),
    );

    expect(receivedCall?.method, 'setAgeSignal');
    expect(receivedCall?.arguments, {
      'kind': 'between',
      'age': null,
      'lower': 13,
      'upper': 15,
      'sourceLabel': 'my-age-gate',
    });
    expect(result, expectedRange);
  });

  test('invoke sends what it is given, the native SDK is the one to check it',
      () async {
    final received = <Object?>[];
    mockChannel(mockAvailableResponse,
        onCall: (call) => received.add(call.arguments));
    const instance = MethodChannelSetAgeSignal();

    await instance.invoke(
      channel: channel,
      signal: const UsercentricsPublisherAgeSignal.atLeast(age: 500),
    );
    await instance.invoke(
      channel: channel,
      signal: const UsercentricsPublisherAgeSignal.below(age: -1),
    );
    await instance.invoke(
      channel: channel,
      signal: const UsercentricsPublisherAgeSignal.between(
        lower: 20,
        upper: 10,
        sourceLabel: 'not a valid label!',
      ),
    );

    expect(received, [
      {
        'kind': 'atLeast',
        'age': 500,
        'lower': null,
        'upper': null,
        'sourceLabel': null,
      },
      {
        'kind': 'below',
        'age': -1,
        'lower': null,
        'upper': null,
        'sourceLabel': null,
      },
      {
        'kind': 'between',
        'age': null,
        'lower': 20,
        'upper': 10,
        'sourceLabel': 'not a valid label!',
      },
    ]);
  });

  test('invoke with no signal available keeps the nulls', () async {
    mockChannel(mockUnavailableResponse, onCall: (_) {});
    const instance = MethodChannelSetAgeSignal();

    final result = await instance.invoke(
      channel: channel,
      signal: const UsercentricsPublisherAgeSignal.atLeast(age: 16),
    );

    expect(result, expectedUnavailable);
    expect(result.trust, isNull);
    expect(result.band, isNull);
    expect(result.ageLower, isNull);
    expect(result.ageUpper, isNull);
    expect(result.isAvailable, isFalse);
  });

  test('invoke reads every native enum name', () async {
    const instance = MethodChannelSetAgeSignal();
    const signal = UsercentricsPublisherAgeSignal.atLeast(age: 16);

    // Every Dart value has a name, and every name gives its value
    expect(expectedSourceNames.values.toSet(),
        UsercentricsAgeSignalSource.values.toSet());
    expect(expectedTrustNames.values.toSet(),
        UsercentricsAgeSignalTrust.values.toSet());
    expect(
        expectedBandNames.values.toSet(), UsercentricsAgeBand.values.toSet());
    expect(expectedUnavailableReasonNames.values.toSet(),
        UsercentricsAgeSignalUnavailableReason.values.toSet());

    for (final entry in expectedSourceNames.entries) {
      mockChannel({...mockUnavailableResponse, 'source': entry.key},
          onCall: (_) {});
      final result = await instance.invoke(channel: channel, signal: signal);
      expect(result.source, entry.value, reason: entry.key);
    }
    for (final entry in expectedTrustNames.entries) {
      mockChannel({...mockAvailableResponse, 'trust': entry.key},
          onCall: (_) {});
      final result = await instance.invoke(channel: channel, signal: signal);
      expect(result.trust, entry.value, reason: entry.key);
    }
    for (final entry in expectedBandNames.entries) {
      mockChannel({...mockAvailableResponse, 'band': entry.key},
          onCall: (_) {});
      final result = await instance.invoke(channel: channel, signal: signal);
      expect(result.band, entry.value, reason: entry.key);
      expect(result.isAvailable, isTrue, reason: entry.key);
    }
    for (final entry in expectedUnavailableReasonNames.entries) {
      mockChannel({...mockUnavailableResponse, 'unavailableReason': entry.key},
          onCall: (_) {});
      final result = await instance.invoke(channel: channel, signal: signal);
      expect(result.unavailableReason, entry.value, reason: entry.key);
    }
  });

  test('invoke reads an enum name it does not know as no value', () async {
    mockChannel({
      'source': 'PUBLISHER_PROVIDED',
      'trust': 'FROM_A_NEWER_SDK',
      'band': 'FROM_A_NEWER_SDK',
      'ageLower': null,
      'ageUpper': null,
      'unavailableReason': 'FROM_A_NEWER_SDK',
    }, onCall: (_) {});
    const instance = MethodChannelSetAgeSignal();

    final result = await instance.invoke(
      channel: channel,
      signal: const UsercentricsPublisherAgeSignal.atLeast(age: 16),
    );

    expect(result.source, UsercentricsAgeSignalSource.publisherProvided);
    expect(result.trust, isNull);
    expect(result.band, isNull);
    expect(result.unavailableReason, isNull);
    expect(result.isAvailable, isFalse);
  });

  test('invoke does not swallow nor reword the error of the native SDK',
      () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      throw PlatformException(
        code: 'usercentrics_flutter_setAgeSignal_error',
        message: 'Invalid age signal: an age is not between 0 and 120',
        details: 'native details',
      );
    });
    const instance = MethodChannelSetAgeSignal();

    await expectLater(
      instance.invoke(
        channel: channel,
        signal: const UsercentricsPublisherAgeSignal.atLeast(age: 500),
      ),
      throwsA(
        isA<PlatformException>()
            .having((e) => e.code, 'code',
                'usercentrics_flutter_setAgeSignal_error')
            .having((e) => e.message, 'message',
                'Invalid age signal: an age is not between 0 and 120')
            .having((e) => e.details, 'details', 'native details'),
      ),
    );
  });

  test('invoke does not print the signal nor the decision', () async {
    final printed = <String>[];
    final debugPrinted = <String?>[];
    final originalDebugPrint = debugPrint;
    debugPrint =
        (String? message, {int? wrapWidth}) => debugPrinted.add(message);
    addTearDown(() => debugPrint = originalDebugPrint);
    const instance = MethodChannelSetAgeSignal();
    const signal = UsercentricsPublisherAgeSignal.between(
      lower: 13,
      upper: 15,
      sourceLabel: 'my-age-gate',
    );

    await runZoned(
      () async {
        mockChannel(mockRangeResponse, onCall: (_) {});
        await instance.invoke(channel: channel, signal: signal);

        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          throw PlatformException(
              code: 'usercentrics_flutter_setAgeSignal_error');
        });
        await expectLater(
          instance.invoke(channel: channel, signal: signal),
          throwsA(isA<PlatformException>()),
        );
      },
      zoneSpecification: ZoneSpecification(
        print: (self, parent, zone, line) => printed.add(line),
      ),
    );

    expect(printed, isEmpty);
    expect(debugPrinted, isEmpty);
  });
}
