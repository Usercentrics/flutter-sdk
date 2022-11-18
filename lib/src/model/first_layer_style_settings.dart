import 'dart:ui';

import 'package:usercentrics_sdk/src/model/button_settings.dart';
import 'package:usercentrics_sdk/src/model/layout.dart';

/// The First Layer Settings.
class FirstLayerStyleSettings {
  /// Creates a FirstLayerStyleSettings.
  const FirstLayerStyleSettings({
    this.layout,
    this.headerImage,
    this.title,
    this.message,
    this.buttonLayout,
    this.backgroundColor,
    this.overlayColor,
    this.cornerRadius,
  });

  /// The banner layout settings.
  final UsercentricsLayout? layout;

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
          layout == other.layout &&
          headerImage == other.headerImage &&
          title == other.title &&
          message == other.message &&
          buttonLayout == other.buttonLayout &&
          backgroundColor == other.backgroundColor &&
          overlayColor == other.overlayColor &&
          cornerRadius == other.cornerRadius;

  @override
  int get hashCode =>
      layout.hashCode +
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
    this.imageAssetPath,
    this.height,
    this.isExtended,
    this.alignment,
    this.isHidden,
  });

  /// Creates a HeaderImageSettings with logo configuration.
  /// The argument [imageAssetPath] is an asset image path. This image must be declared in the pubspec. E.g. 'images/flutter-logo.png' (from the example app).
  factory HeaderImageSettings.logo({
    required String imageAssetPath,
    double? height,
    SectionAlignment? alignment,
  }) {
    return HeaderImageSettings._internal(
      imageAssetPath: imageAssetPath,
      height: height,
      alignment: alignment,
    );
  }

  /// Creates a HeaderImageSettings with extendend image configuration.
  /// The argument [imageAssetPath] is an asset image path. This image must be declared in the pubspec. E.g. 'images/flutter-logo.png' (from the example app).
  factory HeaderImageSettings.extended({
    required String imageAssetPath,
  }) {
    return HeaderImageSettings._internal(
        imageAssetPath: imageAssetPath, isExtended: true);
  }

  /// Creates a HeaderImageSettings with hidden configuration.
  factory HeaderImageSettings.hidden() {
    return const HeaderImageSettings._internal(isHidden: true);
  }

  /// Internal property.
  final String? imageAssetPath;

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
          imageAssetPath == other.imageAssetPath &&
          height == other.height &&
          alignment == other.alignment &&
          isExtended == other.isExtended &&
          isHidden == other.isHidden;

  @override
  int get hashCode =>
      imageAssetPath.hashCode +
      height.hashCode +
      alignment.hashCode +
      isExtended.hashCode +
      isHidden.hashCode;

  @override
  String toString() =>
      "$HeaderImageSettings(imageAssetPath: $imageAssetPath, height: $height, alignment: $alignment, isExtended: $isExtended, isHidden: $isHidden)";
}

enum SectionAlignment { start, center, end }

/// The title settings.
class TitleSettings {
  /// Creates a TitleSettings.
  ///   - The argument [fontAssetPath] is an asset font path. The font must be declared in the pubspec. E.g. 'fonts/Lora-Bold.ttf' (from the example app).
  const TitleSettings({
    this.alignment,
    this.fontAssetPath,
    this.textColor,
    this.textSize,
  });

  /// The text alignment.
  final SectionAlignment? alignment;

  /// The font asset path. The font must be declared in the pubspec. E.g. 'fonts/Lora-Bold.ttf' (from the example app).
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
  ///   - The argument [fontAssetPath] is an asset font path. The font must be declared in the pubspec. E.g. 'fonts/Lora-Bold.ttf' (from the example app).
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

  /// The font asset path. The font must be declared in the pubspec. E.g. 'fonts/Lora-Bold.ttf' (from the example app).
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
