import 'package:flutter/foundation.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

/// The current status of the user.
class UsercentricsReadyStatus {
  const UsercentricsReadyStatus({
    required this.shouldCollectConsent,
    required this.consents,
    required this.geolocationRuleset,
    required this.location,
  });

  /// True, if consent has never been collected or some service has changed thus requiring a consent update. False, if consent has been collected and no update is required.
  final bool shouldCollectConsent;

  /// List of services with consent choices.
  final List<UsercentricsServiceConsent> consents;

  /// Object containing information about Geolocation Rulesets, when enabled in the account
  final GeolocationRuleset? geolocationRuleset;

  /// Current location of User */
  final UsercentricsLocation location;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsReadyStatus &&
          runtimeType == other.runtimeType &&
          shouldCollectConsent == other.shouldCollectConsent &&
          listEquals(consents, other.consents) &&
          geolocationRuleset == other.geolocationRuleset &&
          location == other.location;

  @override
  int get hashCode =>
      shouldCollectConsent.hashCode +
      consents.hashCode +
      geolocationRuleset.hashCode +
      location.hashCode;

  @override
  String toString() =>
      "UsercentricsReadyStatus(shouldCollectConsent: $shouldCollectConsent, consents: $consents, geolocationRuleSet: $geolocationRuleset, location: $location)";
}

class GeolocationRuleset {
  const GeolocationRuleset({
    required this.activeSettingsId,
    required this.bannerRequiredAtLocation,
  });

  final String activeSettingsId;
  final bool bannerRequiredAtLocation;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeolocationRuleset &&
          runtimeType == other.runtimeType &&
          activeSettingsId == other.activeSettingsId &&
          bannerRequiredAtLocation == other.bannerRequiredAtLocation;

  @override
  int get hashCode =>
      activeSettingsId.hashCode ^ bannerRequiredAtLocation.hashCode;

  @override
  String toString() {
    return 'GeolocationRuleset{activeSettingsId: $activeSettingsId, bannerRequiredAtLocation: $bannerRequiredAtLocation}';
  }
}
