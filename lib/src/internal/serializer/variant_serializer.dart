import 'package:usercentrics_sdk/src/model/variant.dart';

class VariantSerializer {
  static UsercentricsVariant? deserialize(dynamic value) {
    switch (value) {
      case 'DEFAULT':
        return UsercentricsVariant.default_;
      case 'TCF':
        return UsercentricsVariant.tcf;
      case 'CCPA':
        return UsercentricsVariant.ccpa;
    }
    return null;
  }
}
