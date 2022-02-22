import 'package:usercentrics_sdk/src/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/src/model/ready_status.dart';

class ReadyStatusSerializer {
  static UsercentricsReadyStatus deserialize(dynamic value) {
    return UsercentricsReadyStatus(
        shouldCollectConsent: value['shouldCollectConsent'],
        consents: (value['consents'] as List)
            .map((e) => ConsentSerializer.deserialize(e))
            .toList());
  }
}
