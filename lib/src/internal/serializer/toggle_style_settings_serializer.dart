import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/general_style_settings.dart';

class ToggleStyleSettingsSerializer {
  static dynamic serialize(ToggleStyleSettings? value) => value == null
      ? null
      : {
          'activeBackgroundColor':
              ColorSerializer.serialize(value.activeBackgroundColor),
          'inactiveBackgroundColor':
              ColorSerializer.serialize(value.inactiveBackgroundColor),
          'disabledBackgroundColor':
              ColorSerializer.serialize(value.disabledBackgroundColor),
          'activeThumbColor': ColorSerializer.serialize(value.activeThumbColor),
          'inactiveThumbColor':
              ColorSerializer.serialize(value.inactiveThumbColor),
          'disabledThumbColor':
              ColorSerializer.serialize(value.disabledThumbColor),
        };
}
