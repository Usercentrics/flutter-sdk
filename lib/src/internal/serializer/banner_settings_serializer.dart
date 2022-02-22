import 'package:usercentrics_sdk/src/model/font.dart';
import 'package:usercentrics_sdk/src/model/image.dart';

class BannerSettingsSerializer {
  static dynamic serialize({
    BannerImage? logo,
    BannerFont? font,
  }) =>
      {
        'logo': logo?.assetPath,
        'font': _serializeFont(font),
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
