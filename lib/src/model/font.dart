/// An asset font that Usercentrics can load.
/// It consists of a [regularFontAssetPath], a [boldFontAssetPath] and [fontSize].
class BannerFont {
  /// Creates a Usercentrics font.
  ///
  /// - The argument [regularFontAssetPath] is an asset font path. The font must be declared in the pubspec. E.g. 'fonts/Lora-Regular.ttf' (from the example app).
  /// - The argument [boldFontAssetPath] is an asset font path. The font must be declared in the pubspec. E.g. 'fonts/Lora-Bold.ttf' (from the example app).
  /// - The argument [fontSize] is a platform logical pixel font size. The size will be treated as a text size, so it will be adjusted for both the screen density and the user’s preference for text.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// UsercentricsFont(
  ///   regularFontAssetPath: 'fonts/Lora-Regular.ttf',
  ///   boldFontAssetPath: 'fonts/Lora-Bold.ttf',
  ///   fontSize: 15,
  /// )
  /// ```
  /// {@end-tool}
  const BannerFont({
    required this.regularFontAssetPath,
    required this.boldFontAssetPath,
    required this.fontSize,
  });

  /// An asset font path.
  final String regularFontAssetPath;

  /// An asset font path.
  final String boldFontAssetPath;

  /// A platform logical pixel font size.
  final double fontSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerFont &&
          runtimeType == other.runtimeType &&
          regularFontAssetPath == other.regularFontAssetPath &&
          boldFontAssetPath == other.boldFontAssetPath &&
          fontSize == other.fontSize;

  @override
  int get hashCode =>
      regularFontAssetPath.hashCode +
      boldFontAssetPath.hashCode +
      fontSize.hashCode;

  @override
  String toString() =>
      "$BannerFont(regularFontAssetPath: $regularFontAssetPath, boldFontAssetPath: $boldFontAssetPath, fontSize: $fontSize)";
}
