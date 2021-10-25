/// An asset image that Usercentrics can load.
/// It consists of a [assetPath].
class UsercentricsImage {
  /// Creates a Usercentrics image.
  ///
  /// The argument [assetPath] is an asset image path. This image must be declared in the pubspec. E.g. 'images/flutter-logo.png' (from the example app).
  /// {@tool snippet}
  ///
  /// ```dart
  /// UsercentricsImage(
  ///   assetPath: 'images/flutter-logo.png',
  /// )
  /// ```
  /// {@end-tool}
  const UsercentricsImage({
    required this.assetPath,
  });

  /// An asset image path.
  final String assetPath;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercentricsImage &&
          runtimeType == other.runtimeType &&
          assetPath == other.assetPath;

  @override
  int get hashCode => assetPath.hashCode;

  @override
  String toString() => "$UsercentricsImage(assetPath: $assetPath)";
}
