import 'package:usercentrics_sdk/src/model/font.dart';
import 'package:usercentrics_sdk/src/model/image.dart';

class BannerSettingsSerializer {
  static dynamic serialize({
    UsercentricsImage? logo,
    UsercentricsFont? font,
  }) =>
      {
        'logo': logo?.assetPath,
        'font': _serializeFont(font),
      };

  static dynamic _serializeFont(UsercentricsFont? customFont) {
    return customFont == null
        ? null
        : {
            'fontAssetPath': customFont.fontAssetPath,
            'fontSize': customFont.fontSize,
          };
  }
}
