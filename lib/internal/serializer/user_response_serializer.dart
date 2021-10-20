import 'package:usercentrics_sdk/internal/serializer/consent_serializer.dart';
import 'package:usercentrics_sdk/internal/serializer/user_interaction_serializer.dart';
import 'package:usercentrics_sdk/model/user_response.dart';

class UserResponseSerializer {
  static UsercentricsConsentUserResponse deserialize(dynamic value) {
    return UsercentricsConsentUserResponse(
        controllerId: value['controllerId'],
        userInteraction:
            UserInteractionSerializer.deserialize(value['userInteraction'])!,
        consents: (value['consents'] as List)
            .map((e) => ConsentSerializer.deserialize(e))
            .toList());
  }
}
