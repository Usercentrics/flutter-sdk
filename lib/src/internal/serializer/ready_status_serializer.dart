import 'package:usercentrics_sdk/src/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/src/model/ready_status.dart';

class ReadyStatusSerializer {
  static UsercentricsReadyStatus deserialize(dynamic value) {
    return UsercentricsReadyStatus(
        shouldShowCMP: value['shouldShowCMP'],
        consents: (value['consents'] as List)
            .map((e) => ConsentSerializer.deserialize(e))
            .toList());
  }
}
