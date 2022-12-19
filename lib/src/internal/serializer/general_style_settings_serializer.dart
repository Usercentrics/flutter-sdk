import 'package:usercentrics_sdk/src/internal/serializer/color_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/legal_links_settings_serializer.dart';
import 'package:usercentrics_sdk/src/internal/serializer/toggle_style_settings_serializer.dart';
import 'package:usercentrics_sdk/src/model/font.dart';
import 'package:usercentrics_sdk/src/model/general_style_settings.dart';

class GeneralStyleSettingsSerializer {
  static dynamic serialize(GeneralStyleSettings? value) => value == null
      ? null
      : {
          'textColor': ColorSerializer.serialize(value.textColor),
          'layerBackgroundColor':
              ColorSerializer.serialize(value.layerBackgroundColor),
          'layerBackgroundSecondaryColor':
              ColorSerializer.serialize(value.layerBackgroundSecondaryColor),
          'linkColor': ColorSerializer.serialize(value.linkColor),
          'tabColor': ColorSerializer.serialize(value.tabColor),
          'bordersColor': ColorSerializer.serialize(value.bordersColor),
          'toggleStyleSettings': ToggleStyleSettingsSerializer.serialize(
              value.toggleStyleSettings),
          'font': _serializeFont(value.font),
          'logo': value.logo?.assetPath,
          'links': LegalLinksSettingsSerializer.serialize(value.links),
          'disableSystemBackButton' : value.disableSystemBackButton,
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
