import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/model/service_consent.dart';
import 'package:usercentrics_sdk/model/user_interaction.dart';

class UsercentricsConsentUserResponse {
  const UsercentricsConsentUserResponse({
    required this.consents,
    required this.controllerId,
    required this.userInteraction,
  });

  final List<UsercentricsServiceConsent> consents;
  final String controllerId;
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
