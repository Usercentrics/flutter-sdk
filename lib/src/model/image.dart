/// It consists of a [assetPath].
class BannerImage {
  /// Creates an image.
  ///
  /// The argument [assetPath] is an asset image path. This image must be declared in the pubspec. E.g. 'images/flutter-logo.png' (from the example app).
  /// {@tool snippet}
  ///
  /// ```dart
  /// BannerImage(
  ///   assetPath: 'images/flutter-logo.png',
  /// )
  /// ```
  /// {@end-tool}
  const BannerImage({
    required this.assetPath,
  });

  /// An asset image path.
  final String assetPath;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerImage &&
          runtimeType == other.runtimeType &&
          assetPath == other.assetPath;

  @override
  int get hashCode => assetPath.hashCode;

  @override
  String toString() => "$BannerImage(assetPath: $assetPath)";
}
