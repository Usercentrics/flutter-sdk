import 'package:usercentrics_sdk/model/consent_type.dart';

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
}
