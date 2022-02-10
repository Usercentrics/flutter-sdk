import 'dart:ui';

import 'package:usercentrics_sdk/src/model/first_layer_style_settings.dart';

class FirstLayerStyleSettingsSerializer {
  static dynamic serialize(FirstLayerStyleSettings? value) => value == null
      ? null
      : {
          'headerImage': _serializeHeader(value.headerImage),
          'title': _serializeTitle(value.title),
          'message': _serializeMessage(value.message),
          'buttonLayout': value.buttonLayout?.buttons
              .map(
                (row) => row
                    .map((button) => _serializeButtonSettings(button))
                    .toList(),
              )
              .toList(),
          'backgroundColor': _serializeColor(value.backgroundColor),
          'overlayColor': _serializeColor(value.overlayColor),
          'cornerRadius': value.cornerRadius,
        };

  static dynamic _serializeHeader(HeaderImageSettings? value) => value == null
      ? null
      : {
          'image': value.image?.assetPath,
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
          'textColor': _serializeColor(value.textColor),
          'textSize': value.textSize,
        };

  static dynamic _serializeMessage(MessageSettings? value) {
    return value == null
        ? null
        : {
            'alignment': _serializeAlignment(value.alignment),
            'fontAssetPath': value.fontAssetPath,
            'textColor': _serializeColor(value.textColor),
            'linkTextColor': _serializeColor(value.linkTextColor),
            'textSize': value.textSize,
          };
  }

  static dynamic _serializeButtonSettings(ButtonSettings? value) {
    return value == null
        ? null
        : {
            'type': _serializeButtonType(value.type),
            'isAllCaps': value.isAllCaps,
            'fontAssetPath': value.fontAssetPath,
            'textSize': value.textSize,
            'textColor': _serializeColor(value.textColor),
            'backgroundColor': _serializeColor(value.backgroundColor),
            'cornerRadius': value.cornerRadius,
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

  static dynamic _serializeColor(Color? value) => value?.toHex();
}

extension _HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
