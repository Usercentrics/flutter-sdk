/// Where an age signal comes from. **Experimental.**
enum UsercentricsAgeSignalSource {
  /// Apple `DeclaredAgeRange` framework (iOS 26+).
  appleDeclaredAgeRange,

  /// Google Play Age Signals API (Android 6.0+, Play-distributed builds).
  googlePlayAgeSignals,

  /// The host app (the publisher) provided the age itself, through `Usercentrics.setAgeSignal`. No platform vouches for it and the SDK cannot check it.
  publisherProvided,
}

/// How trustworthy the age behind a signal is. **Experimental.**
///
/// A successful platform call is **not** proof of age: both Apple and Google can answer with a plain self-declared range, so every caller must branch on this value.
enum UsercentricsAgeSignalTrust {
  /// The person declared their own age (Apple `selfDeclared`, Google `TIER_A`).
  selfDeclared,

  /// A parent or guardian set the age (Apple `guardianDeclared`, Google `TIER_B`).
  guardianDeclared,

  /// The age was checked by the platform with a government ID, a payment method or another method (Apple `*Checked` declarations, including the guardian variants; Google `TIER_C` and `TIER_D`).
  verified,

  /// The host app (the publisher) declared the age itself, through `Usercentrics.setAgeSignal`. It is never [verified]: neither the SDK nor a platform checked it, so it is only as good as the host's own age gate.
  publisherProvided,
}

/// The age band a signal resolves to. **Experimental.**
enum UsercentricsAgeBand {
  /// Below the minimum age.
  belowMinimum,

  /// At or above the minimum age but not (provably) an adult.
  minor,

  /// An adult.
  standard,
}

/// Why no age band is available. **Experimental.**
///
/// This is **not** a hard failure: callers must fall back to their default behaviour.
enum UsercentricsAgeSignalUnavailableReason {
  /// The person (or the parent) declined to share the age range.
  declined,

  /// The age range is not shared with this app (user setting, region not covered yet, or no age on record).
  notShared,

  /// The person must verify their age in the store before a signal can be shared (mandated regions).
  verificationRequired,

  /// The OS version, the device, or an optional dependency does not support the API.
  unsupported,

  /// The platform service is not reachable here (no Play Store, app not installed by Play, API off, etc.).
  notAvailable,

  /// The platform rejected the request (for Apple, typically a missing entitlement or invalid age gates).
  invalidRequest,

  /// A temporary failure (network, service busy). Calling again later may succeed.
  transientError,

  /// The platform did not answer in time.
  timeout,

  /// Any other error.
  error,
}

/// The outcome of an age signal request, as data. **Experimental.**
///
/// Platform policy: Google Play Age Signals may only be used to provide age-appropriate content and experiences in compliance with law. Do not use it for advertising, marketing, user profiling or analytics, and do not share it with ad or analytics SDKs.
///
/// [toString] leaves the age range out, so a host that logs or reports a decision does not ship the exact ages. Read [ageLower] and [ageUpper] only where the range is needed.
class UsercentricsAgeSignalDecision {
  const UsercentricsAgeSignalDecision({
    required this.source,
    required this.trust,
    required this.band,
    required this.ageLower,
    required this.ageUpper,
    required this.unavailableReason,
  });

  /// Where the signal comes from.
  final UsercentricsAgeSignalSource source;

  /// How the age was established, or `null` when [band] is `null`.
  final UsercentricsAgeSignalTrust? trust;

  /// The resolved band, or `null` when no signal is available (see [unavailableReason]).
  ///
  /// `null` is never an adult: it means "no signal", and what a host does without one is its own decision. [UsercentricsAgeBand.belowMinimum] and [UsercentricsAgeBand.minor] are both minors and only [UsercentricsAgeBand.standard] is an adult, so test `band == UsercentricsAgeBand.standard` for an adult: `band != UsercentricsAgeBand.minor` would take both a missing signal and a child below the minimum age for one.
  final UsercentricsAgeBand? band;

  /// Inclusive lower bound of the range reported by the platform or provided by the host app, when available.
  final int? ageLower;

  /// Inclusive upper bound, or `null` for the open-ended top range (for example 18+).
  final int? ageUpper;

  /// Why no [band] is available, or `null` when one is.
  final UsercentricsAgeSignalUnavailableReason? unavailableReason;

  /// `true` when a [band] was resolved. `false` is "no signal", not "adult".
  bool get isAvailable => band != null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsAgeSignalDecision &&
          runtimeType == other.runtimeType &&
          source == other.source &&
          trust == other.trust &&
          band == other.band &&
          ageLower == other.ageLower &&
          ageUpper == other.ageUpper &&
          unavailableReason == other.unavailableReason;

  @override
  int get hashCode => Object.hash(
        source,
        trust,
        band,
        ageLower,
        ageUpper,
        unavailableReason,
      );

  /// Deliberately without [ageLower] and [ageUpper]: they would print the exact age range.
  @override
  String toString() =>
      "UsercentricsAgeSignalDecision(source: $source, trust: $trust, band: $band, unavailableReason: $unavailableReason)";
}
