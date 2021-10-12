import 'package:usercentrics_sdk/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/model/ready_status.dart';

class ReadyStatusSerializer {
  static UsercentricsReadyStatus deserialize(dynamic value) {
    return UsercentricsReadyStatus(
        shouldShowCMP: value['shouldShowCMP'],
        consents: (value['consents'] as List)
            .map((e) => ConsentSerializer.deserialize(e))
            .toList());
  }
}
