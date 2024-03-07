import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/ready_status.dart';

class ReadyStatusSerializer {
  static UsercentricsReadyStatus deserialize(dynamic value) {
    return UsercentricsReadyStatus(
        shouldCollectConsent: value['shouldCollectConsent'],
        consents: (value['consents'] as List)
            .map((e) => ConsentSerializer.deserialize(e))
            .toList(),
        geolocationRuleset: GeolocationRulesetSerializer.deserialize(
            value['geolocationRuleset']),
        location: LocationSerializer.deserialize(value['location']));
  }
}

class GeolocationRulesetSerializer {
  static GeolocationRuleset? deserialize(dynamic value) {
    return value == null
        ? null
        : GeolocationRuleset(
        activeSettingsId: value["activeSettingsId"],
        bannerRequiredAtLocation: value["bannerRequiredAtLocation"]);
  }
}