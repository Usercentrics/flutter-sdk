import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/internal/serializer/general_style_settings_serializer.dart';
import 'package:usercentrics_sdk/src/model/banner_settings.dart';
import 'package:usercentrics_sdk/src/model/layout.dart';

class BannerSettingsSerializer {
  static dynamic serialize(
    BannerSettings? settings,
    UsercentricsLayout? legacyLayout,
  ) =>
      {
        'firstLayerStyleSettings': FirstLayerStyleSettingsSerializer.serialize(
          settings?.firstLayer,
          legacyLayout,
        ),
        'secondLayerStyleSettings':
            SecondLayerStyleSettingsSerializer.serialize(settings?.secondLayer),
        'generalStyleSettings':
            GeneralStyleSettingsSerializer.serialize(settings?.general),
        'variant': settings?.variant,
      };
}
