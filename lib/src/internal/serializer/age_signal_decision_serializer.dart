import 'package:usercentrics_sdk/src/model/age_signal_decision.dart';

class AgeSignalDecisionSerializer {
  // The enums travel by their native name. A name that this bridge does not know (a newer
  // native SDK) reads as null, like in the other enums of this bridge.
  static UsercentricsAgeSignalDecision deserialize(dynamic value) {
    return UsercentricsAgeSignalDecision(
      source: _deserializeSource(value['source'])!,
      trust: _deserializeTrust(value['trust']),
      band: _deserializeBand(value['band']),
      ageLower: value['ageLower'],
      ageUpper: value['ageUpper'],
      unavailableReason:
          _deserializeUnavailableReason(value['unavailableReason']),
    );
  }

  static UsercentricsAgeSignalSource? _deserializeSource(dynamic value) {
    switch (value) {
      case 'APPLE_DECLARED_AGE_RANGE':
        return UsercentricsAgeSignalSource.appleDeclaredAgeRange;
      case 'GOOGLE_PLAY_AGE_SIGNALS':
        return UsercentricsAgeSignalSource.googlePlayAgeSignals;
      case 'PUBLISHER_PROVIDED':
        return UsercentricsAgeSignalSource.publisherProvided;
    }
    return null;
  }

  static UsercentricsAgeSignalTrust? _deserializeTrust(dynamic value) {
    switch (value) {
      case 'SELF_DECLARED':
        return UsercentricsAgeSignalTrust.selfDeclared;
      case 'GUARDIAN_DECLARED':
        return UsercentricsAgeSignalTrust.guardianDeclared;
      case 'VERIFIED':
        return UsercentricsAgeSignalTrust.verified;
      case 'PUBLISHER_PROVIDED':
        return UsercentricsAgeSignalTrust.publisherProvided;
    }
    return null;
  }

  static UsercentricsAgeBand? _deserializeBand(dynamic value) {
    switch (value) {
      case 'BELOW_MINIMUM':
        return UsercentricsAgeBand.belowMinimum;
      case 'MINOR':
        return UsercentricsAgeBand.minor;
      case 'STANDARD':
        return UsercentricsAgeBand.standard;
    }
    return null;
  }

  static UsercentricsAgeSignalUnavailableReason? _deserializeUnavailableReason(
      dynamic value) {
    switch (value) {
      case 'DECLINED':
        return UsercentricsAgeSignalUnavailableReason.declined;
      case 'NOT_SHARED':
        return UsercentricsAgeSignalUnavailableReason.notShared;
      case 'VERIFICATION_REQUIRED':
        return UsercentricsAgeSignalUnavailableReason.verificationRequired;
      case 'UNSUPPORTED':
        return UsercentricsAgeSignalUnavailableReason.unsupported;
      case 'NOT_AVAILABLE':
        return UsercentricsAgeSignalUnavailableReason.notAvailable;
      case 'INVALID_REQUEST':
        return UsercentricsAgeSignalUnavailableReason.invalidRequest;
      case 'TRANSIENT_ERROR':
        return UsercentricsAgeSignalUnavailableReason.transientError;
      case 'TIMEOUT':
        return UsercentricsAgeSignalUnavailableReason.timeout;
      case 'ERROR':
        return UsercentricsAgeSignalUnavailableReason.error;
    }
    return null;
  }
}
