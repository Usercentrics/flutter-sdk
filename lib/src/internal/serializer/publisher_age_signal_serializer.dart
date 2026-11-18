import 'package:usercentrics_sdk/src/model/publisher_age_signal.dart';

class PublisherAgeSignalSerializer {
  // Every key is always sent, the ones that a kind does not use are null.
  static dynamic serialize(UsercentricsPublisherAgeSignal value) => {
        'kind': _serializeKind(value.kind),
        'age': value.age,
        'lower': value.lower,
        'upper': value.upper,
        'sourceLabel': value.sourceLabel,
      };

  static dynamic _serializeKind(UsercentricsPublisherAgeSignalKind value) {
    switch (value) {
      case UsercentricsPublisherAgeSignalKind.atLeast:
        return 'atLeast';
      case UsercentricsPublisherAgeSignalKind.below:
        return 'below';
      case UsercentricsPublisherAgeSignalKind.between:
        return 'between';
    }
  }
}
