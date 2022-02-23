import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';

/// The current status of the user.
class UsercentricsReadyStatus {
  const UsercentricsReadyStatus({
    required this.shouldCollectConsent,
    required this.consents,
  });

  /// True, if consent has never been collected or some service has changed thus requiring a consent update. False, if consent has been collected and no update is required.
  final bool shouldCollectConsent;

  /// List of services with consent choices.
  final List<UsercentricsServiceConsent> consents;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsReadyStatus &&
          runtimeType == other.runtimeType &&
          shouldCollectConsent == other.shouldCollectConsent &&
          listEquals(consents, other.consents);

  @override
  int get hashCode => shouldCollectConsent.hashCode + consents.hashCode;

  @override
  String toString() =>
      "$UsercentricsReadyStatus(shouldCollectConsent: $shouldCollectConsent, consents: $consents)";
}
