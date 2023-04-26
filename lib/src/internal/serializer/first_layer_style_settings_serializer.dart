import 'package:usercentrics_sdk/src/internal/internal.dart';
import 'package:usercentrics_sdk/src/model/first_layer_style_settings.dart';

class FirstLayerStyleSettingsSerializer {
  static dynamic serialize(FirstLayerStyleSettings? value) => value == null
      ? null
      : {
          'layout': LayoutSerializer.serialize(value.layout),
          'headerImage': _serializeHeader(value.headerImage),
          'title': _serializeTitle(value.title),
          'message': _serializeMessage(value.message),
          'buttonLayout': value.buttonLayout?.buttons
              .map(
                (row) => row
                    .map((button) => ButtonSettingsSerializer.serialize(button))
                    .toList(),
              )
              .toList(),
          'backgroundColor': ColorSerializer.serialize(value.backgroundColor),
          'overlayColor': ColorSerializer.serialize(value.overlayColor),
          'cornerRadius': value.cornerRadius,
        };

  static dynamic _serializeHeader(HeaderImageSettings? value) => value == null
      ? null
      : {
          'image': value.imageAssetPath,
          'height': value.height,
          'isExtended': value.isExtended,
          'isHidden': value.isHidden,
          'alignment': _serializeAlignment(value.alignment),
        };

  static dynamic _serializeTitle(TitleSettings? value) => value == null
      ? null
      : {
          'alignment': _serializeAlignment(value.alignment),
          'fontAssetPath': value.fontAssetPath,
          'textColor': ColorSerializer.serialize(value.textColor),
          'textSize': value.textSize,
        };

  static dynamic _serializeMessage(MessageSettings? value) {
    return value == null
        ? null
        : {
            'alignment': _serializeAlignment(value.alignment),
            'fontAssetPath': value.fontAssetPath,
            'textColor': ColorSerializer.serialize(value.textColor),
            'linkTextColor': ColorSerializer.serialize(value.linkTextColor),
            'linkTextUnderline': value.linkTextUnderline,
            'textSize': value.textSize,
          };
  }

  static dynamic _serializeAlignment(SectionAlignment? value) {
    switch (value) {
      case null:
        return null;
      case SectionAlignment.start:
        return 'START';
      case SectionAlignment.center:
        return 'CENTER';
      case SectionAlignment.end:
        return 'END';
    }
  }
}
