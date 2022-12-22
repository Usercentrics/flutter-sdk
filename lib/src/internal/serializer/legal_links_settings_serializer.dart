import 'package:usercentrics_sdk/src/model/legal_links_settings.dart';

class LegalLinksSettingsSerializer {
  static dynamic serialize(LegalLinksSettings? value) {
    switch (value) {
      case null:
        return null;
      case LegalLinksSettings.firstLayerOnly:
        return 'FIRST_LAYER_ONLY';
      case LegalLinksSettings.secondLayerOnly:
        return 'SECOND_LAYER_ONLY';
      case LegalLinksSettings.both:
        return 'BOTH';
      case LegalLinksSettings.hidden:
        return 'HIDDEN';
    }
  }
}
