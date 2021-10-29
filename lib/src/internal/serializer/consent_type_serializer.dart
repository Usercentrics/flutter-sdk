import 'package:usercentrics_sdk/src/model/consent_type.dart';

class ConsentTypeSerializer {
  static UsercentricsConsentType? deserialize(dynamic value) {
    switch (value) {
      case 'IMPLICIT':
        return UsercentricsConsentType.implicit;
      case 'EXPLICIT':
        return UsercentricsConsentType.explicit;
    }
    return null;
  }

  static dynamic serialize(UsercentricsConsentType value) {
    switch (value) {
      case UsercentricsConsentType.implicit:
        return 'IMPLICIT';
      case UsercentricsConsentType.explicit:
        return 'EXPLICIT';
    }
  }
}
