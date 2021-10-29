import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/src/model/service_consent.dart';
import 'package:usercentrics_sdk/src/model/user_interaction.dart';

/// The response of the user to the CMP.
class UsercentricsConsentUserResponse {
  const UsercentricsConsentUserResponse({
    required this.consents,
    required this.controllerId,
    required this.userInteraction,
  });

  /// List of services with consent choices.
  final List<UsercentricsServiceConsent> consents;

  /// A Usercentrics generated ID, used to identify a user's consent history.
  final String controllerId;

  /// The interaction that the user has performed to answer the CMP.
  final UsercentricsUserInteraction userInteraction;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsConsentUserResponse &&
          runtimeType == other.runtimeType &&
          controllerId == other.controllerId &&
          userInteraction == other.userInteraction &&
          listEquals(consents, other.consents);

  @override
  int get hashCode =>
      consents.hashCode + controllerId.hashCode + userInteraction.hashCode;

  @override
  String toString() =>
      "$UsercentricsConsentUserResponse(controllerId: $controllerId, userInteraction: $userInteraction, consents: $consents)";
}
