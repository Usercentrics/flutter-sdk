/// An asset font that Usercentrics can load.
/// It consists of a [fontAssetPath] and [fontSize].
class UsercentricsFont {
  /// Creates a Usercentrics font.
  ///
  /// - The argument [fontAssetPath] is an asset font path. The font must be declared in the pubspec. E.g. 'fonts/Lora-VariableFont_wght.ttf' (from the example app).
  /// - The argument [fontSize] is a platform logical pixel font size. The size will be treated as a text size, so it will be adjusted for both the screen density and the user’s preference for text.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// UsercentricsFont(
  ///   fontAssetPath: 'fonts/Lora-VariableFont_wght.ttf',
  ///   fontSize: 15,
  /// )
  /// ```
  /// {@end-tool}
  const UsercentricsFont({
    required this.fontAssetPath,
    required this.fontSize,
  });

  /// An asset font path.
  final String fontAssetPath;

  /// A platform logical pixel font size.
  final double fontSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsFont &&
          runtimeType == other.runtimeType &&
          fontAssetPath == other.fontAssetPath &&
          fontSize == other.fontSize;

  @override
  int get hashCode => fontAssetPath.hashCode + fontSize.hashCode;

  @override
  String toString() =>
      "$UsercentricsFont(fontAssetPath: $fontAssetPath, fontSize: $fontSize)";
}
