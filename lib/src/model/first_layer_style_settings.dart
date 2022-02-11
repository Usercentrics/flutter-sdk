import 'dart:ui';

import 'package:usercentrics_sdk/src/model/image.dart';

/// The First Layer Settings.
class FirstLayerStyleSettings {
  /// Creates a FirstLayerStyleSettings.
  const FirstLayerStyleSettings({
    this.headerImage,
    this.title,
    this.message,
    this.buttonLayout,
    this.backgroundColor,
    this.overlayColor,
    this.cornerRadius,
  });

  /// The header image settings.
  final HeaderImageSettings? headerImage;

  /// The title settings.
  final TitleSettings? title;

  /// The message settings.
  final MessageSettings? message;

  /// The button layout.
  final ButtonLayout? buttonLayout;

  /// The background color.
  final Color? backgroundColor;

  /// The overlay color. This overlay is shown behind the Popup/Sheet layout.
  final Color? overlayColor;

  /// The corner radious. This applies to the corners of the Popup/Sheet layout.
  final int? cornerRadius;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirstLayerStyleSettings &&
          runtimeType == other.runtimeType &&
          headerImage == other.headerImage &&
          title == other.title &&
          message == other.message &&
          buttonLayout == other.buttonLayout &&
          backgroundColor == other.backgroundColor &&
          overlayColor == other.overlayColor &&
          cornerRadius == other.cornerRadius;

  @override
  int get hashCode =>
      headerImage.hashCode +
      title.hashCode +
      message.hashCode +
      buttonLayout.hashCode +
      backgroundColor.hashCode +
      overlayColor.hashCode +
      cornerRadius.hashCode;

  @override
  String toString() =>
      "$FirstLayerStyleSettings(headerImage: $headerImage, title: $title, message: $message, buttonLayout: $buttonLayout, backgroundColor: $backgroundColor, overlayColor: $overlayColor, cornerRadius: $cornerRadius)";
}

/// The header image settings.
class HeaderImageSettings {
  const HeaderImageSettings._internal({
    this.image,
    this.height,
    this.isExtended,
    this.alignment,
    this.isHidden,
  });

  /// Creates a HeaderImageSettings with logo configuration.
  factory HeaderImageSettings.logo({
    required UsercentricsImage image,
    double? height,
    SectionAlignment? alignment,
  }) {
    return HeaderImageSettings._internal(
      image: image,
      height: height,
      alignment: alignment,
    );
  }

  /// Creates a HeaderImageSettings with extendend image configuration.
  factory HeaderImageSettings.extended({
    required UsercentricsImage image,
  }) {
    return HeaderImageSettings._internal(image: image, isExtended: true);
  }

  /// Creates a HeaderImageSettings with hidden configuration.
  factory HeaderImageSettings.hidden() {
    return const HeaderImageSettings._internal(isHidden: true);
  }

  /// Internal property.
  final UsercentricsImage? image;

  /// Internal property.
  final double? height;

  /// Internal property.
  final SectionAlignment? alignment;

  /// Internal property.
  final bool? isExtended;

  /// Internal property.
  final bool? isHidden;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeaderImageSettings &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          height == other.height &&
          alignment == other.alignment &&
          isExtended == other.isExtended &&
          isHidden == other.isHidden;

  @override
  int get hashCode =>
      image.hashCode +
      height.hashCode +
      alignment.hashCode +
      isExtended.hashCode +
      isHidden.hashCode;

  @override
  String toString() =>
      "$HeaderImageSettings(image: $image, height: $height, alignment: $alignment, isExtended: $isExtended, isHidden: $isHidden)";
}

enum SectionAlignment { start, center, end }

/// The title settings.
class TitleSettings {
  /// Creates a TitleSettings.
  ///   - The argument [fontAssetPath] is an asset font path. The font must be declared in the pubspec. E.g. 'fonts/Lora-VariableFont_wght.ttf' (from the example app).
  const TitleSettings({
    this.alignment,
    this.fontAssetPath,
    this.textColor,
    this.textSize,
  });

  /// The text alignment.
  final SectionAlignment? alignment;

  /// The font asset path. The font must be declared in the pubspec. E.g. 'fonts/Lora-VariableFont_wght.ttf' (from the example app).
  final String? fontAssetPath;

  /// The text color.
  final Color? textColor;

  /// The text size.
  final double? textSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitleSettings &&
          runtimeType == other.runtimeType &&
          alignment == other.alignment &&
          fontAssetPath == other.fontAssetPath &&
          textColor == other.textColor &&
          textSize == other.textSize;

  @override
  int get hashCode =>
      alignment.hashCode +
      fontAssetPath.hashCode +
      textColor.hashCode +
      textSize.hashCode;

  @override
  String toString() =>
      "$TitleSettings(alignment: $alignment, fontAssetPath: $fontAssetPath, textColor: $textColor, textSize: $textSize)";
}

/// The message settings.
class MessageSettings {
  /// Creates a MessageSettings.
  ///   - The argument [fontAssetPath] is an asset font path. The font must be declared in the pubspec. E.g. 'fonts/Lora-VariableFont_wght.ttf' (from the example app).
  const MessageSettings({
    this.alignment,
    this.fontAssetPath,
    this.textColor,
    this.linkTextColor,
    this.linkTextUnderline,
    this.textSize,
  });

  /// The text alignment.
  final SectionAlignment? alignment;

  /// The font asset path. The font must be declared in the pubspec. E.g. 'fonts/Lora-VariableFont_wght.ttf' (from the example app).
  final String? fontAssetPath;

  /// The text color.
  final Color? textColor;

  /// The link color.
  final Color? linkTextColor;

  /// True if links should be underlined, False if not.
  final bool? linkTextUnderline;

  /// The text size.
  final double? textSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageSettings &&
          runtimeType == other.runtimeType &&
          alignment == other.alignment &&
          fontAssetPath == other.fontAssetPath &&
          textColor == other.textColor &&
          linkTextColor == other.linkTextColor &&
          linkTextUnderline == other.linkTextUnderline &&
          textSize == other.textSize;

  @override
  int get hashCode =>
      alignment.hashCode +
      fontAssetPath.hashCode +
      textColor.hashCode +
      linkTextColor.hashCode +
      linkTextUnderline.hashCode +
      textSize.hashCode;

  @override
  String toString() =>
      "$MessageSettings(alignment: $alignment, fontAssetPath: $fontAssetPath, textColor: $textColor, linkTextColor: $linkTextColor, textSize: $textSize)";
}

/// The button settings.
class ButtonSettings {
  /// Creates a ButtonSettings.
  ///   - The argument [fontAssetPath] is an asset font path. The font must be declared in the pubspec. E.g. 'fonts/Lora-VariableFont_wght.ttf' (from the example app).
  const ButtonSettings({
    required this.type,
    this.backgroundColor,
    this.cornerRadius,
    this.fontAssetPath,
    this.isAllCaps,
    this.textColor,
    this.textSize,
  });

  /// The type of the button.
  final ButtonType type;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The corner radius.
  final int? cornerRadius;

  /// The font asset path. The font must be declared in the pubspec. E.g. 'fonts/Lora-VariableFont_wght.ttf' (from the example app).
  final String? fontAssetPath;

  /// The text caps strategy.
  final bool? isAllCaps;

  /// The text color.
  final Color? textColor;

  /// The text size.
  final double? textSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ButtonSettings &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          backgroundColor == other.backgroundColor &&
          cornerRadius == other.cornerRadius &&
          fontAssetPath == other.fontAssetPath &&
          isAllCaps == other.isAllCaps &&
          textColor == other.textColor &&
          textSize == other.textSize;

  @override
  int get hashCode =>
      type.hashCode +
      backgroundColor.hashCode +
      cornerRadius.hashCode +
      fontAssetPath.hashCode +
      isAllCaps.hashCode +
      textColor.hashCode +
      textSize.hashCode;

  @override
  String toString() => "$ButtonSettings(type: $type)";
}

enum ButtonType { acceptAll, denyAll, more, save }

/// The button layout.
class ButtonLayout {
  const ButtonLayout._internal({
    required this.buttons,
  });

  /// Creates a ButtonLayout with column configuration.
  factory ButtonLayout.column({
    required List<ButtonSettings> buttons,
  }) {
    return ButtonLayout._internal(
      buttons: buttons.map((row) => [row]).toList(),
    );
  }

  /// Creates a ButtonLayout with row configuration.
  factory ButtonLayout.row({
    required List<ButtonSettings> buttons,
  }) {
    return ButtonLayout._internal(
      buttons: [buttons],
    );
  }

  /// Creates a ButtonLayout with grid configuration.
  factory ButtonLayout.grid({
    required List<List<ButtonSettings>> buttons,
  }) {
    return ButtonLayout._internal(
      buttons: buttons,
    );
  }

  /// Internal property.
  final List<List<ButtonSettings>> buttons;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ButtonLayout &&
          runtimeType == other.runtimeType &&
          buttons == other.buttons;

  @override
  int get hashCode => buttons.hashCode;

  @override
  String toString() => "$ButtonLayout(buttons: $buttons)";
}
