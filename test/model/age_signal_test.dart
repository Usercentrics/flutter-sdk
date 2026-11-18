import 'package:flutter_test/flutter_test.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

void main() {
  group('UsercentricsPublisherAgeSignal', () {
    test('atLeast', () {
      const signal = UsercentricsPublisherAgeSignal.atLeast(
        age: 16,
        sourceLabel: 'my-age-gate',
      );

      expect(signal.kind, UsercentricsPublisherAgeSignalKind.atLeast);
      expect(signal.age, 16);
      expect(signal.lower, isNull);
      expect(signal.upper, isNull);
      expect(signal.sourceLabel, 'my-age-gate');
    });

    test('below', () {
      const signal = UsercentricsPublisherAgeSignal.below(age: 16);

      expect(signal.kind, UsercentricsPublisherAgeSignalKind.below);
      expect(signal.age, 16);
      expect(signal.lower, isNull);
      expect(signal.upper, isNull);
      expect(signal.sourceLabel, isNull);
    });

    test('between', () {
      const signal = UsercentricsPublisherAgeSignal.between(
        lower: 13,
        upper: 15,
      );

      expect(signal.kind, UsercentricsPublisherAgeSignalKind.between);
      expect(signal.age, isNull);
      expect(signal.lower, 13);
      expect(signal.upper, 15);
      expect(signal.sourceLabel, isNull);
    });

    test('building one never fails, whatever the range', () {
      expect(() => const UsercentricsPublisherAgeSignal.atLeast(age: 500),
          returnsNormally);
      expect(() => const UsercentricsPublisherAgeSignal.below(age: -1),
          returnsNormally);
      expect(
        () => const UsercentricsPublisherAgeSignal.between(
          lower: 20,
          upper: 10,
          sourceLabel: 'not a valid label!',
        ),
        returnsNormally,
      );
    });

    test('equality and hashCode', () {
      const signal = UsercentricsPublisherAgeSignal.atLeast(
        age: 16,
        sourceLabel: 'my-age-gate',
      );
      const same = UsercentricsPublisherAgeSignal.atLeast(
        age: 16,
        sourceLabel: 'my-age-gate',
      );
      final others = [
        const UsercentricsPublisherAgeSignal.atLeast(
            age: 17, sourceLabel: 'my-age-gate'),
        const UsercentricsPublisherAgeSignal.atLeast(age: 16),
        const UsercentricsPublisherAgeSignal.atLeast(
            age: 16, sourceLabel: 'other'),
        // The same age, but another kind
        const UsercentricsPublisherAgeSignal.below(
            age: 16, sourceLabel: 'my-age-gate'),
        const UsercentricsPublisherAgeSignal.between(
            lower: 16, upper: 16, sourceLabel: 'my-age-gate'),
      ];

      expect(signal, same);
      expect(signal.hashCode, same.hashCode);
      for (final other in others) {
        expect(signal, isNot(other));
      }
      // Swapped ages are another range
      expect(
        const UsercentricsPublisherAgeSignal.between(lower: 13, upper: 15),
        isNot(
            const UsercentricsPublisherAgeSignal.between(lower: 15, upper: 13)),
      );
    });

    test('toString prints neither the ages nor the label', () {
      const signals = [
        UsercentricsPublisherAgeSignal.atLeast(
            age: 16, sourceLabel: 'my-age-gate'),
        UsercentricsPublisherAgeSignal.below(
            age: 16, sourceLabel: 'my-age-gate'),
        UsercentricsPublisherAgeSignal.between(
            lower: 13, upper: 15, sourceLabel: 'my-age-gate'),
      ];

      for (final signal in signals) {
        expect(signal.toString(), 'UsercentricsPublisherAgeSignal');
        expect('$signal', 'UsercentricsPublisherAgeSignal');
      }
    });
  });

  group('UsercentricsAgeSignalDecision', () {
    const available = UsercentricsAgeSignalDecision(
      source: UsercentricsAgeSignalSource.publisherProvided,
      trust: UsercentricsAgeSignalTrust.publisherProvided,
      band: UsercentricsAgeBand.minor,
      ageLower: 16,
      ageUpper: 17,
      unavailableReason: null,
    );

    test('isAvailable follows the band', () {
      for (final band in UsercentricsAgeBand.values) {
        final decision = UsercentricsAgeSignalDecision(
          source: UsercentricsAgeSignalSource.publisherProvided,
          trust: UsercentricsAgeSignalTrust.publisherProvided,
          band: band,
          ageLower: null,
          ageUpper: null,
          unavailableReason: null,
        );

        expect(decision.isAvailable, isTrue, reason: '$band');
      }

      // No band is no signal, and never an adult
      const unavailable = UsercentricsAgeSignalDecision(
        source: UsercentricsAgeSignalSource.googlePlayAgeSignals,
        trust: null,
        band: null,
        ageLower: null,
        ageUpper: null,
        unavailableReason: UsercentricsAgeSignalUnavailableReason.notShared,
      );
      expect(unavailable.isAvailable, isFalse);
      expect(unavailable.band == UsercentricsAgeBand.standard, isFalse);
    });

    test('equality and hashCode', () {
      const same = UsercentricsAgeSignalDecision(
        source: UsercentricsAgeSignalSource.publisherProvided,
        trust: UsercentricsAgeSignalTrust.publisherProvided,
        band: UsercentricsAgeBand.minor,
        ageLower: 16,
        ageUpper: 17,
        unavailableReason: null,
      );
      final others = [
        const UsercentricsAgeSignalDecision(
          source: UsercentricsAgeSignalSource.googlePlayAgeSignals,
          trust: UsercentricsAgeSignalTrust.publisherProvided,
          band: UsercentricsAgeBand.minor,
          ageLower: 16,
          ageUpper: 17,
          unavailableReason: null,
        ),
        const UsercentricsAgeSignalDecision(
          source: UsercentricsAgeSignalSource.publisherProvided,
          trust: UsercentricsAgeSignalTrust.verified,
          band: UsercentricsAgeBand.minor,
          ageLower: 16,
          ageUpper: 17,
          unavailableReason: null,
        ),
        const UsercentricsAgeSignalDecision(
          source: UsercentricsAgeSignalSource.publisherProvided,
          trust: UsercentricsAgeSignalTrust.publisherProvided,
          band: UsercentricsAgeBand.standard,
          ageLower: 16,
          ageUpper: 17,
          unavailableReason: null,
        ),
        const UsercentricsAgeSignalDecision(
          source: UsercentricsAgeSignalSource.publisherProvided,
          trust: UsercentricsAgeSignalTrust.publisherProvided,
          band: UsercentricsAgeBand.minor,
          ageLower: 15,
          ageUpper: 17,
          unavailableReason: null,
        ),
        const UsercentricsAgeSignalDecision(
          source: UsercentricsAgeSignalSource.publisherProvided,
          trust: UsercentricsAgeSignalTrust.publisherProvided,
          band: UsercentricsAgeBand.minor,
          ageLower: 16,
          ageUpper: null,
          unavailableReason: null,
        ),
        const UsercentricsAgeSignalDecision(
          source: UsercentricsAgeSignalSource.publisherProvided,
          trust: UsercentricsAgeSignalTrust.publisherProvided,
          band: UsercentricsAgeBand.minor,
          ageLower: 16,
          ageUpper: 17,
          unavailableReason: UsercentricsAgeSignalUnavailableReason.error,
        ),
      ];

      expect(available, same);
      expect(available.hashCode, same.hashCode);
      for (final other in others) {
        expect(available, isNot(other));
      }
    });

    test('toString leaves the age range out', () {
      final text = available.toString();

      expect(
        text,
        'UsercentricsAgeSignalDecision('
        'source: UsercentricsAgeSignalSource.publisherProvided, '
        'trust: UsercentricsAgeSignalTrust.publisherProvided, '
        'band: UsercentricsAgeBand.minor, '
        'unavailableReason: null)',
      );
      expect(RegExp(r'\d').hasMatch(text), isFalse);
    });
  });
}
