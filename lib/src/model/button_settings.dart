import 'dart:ui';

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

/// The button settings.
class ButtonSettings {
  /// Creates a ButtonSettings.
  ///   - The argument [fontAssetPath] is an asset font path. The font must be declared in the pubspec. E.g. 'fonts/Lora-Bold.ttf' (from the example app).
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

  /// The font asset path. The font must be declared in the pubspec. E.g. 'fonts/Lora-Bold.ttf' (from the example app).
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
