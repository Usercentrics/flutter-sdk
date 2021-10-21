/// {@nodoc}
library ui_settings_serializer;

import 'package:usercentrics_sdk/model/custom_font.dart';
import 'package:usercentrics_sdk/model/custom_image.dart';

class UISettingsSerializer {
  static dynamic serialize({
    bool? showCloseButton,
    UsercentricsImage? customLogo,
    UsercentricsFont? customFont,
  }) =>
      {
        'showCloseButton': showCloseButton,
        'customLogo': customLogo?.assetPath,
        'customFont': _serializeFont(customFont),
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
