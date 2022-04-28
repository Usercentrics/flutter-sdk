import 'package:usercentrics_sdk/src/model/first_layer_style_settings.dart';
import 'package:usercentrics_sdk/src/model/font.dart';
import 'package:usercentrics_sdk/src/model/image.dart';
import 'package:usercentrics_sdk/src/model/legal_links_settings.dart';

import '../../model/second_layer_style_settings.dart';
import '../internal.dart';

class BannerSettingsSerializer {
  static dynamic serialize({
    BannerImage? logo,
    BannerFont? font,
    LegalLinksSettings? links,
    FirstLayerStyleSettings? firstLayerSettings,
    SecondLayerStyleSettings? secondLayerSettings,
  }) =>
      {
        'logo': logo?.assetPath,
        'font': _serializeFont(font),
        'links': LegalLinksSettingsSerializer.serialize(links),
        'firstLayerSettings':
            FirstLayerStyleSettingsSerializer.serialize(firstLayerSettings),
        'secondLayerSettings':
            SecondLayerStyleSettingsSerializer.serialize(secondLayerSettings),
      };

  static dynamic _serializeFont(BannerFont? customFont) {
    return customFont == null
        ? null
        : {
            'regularFontAssetPath': customFont.regularFontAssetPath,
            'boldFontAssetPath': customFont.boldFontAssetPath,
            'fontSize': customFont.fontSize,
          };
  }
}
