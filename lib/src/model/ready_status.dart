import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';

/// The current status of the user.
class UsercentricsReadyStatus {
  const UsercentricsReadyStatus({
    required this.shouldShowCMP,
    required this.consents,
  });

  /// True, if consent has never been collected or some service has changed thus requiring a consent update. False, if consent has been collected and no update is required.
  final bool shouldShowCMP;

  /// List of services with consent choices.
  final List<UsercentricsServiceConsent> consents;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsReadyStatus &&
          runtimeType == other.runtimeType &&
          shouldShowCMP == other.shouldShowCMP &&
          listEquals(consents, other.consents);

  @override
  int get hashCode => shouldShowCMP.hashCode + consents.hashCode;

  @override
  String toString() =>
      "$UsercentricsReadyStatus(shouldShowCMP: $shouldShowCMP, consents: $consents)";
}
