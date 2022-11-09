import 'package:usercentrics_sdk/src/model/first_layer_style_settings.dart';
import 'package:usercentrics_sdk/src/model/general_style_settings.dart';

import '../../model/second_layer_style_settings.dart';
import '../internal.dart';
import 'general_style_settings_serializer.dart';

class BannerSettingsSerializer {
  static dynamic serialize({
    GeneralStyleSettings? generalStyleSettings,
    FirstLayerStyleSettings? firstLayerSettings,
    SecondLayerStyleSettings? secondLayerSettings,
    String? variant
  }) =>
      {
        'firstLayerStyleSettings':
            FirstLayerStyleSettingsSerializer.serialize(firstLayerSettings),
        'secondLayerStyleSettings':
            SecondLayerStyleSettingsSerializer.serialize(secondLayerSettings),
        'generalStyleSettings':
            GeneralStyleSettingsSerializer.serialize(generalStyleSettings),
        'variant': variant
      };
}
