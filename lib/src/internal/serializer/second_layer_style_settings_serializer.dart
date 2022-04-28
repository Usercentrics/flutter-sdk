import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/second_layer_style_settings.dart';

class SecondLayerStyleSettingsSerializer {
  static dynamic serialize(SecondLayerStyleSettings? value) => value == null
      ? null
      : {
          'showCloseButton': value.showCloseButton,
          'buttonLayout': value.buttonLayout?.buttons
              .map(
                (row) => row
                    .map((button) => ButtonSettingsSerializer.serialize(button))
                    .toList(),
              )
              .toList(),
        };
}
