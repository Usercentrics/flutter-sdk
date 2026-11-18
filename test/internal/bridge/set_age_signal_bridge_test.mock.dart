part of 'set_age_signal_bridge_test.dart';

// What the native layers answer: the enums by their native name, and a missing value as null
const mockAvailableResponse = {
  "source": "PUBLISHER_PROVIDED",
  "trust": "PUBLISHER_PROVIDED",
  "band": "MINOR",
  "ageLower": 16,
  "ageUpper": null,
  "unavailableReason": null,
};
const expectedAvailable = UsercentricsAgeSignalDecision(
  source: UsercentricsAgeSignalSource.publisherProvided,
  trust: UsercentricsAgeSignalTrust.publisherProvided,
  band: UsercentricsAgeBand.minor,
  ageLower: 16,
  ageUpper: null,
  unavailableReason: null,
);

const mockUnavailableResponse = {
  "source": "GOOGLE_PLAY_AGE_SIGNALS",
  "trust": null,
  "band": null,
  "ageLower": null,
  "ageUpper": null,
  "unavailableReason": "NOT_SHARED",
};
const expectedUnavailable = UsercentricsAgeSignalDecision(
  source: UsercentricsAgeSignalSource.googlePlayAgeSignals,
  trust: null,
  band: null,
  ageLower: null,
  ageUpper: null,
  unavailableReason: UsercentricsAgeSignalUnavailableReason.notShared,
);

const mockRangeResponse = {
  "source": "APPLE_DECLARED_AGE_RANGE",
  "trust": "GUARDIAN_DECLARED",
  "band": "BELOW_MINIMUM",
  "ageLower": 10,
  "ageUpper": 12,
  "unavailableReason": null,
};
const expectedRange = UsercentricsAgeSignalDecision(
  source: UsercentricsAgeSignalSource.appleDeclaredAgeRange,
  trust: UsercentricsAgeSignalTrust.guardianDeclared,
  band: UsercentricsAgeBand.belowMinimum,
  ageLower: 10,
  ageUpper: 12,
  unavailableReason: null,
);

// The name of every native enum value, written out: a value added or renamed in the native SDK
// has to be handled here and in the Dart enums.
const expectedSourceNames = {
  "APPLE_DECLARED_AGE_RANGE": UsercentricsAgeSignalSource.appleDeclaredAgeRange,
  "GOOGLE_PLAY_AGE_SIGNALS": UsercentricsAgeSignalSource.googlePlayAgeSignals,
  "PUBLISHER_PROVIDED": UsercentricsAgeSignalSource.publisherProvided,
};
const expectedTrustNames = {
  "SELF_DECLARED": UsercentricsAgeSignalTrust.selfDeclared,
  "GUARDIAN_DECLARED": UsercentricsAgeSignalTrust.guardianDeclared,
  "VERIFIED": UsercentricsAgeSignalTrust.verified,
  "PUBLISHER_PROVIDED": UsercentricsAgeSignalTrust.publisherProvided,
};
const expectedBandNames = {
  "BELOW_MINIMUM": UsercentricsAgeBand.belowMinimum,
  "MINOR": UsercentricsAgeBand.minor,
  "STANDARD": UsercentricsAgeBand.standard,
};
const expectedUnavailableReasonNames = {
  "DECLINED": UsercentricsAgeSignalUnavailableReason.declined,
  "NOT_SHARED": UsercentricsAgeSignalUnavailableReason.notShared,
  "VERIFICATION_REQUIRED":
      UsercentricsAgeSignalUnavailableReason.verificationRequired,
  "UNSUPPORTED": UsercentricsAgeSignalUnavailableReason.unsupported,
  "NOT_AVAILABLE": UsercentricsAgeSignalUnavailableReason.notAvailable,
  "INVALID_REQUEST": UsercentricsAgeSignalUnavailableReason.invalidRequest,
  "TRANSIENT_ERROR": UsercentricsAgeSignalUnavailableReason.transientError,
  "TIMEOUT": UsercentricsAgeSignalUnavailableReason.timeout,
  "ERROR": UsercentricsAgeSignalUnavailableReason.error,
};
