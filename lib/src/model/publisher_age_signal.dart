/// An age range the host app (the publisher) already knows about its user, to hand to `Usercentrics.setAgeSignal`. **Experimental.**
///
/// Build it with [UsercentricsPublisherAgeSignal.atLeast], [UsercentricsPublisherAgeSignal.below] or [UsercentricsPublisherAgeSignal.between]. Building one never fails: the range is checked when it is handed over, and one that is not valid makes `Usercentrics.setAgeSignal` fail.
///
/// The optional `sourceLabel` names where the host got the age from (for example `my-age-gate`). It is written to the SDK logger and handed to the age signal engine, and goes nowhere else. It must be 1 to 32 characters of `A-Z`, `a-z`, `0-9`, `.`, `_` or `-`: no personal data.
///
/// The band follows the lower age, and a signal without one counts it as 0: [atLeast] and [between] resolve to the band of their lower age, and [below] always resolves to the lowest band, because it gives an upper age only.
///
/// A signal carries no trust level. The SDK always tags it [UsercentricsAgeSignalTrust.publisherProvided], so a host cannot present its own flag as one that a platform verified. [toString] does not print the ages or the label.
class UsercentricsPublisherAgeSignal {
  const UsercentricsPublisherAgeSignal._internal({
    required this.kind,
    this.age,
    this.lower,
    this.upper,
    this.sourceLabel,
  });

  /// The person is [age] or older, for example `atLeast(age: 16)` for a "16+" flag. No upper age is known.
  const UsercentricsPublisherAgeSignal.atLeast({
    required int age,
    String? sourceLabel,
  }) : this._internal(
          kind: UsercentricsPublisherAgeSignalKind.atLeast,
          age: age,
          sourceLabel: sourceLabel,
        );

  /// The person is younger than [age], for example `below(age: 16)` for an "under 16" flag. No lower age is known.
  const UsercentricsPublisherAgeSignal.below({
    required int age,
    String? sourceLabel,
  }) : this._internal(
          kind: UsercentricsPublisherAgeSignalKind.below,
          age: age,
          sourceLabel: sourceLabel,
        );

  /// The person is between [lower] and [upper] years old, both included, for example `between(lower: 13, upper: 15)`.
  const UsercentricsPublisherAgeSignal.between({
    required int lower,
    required int upper,
    String? sourceLabel,
  }) : this._internal(
          kind: UsercentricsPublisherAgeSignalKind.between,
          lower: lower,
          upper: upper,
          sourceLabel: sourceLabel,
        );

  /// Internal property.
  final UsercentricsPublisherAgeSignalKind kind;

  /// Internal property. The age of [UsercentricsPublisherAgeSignal.atLeast] and [UsercentricsPublisherAgeSignal.below].
  final int? age;

  /// Internal property. The lower age of [UsercentricsPublisherAgeSignal.between].
  final int? lower;

  /// Internal property. The upper age of [UsercentricsPublisherAgeSignal.between].
  final int? upper;

  /// Where the host got the age from, if it said.
  final String? sourceLabel;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsPublisherAgeSignal &&
          runtimeType == other.runtimeType &&
          kind == other.kind &&
          age == other.age &&
          lower == other.lower &&
          upper == other.upper &&
          sourceLabel == other.sourceLabel;

  @override
  int get hashCode => Object.hash(kind, age, lower, upper, sourceLabel);

  /// A constant on purpose: a host that logs the signal ships neither the ages nor the label.
  @override
  String toString() => "UsercentricsPublisherAgeSignal";
}

/// Internal. How a [UsercentricsPublisherAgeSignal] was built.
enum UsercentricsPublisherAgeSignalKind { atLeast, below, between }
