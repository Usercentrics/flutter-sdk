import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/button_settings.dart';

class ButtonSettingsSerializer {
  static dynamic serialize(ButtonSettings? value) {
    return value == null
        ? null
        : {
            'type': _serializeButtonType(value.type),
            'isAllCaps': value.isAllCaps,
            'fontAssetPath': value.fontAssetPath,
            'textSize': value.textSize,
            'textColor': ColorSerializer.serialize(value.textColor),
            'backgroundColor': ColorSerializer.serialize(value.backgroundColor),
            'cornerRadius': value.cornerRadius,
          };
  }

  static dynamic _serializeButtonType(ButtonType? value) {
    switch (value) {
      case null:
        return null;
      case ButtonType.acceptAll:
        return 'ACCEPT_ALL';
      case ButtonType.denyAll:
        return 'DENY_ALL';
      case ButtonType.more:
        return 'MORE';
      case ButtonType.save:
        return 'SAVE';
    }
  }
}
