import 'package:usercentrics_sdk/src/model/user_interaction.dart';

class UserInteractionSerializer {
  static UsercentricsUserInteraction? deserialize(dynamic value) {
    switch (value) {
      case 'ACCEPT_ALL':
        return UsercentricsUserInteraction.acceptAll;
      case 'DENY_ALL':
        return UsercentricsUserInteraction.denyAll;
      case 'GRANULAR':
        return UsercentricsUserInteraction.granular;
      case 'NO_INTERACTION':
        return UsercentricsUserInteraction.noInteraction;
    }
    return null;
  }
}
